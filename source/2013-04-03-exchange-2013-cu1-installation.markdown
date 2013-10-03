---
title: Exchange 2013 CU1 Installation
date: 2013-04-03 21:40:58 +0100
tags: Exchange 2013
author: alanmcburney
---

The long awaited CU1 update for Exchange 2013 has finally arrived.  
This updates allows for on-premises coexistence with Exchange 2010 SP3 & 2007 SP3 RU10 and brings the Exchange 2013 build number up to 15.0 (Build 620.29)

The admin display version from a pre and post CU1 install are shown below. (Ex2K13-01 running RTM & Ex2K13-02 running CU1)

READMORE

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb.png?w=244&h=52 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image.png)

CU1 also brings new Schema, AD & Domain updates so all three need to be prepared before running setup.

To prepare the schema run

- setup.exe /PrepareSchema

To prepare AD run

- setup.exe /PrepareAD

To prepare Domain its

- setup.exe /PrepareDomain

Finally to install the update onto a RTM version of 2013 run

- setup.exe /m:Upgrade

There are only a few click to navigate though before installation begins

Installation took a good 40 minutes on my machines.

If you have been hanging back on the installation of 2013 until CU1 there is no need to install the RTM version first.  
As the updates are cumulative run setup straight from CU1 media and your done.

Happy patching.

Exchange 2013 CU1 can be downloaded [here](http://www.microsoft.com/en-us/download/details.aspx?id=38176)

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/542/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/542/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=542&subd=everythingsysadmin&ref=&feed=1)
