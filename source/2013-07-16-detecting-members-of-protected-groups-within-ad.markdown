---
title: Detecting members of Protected Groups within AD
date: 2013-07-16 11:05:27 +0100
tags: Active Directory
author: alanmcburney
---

I do a lot Exchange and Lync work and typically post project I get calls from customers that things aren’t working quite as expected.

Some typical issues include insufficient rights to modify users within Lync, ActiveSync not working or send as permissions being stripped out for users within Exchange.

What all these issues have in common is that users affected are members of what’s termed as Protected Groups within AD and security inheritance is being stripped from the user object.

READMORE

If you need a primer or a deep dive for that matter into Protected Groups see John Policelli’s article [here](http://policelli.com/blog/archive/2009/11/06/understanding-adminsdholder-and-protected-groups/)

The following Active Directory PowerShell commands can be used detect which users and groups are affected by Protected Group status.

To get the list of protected users:  
     **Get-ADUser -LDAPFilter "(admincount=1)" | select name**

To get the list of protected groups:  
     **Get-ADGroup -LDAPFilter "(admincount=1)" | select name**

Once the users have been removed from the Protected Groups its just a matter of enabling security inheritance for the user object from within AD and the issues should be resolved. 

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/584/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/584/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=584&subd=everythingsysadmin&ref=&feed=1)
