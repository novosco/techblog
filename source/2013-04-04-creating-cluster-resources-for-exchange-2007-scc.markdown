---
title: Creating Cluster Resources for Exchange 2007 SCC
date: 2013-04-04 14:46:00 +0100
tags: Uncategorized
author: alan
---

During a large scale Exchange migration for 2007 to 2010 an issue arose with Public Folder databases.

A public folder replica has been added to the Exchange 2007 servers to include the new 2010 environment.

After verification of data replication all 2007 databases were updated to have their public folder database point to the 2010 servers and the 2007 server removed from the replica in lieu of completely removing the 2007 public folders.

After a few weeks of normal usage users started reporting that they could no longer access their public folders.

To cut a long story short it was decided to add a replica back into Exchange 2007, as the Public Database was now removed I tried to recreate a new one.

Exchange 2007 is running as a Single Copy Cluster and requires cluster dependencies for normal operation.

As 2010 has been introduced into the environment Exchange 2007 throws an error upon creating the Database

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb1.png?w=244&h=141 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image1.png)

After checking the EMC the database has actually been created but at this point it fails to mount due to the missing cluster resource records

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb2.png?w=244&h=112 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image2.png)

To get the database to successfully mount we need to revert to the Cluster Administrator and create a new resource

Open the Cluster Administrator and Ctrl+N to open the new resource wizard

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb3.png?w=244&h=198 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image3.png)

Next select the possible owners

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb4.png?w=244&h=197 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image4.png)

And finally the dependencies. I chose Exchange Information Store and the Logs and Database drives

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb5.png?w=244&h=196 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image5.png)

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb6.png?w=244&h=91 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image6.png)

I also change the Cluster Resource so that if it fails to come online it doesn’t affect the group which would result in a cluster failover

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb7.png?w=241&h=244 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image7.png)

This is only half the story as at this point the database will still not mount.

The next thing that needs to happen is that the Storage Group & Database GUID need to be retrieved. This can be done using the Exchange Shell

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb8.png?w=244&h=79 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image8.png)

We need to register these GUIDs against the private properties of the cluster resource

To do this we need to drop to the command prompt

**Cluster.exe res “Public Folders”** displays the properties of the resource

[ ![SNAGHTML9d1a8a4](http://everythingsysadmin.files.wordpress.com/2013/04/snaghtml9d1a8a4_thumb.png?w=244&h=42 "SNAGHTML9d1a8a4") ](http://everythingsysadmin.files.wordpress.com/2013/04/snaghtml9d1a8a4.png)

**Cluster.exe res “Public Folders”** displays the private properties of the resource which is what we are interested in.

What needs to happen now is that the private resources needs to be assigned to the Cluster Resource

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb9.png?w=244&h=32 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image9.png)

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb10.png?w=244&h=44 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image10.png)

In both of the above screenshots the network name has been blanked out

We are now finally in a position to mount the public folder and the Cluster is fully operational again.

This process will work for any database not just public folders.

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/565/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/565/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=565&subd=everythingsysadmin&ref=&feed=1)

        