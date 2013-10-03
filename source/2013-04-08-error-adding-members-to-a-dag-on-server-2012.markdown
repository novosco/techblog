---
title: Error Adding Members to a DAG on Server 2012
date: 2013-04-08 13:24:04 +0100
tags: Database Availability Group
author: alanmcburney
---

Ran into an error this morning trying to add members to a DAG running on Server 2012

When I try to add the nodes to the DAG I got the error

“You must provide an value for this property”

READMORE

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb15.png?w=244&h=182 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image15.png)

Decided I better do some reading on [TechNet regarding 2010 DAGs and Server 2012](http://technet.microsoft.com/en-us/library/ff367878%28v=exchg.150%29.aspx) and it turns out that you must pre-stage the CNO (Cluster Named Object)

The documentation states

**_Pre-staging the CNO is required for Windows Server 2012 DAG members due to permissions changes in Windows Server 2012 for computer objects._**

There are 2 methods to achieve the pre-staging.

1. Add the “**Exchange Trusted Subsystem**” group with Full Control to the CNO
2. Add the first DAG member with Full Control to the CNO

For me I choose to add the “**Exchange Trusted Subsystem**”

Adding the Nodes to the DAG after making the necessary changes worked without issue

[ ![image](http://everythingsysadmin.files.wordpress.com/2013/04/image_thumb16.png?w=244&h=142 "image") ](http://everythingsysadmin.files.wordpress.com/2013/04/image16.png)

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/581/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/581/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=581&subd=everythingsysadmin&ref=&feed=1)
