---
title: Backing up NetScaler
date: 2013-11-12 12:52:00 +0000
tags: Uncategorized
author: rainco
---

NetScaler stores its configuration in a file called “ns.conf” stored in the unix file system.

It would be good practice to take a copy of this file before any major work, version upgrades or migration of the virtual appliances to another data centre for example.

READMORE

You can back up the config in two ways:

· Using the Generate Support File wizard in the GUI – I mostly use this for sending support files to Citrix.

· Using ftp or secure FTP tools like WinScp or Bitvise

I prefer to use WinSCP/Bitvise and usually install this on the Web Interface or Storefront server.

**Method 1**

Login to your NetScaler through the management gui.

[ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb.png?w=316&h=200 "image") ](http://cjrainey.files.wordpress.com/2013/11/image.png)

Go to System, Diagnostics and click on Generate Support File

Click on Run, takes a minute to run. You can then click on Download to export a unix tar file

And also save the config to a text file.

[ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb1.png?w=223&h=244 "image") ](http://cjrainey.files.wordpress.com/2013/11/image1.png)  [ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb2.png?w=231&h=244 "image") ](http://cjrainey.files.wordpress.com/2013/11/image2.png)

Click download to get the .tar file.

[ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb3.png?w=347&h=184 "image") ](http://cjrainey.files.wordpress.com/2013/11/image3.png)

Click on Select to select the recent version

[ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb4.png?w=350&h=245 "image") ](http://cjrainey.files.wordpress.com/2013/11/image4.png)

Select a suitable path for the backup and click on Download.

[ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb5.png?w=462&h=141 "image") ](http://cjrainey.files.wordpress.com/2013/11/image5.png)

**Method 2**

The 2nd method, and one I prefer to use is through a Windows based ftp/secure Ftp tool

[ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb6.png?w=421&h=289 "image") ](http://cjrainey.files.wordpress.com/2013/11/image6.png)

Login to the NetScaler IP with the nsroot other admin account.

[ ![image](http://cjrainey.files.wordpress.com/2013/11/image_thumb7.png?w=418&h=201 "image") ](http://cjrainey.files.wordpress.com/2013/11/image7.png)

This then presents you with an explorer interface into the NetScaler file system,

and of course my local PC.

Browse to a suitable location on the left pane, and then browse on the right to find the /nsconfig folder – drag the ns.conf over to the right.

\*\*Other files called ns.conf.0 are the previous versions, which you may rename to ns.conf if required to get back to previous settings.

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/27/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/27/) ![](http://stats.wordpress.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=27&subd=cjrainey&ref=&feed=1)
