---
title: Zerto Virtual Replication the PoSh way.
date: 2012-05-06 02:56:14 +0100
tags: Zerto
author: stejoh
---

Recently I have had the pleasure of deploying Zerto Virtual Replication ( [http://www.zerto.com/](http://www.zerto.com/)). My first impressions are very good, it’s a well polished product. The install and configuration was very straightforward and it worked without glitches. ZVR deals with all the replication and even reconfigures the networking i.e. re-IP’ing at the DR site, this is all made effortless. The replication is asynchronous and during our testing over a 100Mbit link we set the RPO to 2 minutes but were seeing actual RPO’s of around 12 seconds which is impressive.

The architecture hinges around having a management server at each site called the Zerto Virtual Manager (ZVM) and having Virtual Replication Appliances (VRA) on each ESXi host. The product uses the concept of the Virtual Protection Group’s (VPG) to collate machines together with common configuration such as RPO and Journal CDP History which affects the point to which you can roll back to. When the VPG’s are protected you have the option to Move, Failover or Test the Failover. Among the configuration options on the VPG’s there are Pre and Post Scripts and this is where PowerShell (PoSh) comes in very handy. This post was inspired by a requirement at a customer’s site and focuses on a DNS record update script you may need to finish off your deployment.

The Admin Guide is well put together, provides good guidance on the configuration and suggests some additional functionality you may wish to provide by using scripts. Functionality suggested includes updating DNS records at the DR site after Failover and also recording Failover Testing in text files on the Zerto Virtual Manager servers. I decided to put all this functionality into one PowerShell script since both of these suggestions are great, updating DNS is an absolute must and recording Test Failovers seems sensible. I used the DNS Update powershell script from the Admin Guide as the basis for my script and added extra bits so only a single script is required for all VPG’s and so the Failover Test history is recorded using the same script (the Admin Guide has a separate batch file script to do this).

I realised DNS should only be updated if a Move or an actual Failover occurred. Failover Testing brings VMs up in your VM Port Group of choice but it’s very likely you’ll use an isolated network so definitely don’t want to change production DNS records. Zerto make achieving these goals easier by providing environment variables such as  
`%ZertoOperation%` with values of Move, Failover or Test and  
`%ZertoVPGName%` which contains the VPG name.  
These Environment variables are explained in the Admin Guide and I have used them within my script.

The Post Script uses a Powershell ps1 file, Dnscmd.exe and a subfolder per VPG which contains 4 csv files. Dnscmd.exe is wrapped in the Powershell script and updates DNS records using the relevant csv files.  
Dnscmd.exe can be installed on Windows Server 2008 R2 from the Features menu and for this script to run the executable needs copied to the script directory “C:\ZertoScripts\”.

The script is run from the site you are failing over to, a common path on both ZVM servers should be used for scripts to ensure they run when you failover and failback again. Also the service account you use for Zerto will require local admin privileges and needs to be added to the DNSAdmins group so the DNS records can be updated. Note that the csv file contents will be different for the VPG’s at each site as you will want to change DNS to use the IP’s for whichever site you are moving the VM’s to. The script deletes old DNS entries and imports new ones to replace them.

The script directory “C:\ZertoScripts\” should contain the following files. Note VPGName1 is an example subdirectory named exactly the same as the VPG name and will have 4 csv files within it.  
`  
DNS-Change.ps1  
Dnscmd.exe  
VPGName1\DNS-NewA.csv  
VPGName1\DNS-NewPTR.csv  
VPGName1\DNS-OldA.csv  
VPGName1\DNS-OldPTR.csv  
`

In the Zerto tab within vCenter under the VPG’s options you’ll find the Post Script options. For this script they need to be configured as follows:  
**Command:** %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe  
**Params:** C:\ZertoScripts\DNS-Change.ps1 %ZertoOperation% %ZertoVPGName%

**DNS-Change.ps1 contains the following:**

#### Zerto Failover Script  ## Timestamp $timestamp = get-date -format "dd-MM-yy\_HHmm"  ## Get Environment Variables $ZertoOperation = $args[0] $ZertoVPGName = $args[1]  if ($ZertoOperation -ne "Test"){  ## Set DNS servers $DNSservers= @("192.168.1.1", "192.168.1.2")  ## Filepath to script and CSV files $FP = "C:\ZertoScripts\" CD $FP Foreach($DNSserver in $DNSservers) { Import-CSV .\$ZertoVPGName\DNS-OldA.csv | foreach { .\dnscmd $DNSserver /RecordDelete $\_.zone $\_.hostname A $\_.ip /f} Import-CSV .\$ZertoVPGName\DNS-NewA.csv | foreach { .\dnscmd $DNSserver /RecordAdd $\_.zone $\_.hostname A $\_.ip} Import-CSV .\$ZertoVPGName\DNS-OldPTR.csv | foreach { .\dnscmd $DNSserver /RecordDelete $\_.reversezone $\_.lowip PTR $\_.fqdn /f} Import-CSV .\$ZertoVPGName\DNS-NewPTR.csv | foreach { .\dnscmd $DNSserver /RecordAdd $\_.reversezone $\_.lowip PTR $\_.fqdn} }  } Else {  $LogContent = $ZertoVPGName " " $timestamp Add-Content c:\ZertoScripts\Results\ListOfTestedVPGs.txt -value $LogContent  }

Example contents of the csv files are shown below. Remember these are within subfolders which are named exactly the same as the VPG names. Also note the header line in each file is required:

**DNS-NewA.csv:**  
`zone,hostname,ip  
addomain.local,server01,192.168.1.10`

**DNS-NewPTR.csv:**  
`reversezone,lowip PTR,fqdn  
1.168.192.in-addr.arpa,10,server01.addomain.local`

**DNS-OldA.csv:**  
`zone,hostname,ip  
addomain.local,server01,192.168.2.10`

**DNS-OldPTR.csv:**  
`reversezone,lowip PTR,fqdn  
2.168.192.in-addr.arpa,10,server01.addomain.local`

For convenience you can download the Powershell script and example csv files in a zip(Dnscmd.exe is not included!).  
[**ZertoDNSChangeScript.zip**](http://www.neogeek.net/wp-content/uploads/2012/05/ZertoDNSChangeScript.zip)  
If you extract this to the “C:\ZertoScripts\” directory and copy Dnscmd.exe to this folder on each ZVM server you will be able to run the script.

I must caveat this post by saying although my initial revision of this script worked and the changes since then are minor, I currently don’t have access to an environment where I can test this. I have requested a trial license, when I get it I will test this script thoroughly and then remove this comment from my post.
