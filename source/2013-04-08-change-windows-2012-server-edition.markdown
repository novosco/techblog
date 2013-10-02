---
title: Change Windows 2012 Server Edition
date: 2013-04-08 12:34:00 +0100
tags: Windows Server 2012
author: alan
---

Just started a new project today for a customer where I will be building a 2 node DAG on Server 2012.

Got the Exchange server bits installed and then tried creating the DAG which failed.

After a bit of analysis it transpires that the customer built the base OS with Windows 2012 Standard and not DataCenter (Server 2012 doesn’t include an Enterprise Edition any more)

READMORE

Luckily we can convert between editions of Windows Server on the fly via DISM ( [Deployment Image Service & Management](http://technet.microsoft.com/en-us/library/dd744256%28v=ws.10%29.aspx "http://technet.microsoft.com/en-us/library/dd744256%28v=ws.10%29.aspx"))

TechNet documentation on converting between server 2012 versions can be found [here](http://technet.microsoft.com/en-gb/library/jj574204.aspx)

To determine the current edition of Windows Server installed run the following

- **DISM /online /Get-CurrentEdition**

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb11.png?w=244&h=103 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image11.png)

To determine which versions the server can be upgraded to run

- **DISM /online /Get-TargetEditions**

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb12.png?w=244&h=109 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image12.png)

As can be seen from the above screenshot this version of Windows Server can be upgraded to **Target Edition : ServerDatacenter**

To complete the conversion between editions we use the DISM command with the following format

- **DISM /online /Set-Edition:<Version> /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEULA**

In the above example the target edition is **ServerDatacenter**

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb13.png?w=244&h=123 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image13.png)

A reboot of the server and a check of the server edition reveals that is has indeed been successfully upgraded to DataCenter

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb14.png?w=244&h=124 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image14.png)

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/575/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/575/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=575&subd=everythingsysadmin&ref=&feed=1)
