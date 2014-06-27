---
title: Flash for all
date: 2014-06-27 15:10 UTC
tags: Storage
author: MALCONFIGURED
---

Recently I've been looking into the Hybrid and all flash array vendors; what they say, what they do and most importantly is it all as good as they say?  

READMORE

This is a part of the storage market sector that by default we all associate with two things:

- High performance work sets  like persistent VDI and
- Higher cost per GB

Well whilst I can’t deny the former is - in most cases - our perception, the latter is becoming less and less so.  In general most organisations' first move into flash is through the positioning of flash in the server like Fusion IO - or should I now say SAN Disk - or by the introduction of Flash into the historic SAN or NAS architecture with features like EMC FAST FLASH VP or NetApp Flash pools.

However after doing numerous webcast conference calls and demos I was intrigued by the story told by the team in EMC looking after XtremIO.

One of the main things they challenge is the question “is FLASH just for high end workloads?”
To make this argument work, there are a couple of unique technical points that you need to understand about XtremIO.

## De-Dupe ##

XtremIO de-dupes data inline, at an 8K chunk size and, as such it can put a lot of logical data into a very small amount of physical storage.   Unlike its competitors NetApp and even VNX this inline process makes sure that the backend storage requirement is low, we do not need to stage  data to disk and the de-dupe later.
    
Also, unlike most other de-dupe systems I’ve come across, de-dupe is environment wide whether your deployment is 1 XtremIO X-Brick or 4 X-Bricks. Each unique 8K block exists only once on SSD.
  
This means whether the company logo, for example Coca-Cola (downloaded from Google 16KB), is in 1000 files on you file server, embedded in 10 thousand web pages on your IIS server farm, in every email your employees send or in every report spat out by your database application it will consume 2 X 8K chunks of disk space full stop.

In fact all XtremIO process are inline, including disk garbage collection meaning that in day 1 and in day 1000 performance is consistent - so much so that if you prove them wrong you get $1Million. [http://uk.emc.com/microsites/inline/index.htm?cmp=web-hp-promo](http://uk.emc.com/microsites/inline/index.htm?cmp=web-hp-promo) . 

## SnapShots ##

So if De-dupe is inline then when you copy a file or even if you create a full read only or a read write snapshot of a LIN then it’s instantaneous, or well near as near as dammit, and consumes zero disk space.  In fact all a snapshot does is create a new set of metadata pointing to the existing blocks on disk.

## The Benefits ##

So to bring this all home I’ll share the story EMC shared with me.
Imagining as CIO, my data is growing and my current array is 3 to 5 years old.  So in my case it’s time to consider a replacement. 
 
I wouldn’t say any of my individual workloads are ones that really need a high performance disk, in fact the existing SAS disks are coping OK with the current workloads.  Based on my existing array, I estimate I need circa 60TB and a non-astounding 10,000 IOPS.

So far this is the type of environment that VNX or even NetApp would eat up all day long.

But when I look further I realise that on average the current SAN with its multiple exchange DAG’s, Test, DEV, Pre Prod and Prod copies of Web sites, Databases, User home directories, department directories and usual hording of files is showing capabilities of a 8:1 de-dupe ratio.  

Now this is where the usual post process de-dupe fails, sorry VNX and NetApp. Because you need to write the data to disk before you can de-dupe so I would still need to buy 60TB and in the case of NetApp it can only de-dupe each block 256 times within the Volume Boundary and only if it is not referenced by a snapshot. 

Also to get my 10,000 IOPS we need some clever tiering which will allow some of our data to be on high performance disks, based on 10K drives at 150 IOPS  per drive to deliver sub 20ms latency, then we need  66 spindles.

So using XtremIO as I transfer in my data to its disk, it is de-duped inline then I only need 7.5 TB (8:1 ratio delivers a logical useable of 60TB) of Storage.

Using 400GB SSD HD’s then I would need 20 drives.  Well a single X-Brick has 25 drives each rated to about 6000 IPOS (based on 50/50 Read/Write) so a single brick would deliver my needs of both storage and IOPS and do so with sub 1ms latency.

Yes, but surely 25 X 400GB SSD’s is going to cost a lot?  Well when you consider a VNX solution delivering not only the capacity but the Performance I require the cost per GB is circa £3.50, I was amazed to find that a single X-Brick delivering my 60TB logical 10TB physical was coming in at £22.10 per physical GB which equates to £2.76 per logical GB.

So £3.50 per GB for the VNX solution with 60TB of spinning disk (circa 75 drives) to power cool and support needing about 15U rack space to support my 60TB and 10,000 IOPS, versus £22.08 per GB of non-spinning SSD to power cool and support in  6U of rack for. 

But remember with a not unconceivable 8:1 de-dupe ratio the XtremIO delivers my 60TB useable and my required 10,000 IOPS easily thus actually resulting in a £2.76 per logical GB.

Now that got me thinking!!

Next point what if the business suddenly in the next Board meeting asks me “We need more IOPS. Marketing have been looking into big data analytics on the database and has recommended we run more reports more often and I am asked what do we need to do to enable Marketing to do this?”

Well that’s where the old school approach of adding more spiny things comes in.  Lets’ say this new reporting needs a modest 5,000 extra IOPS.  Well that’s and extra 33 Disks needing 6 more U of rack and, costing extra just for performance, driving up my true cost per GB to closer to £4.15.  This will need a hefty business case sign off, a procurement process and install cycle of probably 5-8 weeks.  
 
But remember our Flash based XtremIO can do 150,000 IOPS (25 SSD’s X 6000 IOPs per SSD 50/50 Read/Write) so with a quirky smile on my face in the Board Room I answer the marketing team saying OK let’s do it. No time wasted not lead time or re-engineering old data sets.

Ok they retort “how soon can you give me 5 copies of the databases to run the analytics on?”   “Hmmm” well I think 2TB database times 5 copies.  That  would normally take some time and I’ll want to copy outside of business hours, to make sure it doesn’t affect performance for live users, so best do it each weekend meaning the data is a few days old. 

Oh I forgot XtremIO can create 5 Snapshots pointers to the same data nearly instantaneously, so how about it will be ready before the end of the board meeting coffee break. 

Now suddenly that extra 6K to put in an all flash XtremIO doesn’t seem so expensive and indeed has actually kept my cost per GB used down, saved a shed load of power, cooling and made IT respond at business speeds.

If this story is resonating with you let us know and we can run tools to identify what de-dupe ratio you can expect to achieve. 

So to paraphrase the Queen hit of 1980 (god it is really 34 years ago) with XtremIO

“FLASH a-ha saviour of the CIO”


