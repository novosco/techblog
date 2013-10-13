---
title: Windows Server Core 2012 R2 Remote Management
date: 2013-10-08 20:54:29 +0100
tags: Active Directory
author: alanmcburney
---

In my last blog post I added certificate services to a server core installation.

Well as it turns out after some more hands on with server core I did it the hard way as Server 2012 brings with it a new level of remote or headlesss management.

When I first got this up and running I was pretty blown away by the experience.

What I’m going to walk though in this blog post are the configuration steps that are required in order to get remote management of the server core installation up and running via a dedicated management server.

READMORE

In this lab I have 2 Windows 2012 R2 Servers

- 1 Server Core
- 1 GUI

I’m not going to include the steps that are required in order to get the VM’s installed.  
I’m going to pick this up from the point that the installation is complete.

Once Server Core has been installed and you have created your admin password and logged in. The first thing to do is fire up SConfig in order to set:

- Server Name
- IP Address\Subnet Mask
- DNS Servers
- Remote Desktop

[ ![1](http://everythingsysadmin.files.wordpress.com/2013/10/1_thumb.png?w=244&h=127 "1") ](http://everythingsysadmin.files.wordpress.com/2013/10/11.png)

Running **_sconfig_ **from the command prompt brings up the screen as below and allows basic server setup options to be configured

[ ![2](http://everythingsysadmin.files.wordpress.com/2013/10/2_thumb.png?w=244&h=126 "2") ](http://everythingsysadmin.files.wordpress.com/2013/10/21.png)

Select **Option 2** and enter a computer name for the server. This requires a reboot once complete

Once the server comes backup and your logged back in run **sconfig** again and this time choose **option 8** in order to set the IP Adresss, Subnet mask, Default Gateway and DNS Servers

Once complete that’s about all that needs done on the server core installation.

We can now switch over to the Management Server.

Configure this server up in the normal way, setting:

- IP Address\Subnet Mask
- Default Gateway
- DNS Server
- Server Name

Reboot the server and get logged back in.

As we are still to configure a domain we are effectively in a workgroup.  
And as there is no domain there is no DNS for name resolution.

To work around these issues there are few steps that need to be taken.

1. Add a host file entry for the DC on th emanagement server
2. Add the would be Domain Controller to the trusted hosts file on the management server

Lets go ahead and take care of the easy task of assining the Domain Controller ServerName to the management servers host file

Open Notepad as administrator and then open:

C:\Windows\System32\drivers\etc\hosts

Add an entry for the domain controller similar to that below

[ ![3](http://everythingsysadmin.files.wordpress.com/2013/10/3_thumb.png?w=244&h=180 "3") ](http://everythingsysadmin.files.wordpress.com/2013/10/31.png)

Close the file and test name resolution via ping.  
We won’t get a ping response due to the Firewall on Quarkalbs-DC01 but thats not the point. The point here is to test name resolution.

[ ![4](http://everythingsysadmin.files.wordpress.com/2013/10/4_thumb.png?w=244&h=87 "4") ](http://everythingsysadmin.files.wordpress.com/2013/10/41.png)

Now that name resolution is functional for QuarkLabs-DC01 the next step is to add the server to the trusted hosts file on the management server

Open PowerShell and run the following command

**Set-Item WSMAN:\localhost\Client\TrustedHosts quarklabs-dc01 -force**

[ ![5](http://everythingsysadmin.files.wordpress.com/2013/10/5_thumb.png?w=244&h=25 "5") ](http://everythingsysadmin.files.wordpress.com/2013/10/51.png)

All items are now set and we can go back to the Server Manager Dashboard on the management server and add our remote server

From Server Manager choose** Add other server to manage**

[ ![6](http://everythingsysadmin.files.wordpress.com/2013/10/6_thumb.png?w=244&h=130 "6") ](http://everythingsysadmin.files.wordpress.com/2013/10/61.png)

Select **DNS** and add the remote server

[ ![7](http://everythingsysadmin.files.wordpress.com/2013/10/7_thumb.png?w=244&h=186 "7") ](http://everythingsysadmin.files.wordpress.com/2013/10/71.png)

Click OK and wait for a moment while the remote server is added.

The server count should have increased from the dashboard

[ ![8](http://everythingsysadmin.files.wordpress.com/2013/10/8_thumb.png?w=244&h=103 "8") ](http://everythingsysadmin.files.wordpress.com/2013/10/81.png)

Open **All Servers** and be sure that the recently added server is now present

[ ![9](http://everythingsysadmin.files.wordpress.com/2013/10/9_thumb.png?w=244&h=46 "9") ](http://everythingsysadmin.files.wordpress.com/2013/10/9.png)

The server can now be managed via the management server like any normal server.

That wraps it up for this post. In the next post I’ll configure and promote the server to be a domain controller all via the management server.

.

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/621/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/621/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=621&subd=everythingsysadmin&ref=&feed=1)
