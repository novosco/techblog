---
title: Exchange 2013 Server installation &#8211; Part 2
date: 2012-11-05 19:56:38 +0000
tags: Exchange 2013
author: alan
---

In the [first part](http://everythingsysadmin.wordpress.com/2012/11/03/exchange-2013-server-installation-part-1/) of this multi part blog post I covered the installation of the Client Access Server

This time around we will cover the installation of the Mailbox role.

Lets get started by covering off the pre-requisites the Mailbox Role

READMORE

- Server Media Foundation roles  

To install** Server-Media-Foundation** open PowerShell and run the following commands

**Import-Module ServerManager**

**Add-WindowsFeature Server-Media-Foundation**

**Shutdown –r -t 00**

[ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb.png?w=244&h=67&h=67 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image.png)

- When the server comes back up after its reboot install [Microsoft Unified Communications API 4.0 Runtime](http://www.microsoft.com/en-gb/download/details.aspx?id=34992)

[ ![MBX Setup 12](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-12_thumb.png?w=244&h=229 "MBX Setup 12") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-12.png) [ ![UCMA](http://everythingsysadmin.files.wordpress.com/2012/11/ucma_thumb.png?w=244&h=229&h=229) ](http://everythingsysadmin.files.wordpress.com/2012/11/ucma.png) [ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb3.png?w=244&h=228 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image3.png)  [ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb4.png?w=244&h=229 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image4.png)

- Then we install the [Office 2010 Filter Packs Version 2.0](http://go.microsoft.com/fwlink/?LinkId=191548)  
[ ![Filter Pack 1](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-1_thumb.png?w=244&h=201 "Filter Pack 1") ](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-1.png) [ ![Filter Pack 2](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-2_thumb.png?w=244&h=212 "Filter Pack 2") ](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-2.png)
- And finally its [Office 2010 Filter Packs 2.0 Service Pack 1](http://go.microsoft.com/fwlink/?LinkId=262358)  
[ ![Filter Pack 3](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-3_thumb.png?w=244&h=155 "Filter Pack 3") ](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-3.png) [ ![Filter Pack 4](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-4_thumb.png?w=244&h=95 "Filter Pack 4") ](http://everythingsysadmin.files.wordpress.com/2012/11/filter-pack-4.png)

One final reboot is required before we can install the Exchange 2013 Mailbox role.

Once the server is back up we can go ahead and launch the Exchange 2013 setup routine.

The following screenshots will guide you though the install

 

[ ![MBX Setup 1](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-1_thumb.png?w=244&h=214 "MBX Setup 1") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-1.png) [ ![MBX Setup 2](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-2_thumb.png?w=244&h=214 "MBX Setup 2") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-2.png) [ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb5.png?w=244&h=214 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image5.png) [ ![MBX Setup 3](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-3_thumb.png?w=244&h=214 "MBX Setup 3") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-3.png) [ ![MBX Setup 4](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-4_thumb.png?w=244&h=214 "MBX Setup 4") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-4.png) [ ![MBX Setup 5](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-5_thumb.png?w=244&h=214 "MBX Setup 5") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-5.png) [ ![MBX Setup 6](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-6_thumb.png?w=244&h=214 "MBX Setup 6") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-6.png) [ ![MBX Setup 7](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-7_thumb.png?w=244&h=214 "MBX Setup 7") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-7.png) [ ![MBX Setup 8](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-8_thumb.png?w=244&h=214 "MBX Setup 8") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-8.png) [ ![MBX Setup 9](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-9_thumb.png?w=244&h=214 "MBX Setup 9") ](http://everythingsysadmin.files.wordpress.com/2012/11/mbx-setup-9.png) [ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb6.png?w=244&h=214 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image6.png) [ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb7.png?w=244&h=214 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image7.png)

Once the installation is complete we can check that the Exchange Admin Center comes up as expected.

Open your web browser and enter the IP\DNS name of your CAS server. For me its

[https://cas01/ecp](https://cas01/ecp)

As I installed a trusted certificate yet I will get a security error once I connect. This can be ignored as its expected behaviour

[ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb1.png?w=244&h=111 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image1.png)

Once you have accepted the warning you will be presented with the Exchange Admin Center

[ ![EAC](http://everythingsysadmin.files.wordpress.com/2012/11/eac_thumb.png?w=244&h=124 "EAC") ](http://everythingsysadmin.files.wordpress.com/2012/11/eac.png) [ ![image](http://everythingsysadmin.files.wordpress.com/2012/11/image_thumb2.png?w=244&h=138 "image") ](http://everythingsysadmin.files.wordpress.com/2012/11/image2.png)

Repeat the installation process for MBX02 and once complete that concludes part 2 of this blog post.

Next time out I will configure up the Client Access Server Client URLs and setup the Kemp Virtual Load Master

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/512/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/512/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=512&subd=everythingsysadmin&ref=&feed=1)
