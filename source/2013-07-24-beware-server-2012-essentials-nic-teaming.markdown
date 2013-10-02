---
title: Beware Server 2012 Essentials NIC Teaming
date: 2013-07-24 10:30:31 +0100
tags: Server 2012 Essentials
author: alanmcburney
---

During a recent Windows Server 2012 Essentials install a NIC team was configured on the server.

This has proved to be a problematic configuration when it comes to Anywhere Access as the server reports that its not connected to the Internet.

READMORE

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/07/image_thumb.png?w=244&h=200 "image") ](http://everythingsysadmin.files.wordpress.com/2013/07/image.png)

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/07/image_thumb1.png?w=244&h=148 "image") ](http://everythingsysadmin.files.wordpress.com/2013/07/image1.png)

Reading through the forums posts on TechNet [here](http://social.technet.microsoft.com/Forums/windowsserver/en-US/cf8d66d3-5320-49bb-98ce-b8cad3e1e126/nic-teaming-supported "http://social.technet.microsoft.com/Forums/windowsserver/en-US/cf8d66d3-5320-49bb-98ce-b8cad3e1e126/nic-teaming-supported") & [here](http://social.technet.microsoft.com/Forums/windowsserver/en-US/6d920fa5-9347-40b2-ace2-6791ed8d0c05/anywhere-access-cant-see-ipconfig "http://social.technet.microsoft.com/Forums/windowsserver/en-US/6d920fa5-9347-40b2-ace2-6791ed8d0c05/anywhere-access-cant-see-ipconfig") its down to the Wizard making WMI calls to get the IP address and this doesn’t work properly when NIC teaming is used.

All in all its pretty poor when bugs like this get released in a RTM version of a product.

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/593/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/593/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=593&subd=everythingsysadmin&ref=&feed=1)
