---
title: Automating PowerShell Connection to Office 365
date: 2014-08-18 15:45:00 +0100
tags: Office 365
author: alanmcburney
---

Connecting to Office 365 manually can be a bit of a chore especially if you need to do it on a regular basis, so why not automate the task.

Be sure the following components have been installed on your system before attempting this.

  - Azure Active Directory Module for Windows PowerShell
  - Microsoft Online Services Sign-In Assistant

In order to automate the task, credentials are exported to an XML file.

**_Get-Credential _** [_user@domain.com_](mailto:user@domain.com)**_ | Export-Clixml $env:USERPROFILE\Documents\MyO365Creds.xml_**

The cool thing about exporting the credentials used to connect to 365 using the Export-Clixml command is that the credentials are automatically encrypted within the file using [DPAPI](http://msdn.microsoft.com/en-us/library/ms995355.aspx) and can only by decrypted by the person who originally saved it.

[ ![image](https://everythingsysadmin.files.wordpress.com/2014/08/image_thumb.png?w=244&h=128 "image") ](https://everythingsysadmin.files.wordpress.com/2014/08/image.png) 

The final piece of the automation process is adding this into your PowerShell profile  
First test to see if a profile exists

**_Test-Path $Profile_**

Running the above command will return either a True or False value.  
True being that the profile exists, false that it doesn’t

If the return value is false then in order to create the profile run the code below

**_New-Item -Type File -Path $Profile_**

[ ![image](https://everythingsysadmin.files.wordpress.com/2014/08/image_thumb1.png?w=244&h=114 "image") ](https://everythingsysadmin.files.wordpress.com/2014/08/image1.png)

Once the profile exists, to open the Profile type

**_N_****_otepad $Profile_**

Finally enter the following into your PowerShell profile. This will run every time you launch PowerShell

**Import-Module MSOnline  
$Cred = Import-Clixml $env:USERPROFILE\Documents\MyO365Creds.xml  
Connect-MsolService -Credential $Cred**

If you work with multiple office 365 accounts each one of these credentials can be represented by a variable within your PowerShell profile.

**_$Cust1Cred = Import-Clixml $env:USERPROFILE\Documents\Cust1O365Creds.xml  
$Cust2Cred = Import-Clixml $env:USERPROFILE\Documents\Cust2O365Creds.xml  
$Cust3Cred = Import-Clixml $env:USERPROFILE\Documents\Cust3O365Creds.xml_**

Typically I will omit the final line from the Profile to connect to the service.  
Then its really simple to connect to a customers tenancy using

**_Connect-MSOLService –Credential $Cust1Cred_**

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/673/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/673/) ![](http://pixel.wp.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=673&subd=everythingsysadmin&ref=&feed=1)
