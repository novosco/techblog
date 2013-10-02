---
title: Install Certificate Services on Server 2012 Core
date: 2013-07-24 20:29:56 +0100
tags: Certificate Authority
author: alan
---

I’m finally getting the time to focus more and more on Windows Server 2012.

With Server 2012 I’m running Domain Controllers as server core installations.

My reasoning for running DC’s using core is as follows:

- No additional software can be installed on the server. Domain Controllers are Domain Controllers are Domain Controllers.
- With server core installations admins generally don’t log onto the server unless they are comfortable with the command line and Shell and even then they only log on typically when something needs to be changed with the configuration.
- Surface area is greatly reduced as there are limited binaries installed.
- Memory is also minimal. My server core installs are running with 512MB RAM
- Disk requirements are reduced

READMORE

All of the above in my opinion leads to a more stable system.  
On the downside though it takes a bit more work to get things up and running.

Getting Certificate Services up and running on the server core installation was pretty easy.

Once logged onto the server I run **_PowerShell_** from the cmd line and then **_Import-Module ServerManager_**

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/07/image_thumb2.png?w=244&h=77 "image") ](http://everythingsysadmin.files.wordpress.com/2013/07/image2.png)

Next is to add the Active Directory Certificate Services & Certification Authority roles

>

> **_Add-WindowsFeature AD-Certificate, ADCS-Cert-Authority_**

A reboot is required after installation.

After the comes has rebooted we can check that the features have been installed by running

>

> **_Get-WindowsFeature | Where Installed _**

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/07/image_thumb3.png?w=244&h=117 "image") ](http://everythingsysadmin.files.wordpress.com/2013/07/image3.png)

We now need to configure the Certificate Authority. To do this we need a bit of code that Microsoft has handily already provided [here](http://technet.microsoft.com/en-us/library/ee918754%28v=ws.10%29.aspx "http://technet.microsoft.com/en-us/library/ee918754%28v=ws.10%29.aspx")

Copy the code into notepad on the server core installation and save to a  location on the disk.  
(I RDP to my server core installation and therefore can paste the clipboard contents from my desktop to the server core console.)

Final piece of the configuration is to run the SetupCA.vbs fiile using the following parameters

>

> **cscript SetupCA.vbs /IE**

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/07/image_thumb4.png?w=244&h=125 "image") ](http://everythingsysadmin.files.wordpress.com/2013/07/image4.png)

Once installed I can now manage the CA from any workstation or  server running RSAT.

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/07/image_thumb5.png?w=244&h=163 "image") ](http://everythingsysadmin.files.wordpress.com/2013/07/image5.png)

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/605/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/605/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=605&subd=everythingsysadmin&ref=&feed=1)
