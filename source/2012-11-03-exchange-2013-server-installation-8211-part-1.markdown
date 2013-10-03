---
title: Exchange 2013 Server installation &#8211; Part 1
date: 2012-11-03 16:25:50 +0000
tags: Exchange 2013
author: alanmcburney
---

This is the first of a multi part blog post on the setup and configuration of Exchange Server 2013.

The Exchange environment will be split out over 4 servers (2x Client Access & 2x Mailbox).

The backend mailbox will be configured in a DAG and the front end will be load balanced using a Kemp Virtual Load Master.

READMORE

All servers are running Windows Server 2012 RTM in vSphere 5.1

The lab is setup as per the table below

>

| DC01 | 192.168.0.1 |
| CAS01 | 192.168.0.2 |
| CAS02 | 192.168.0.3 |
| MBX01 | 192.168.0.4 |
| MBX02 | 192.168.0.5 |
| Kemp VLM | 192.168.0.6 |

Ill will not be covering the initial OS configuration and all servers have been joined to the domain

In part 1 here we will deal with installation of the Client Access Server. (Configuration guides will come in later posts)

So with that in mind lets start the installation of Exchange Server 2013.

 

The Client access server requires some pre requisites before we can launch Exchange setup

These prereqs are the **Windows Server Foundation** feature and **Microsoft Unified Communication API 4**.

To install the Windows Server Foundation open PowerShell and run the following commands  

**Import-Module ServerManager**

**Add-WindowsFeature Server-Media-Foundation**

**Shutdown –r –t 00**

[ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb.png?w=244&h=67 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image.png)

When the server comes back up after its reboot install [Microsoft Unified Communications API 4.0 Runtime](http://www.microsoft.com/en-gb/download/details.aspx?id=34992 "http://www.microsoft.com/en-gb/download/details.aspx?id=34992")

[ ![UCMA](http://everythingsysadmin.files.wordpress.com/2012/11/ucma_thumb.png?w=244&h=229 "UCMA") ](http://everythingsysadmin.files.wordpress.com/2012/11/ucma.png)

With all the pre requisites now installed we can finally launch the Exchange Setup routine.

The following screenshots walk though the installation.

[ ![CAS Setup 1](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-1_thumb.png?w=244&h=214 "CAS Setup 1") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-1.png) [ ![CAS Setup 2](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-2_thumb.png?w=244&h=214 "CAS Setup 2") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-2.png) [ ![CAS Setup 4](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-4_thumb.png?w=244&h=214 "CAS Setup 4") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-4.png) [ ![CAS Setup 3a](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-3a_thumb.png?w=244&h=214 "CAS Setup 3a") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-3a.png) [ ![CAS Setup 5](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-5_thumb.png?w=244&h=214 "CAS Setup 5") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-5.png) [ ![CAS Setup 6](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-6_thumb.png?w=244&h=214 "CAS Setup 6") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-6.png) [ ![CAS Setup 7](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-7_thumb.png?w=244&h=214 "CAS Setup 7") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-7.png) [ ![CAS Setup 7a](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-7a_thumb.png?w=244&h=214 "CAS Setup 7a") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-7a.png) [ ![CAS Setup 8](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-8_thumb.png?w=244&h=214 "CAS Setup 8") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-8.png) [ ![CAS Setup 9](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-9_thumb.png?w=244&h=214 "CAS Setup 9") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-9.png) [ ![CAS Setup 10](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-10_thumb.png?w=244&h=214 "CAS Setup 10") ](http://everythingsysadmin.files.wordpress.com/2012/11/cas-setup-10.png)

And that’s part one finished. This process is repeated for the installation of CAS02

In part 2 I will be covering the installation of the Mailbox Server

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/468/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/468/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=468&subd=everythingsysadmin&ref=&feed=1)
