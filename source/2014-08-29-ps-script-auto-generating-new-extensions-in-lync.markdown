---
title: PS Script&#58; Auto Generating New Extensions in Lync
date: 2014-08-29 09:01:02 +0100
tags: Lync
author: alanmcburney
---

This a script I’ve been meaning to put together for a while in order to find free extensions within a given extension range in Lync.

Within Lync I assign all enterprise voice users with a phone number and extension.  
Some users have a DDI assigned whilst others use the base office number with an extension.

Each office has its own extensions range

100 – 109 HQ response Groups  
110 – 299 HQ Users  
300 – 399 Branch Office 1  
400 – 499 Branch Office 2

Over time and depending on who activates new staff members the extensions tend to get out of sequence, so finding the next available extension within a range can be tedious.

The Get-FreeExtensions.ps1 script makes finding available extensions a lot easier.

The script has 3 parameters:  
ExtensionsReuired  
ExtRangeStart  
ExtRangeEnd

ExtensionsReuired is the number of extensions that are needed within a given range, where ExtRangeStart and ExtRangeEnd define the range.

The script is run as the example below in order to generate 5 free extensions within the range 110 to 299

Get-FreeExtensions.ps1 -ExtensionsRequired 5 -ExtRangeStart 110 -ExtRangeEnd 299

The script will always find the free extensions in ascending numerical order

<# .SYNOPSIS Finds free extensions within a given range  .Author Alan.McBurney  THIS CODE IS MADE AVAILABLE AS IS, WITHOUT WARRANTY OF ANY KIND. THE ENTIRE RISK OF THE USE OR THE RESULTS FROM THE USE OF THIS CODE REMAINS WITH THE USER.  Version 1.0, August 28th, 2014  .Description This script will find the next available extension(s) within a given extension range. The script searches for extensions across: Users RgsWorkflows AnalogDevices CommonAreaPhones Unified Messaging MeetingRooms The script will also throw a warning if the number of required extensions are not available within the given range.  .Parameter -ExtensionsRequired This is the number of free extensions that are required  .Parameter -ExtRangeStart This is the start of the range to query  .Parameter -ExtRangeEnd This is the end of the Range to query  .Example Get-FreeExtensions.ps1 -ExtensionsRequired 5 -ExtRangeStart 100 -ExtRangeEnd 199 #> param ( [parameter(Position=1,Mandatory=$true,ValueFromPipeline=$false,HelpMessage='Number of Extensions Required')][int]$ExtensionsRequired, [parameter(Position=2,Mandatory=$true,ValueFromPipeline=$false,HelpMessage='Extension Range')][int]$ExtRangeStart, [parameter(Position=2,Mandatory=$true,ValueFromPipeline=$false,HelpMessage='Extension Range')][int]$ExtRangeEnd )  #Check to Ensure Lync Module is loaded or can be loaded Function Get-MyModule { Param([String]$Name) if (-not(Get-Module -name $Name)) { if(Get-Module -ListAvailable | Where-Object {$\_.Name -eq $Name}) { Import-Module -Name $Name } else { Write-Host $Name PowerShell Module Not Available -ForegroundColor Red } } }  Get-MyModule -Name Lync  Function Get-LyncExtensions { $Extensions = @() $Extensions += (Get-CsUser).LineURI | Where-Object {$\_ -match "="} $Extensions += (Get-CsUser).PrivateNumber | Where-Object {$\_ -match "="} $Extensions += (Get-CsRgsWorkflow).LineURI | Where-Object {$\_ -match "="} $Extensions += (Get-CsAnalogDevice).LineURI | Where-Object {$\_ -match "="} $Extensions += (Get-CsCommonAreaPhone).LineURI | Where-Object {$\_ -match "="} $Extensions += (Get-CsExUMContact).LineURI | Where-Object {$\_ -match "="} $Extensions += (Get-CsMeetingRoom).LineURI | Where-Object {$\_ -match "="} $Extensions -replace [regex] "^tel:\+\d\*;ext=" | Sort }  $UnUsedCount = 0 $ExtRange = ($ExtRangeStart..$ExtRangeEnd) $FreeExt = @() $UsedExt = Get-LyncExtensions $CompareUsed = Compare-Object $UsedExt $ExtRange  foreach ($ext in $CompareUsed) { if($ext.sideIndicator -eq "=>") {$FreeExt+=$ext.inputobject;$UnUsedCount++} }  if ($ExtRangeStart -gt $ExtRangeEnd) { Write-Host "Extension End Range must be equal or greater to Extension Start Range" -ForegroundColor Yellow } elseif ($ExtensionsRequired -gt $ExtRange.Count) { Write-Host "Extensions Required is greater than Specifed Extensions Range. Please ammend the Extension Range End parameter" -ForegroundColor Yellow } elseif ($ExtensionsRequired -gt $UnUsedCount) { Write-Host "Not enough free extensions within the specified range $ExtRangeStart-$ExtRangeEnd Maximum is $UnUsedCount" -ForegroundColor Yellow } else { $FreeExt | Select -First $ExtensionsRequired }  
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/718/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/718/) ![](http://pixel.wp.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=718&subd=everythingsysadmin&ref=&feed=1)
