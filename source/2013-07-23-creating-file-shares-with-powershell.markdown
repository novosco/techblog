---
title: Creating File Shares with PowerShell
date: 2013-07-23 20:53:44 +0100
tags:
author: alan
---

I’m gradually moving more and more to PowerShell only for server administration.

Today I needed to create a new file share for a Lync 2013 Std Edition installation on Server 2012 and once again I looked to achieve this though the Shell.

As it turns out that this is a very simple task so with no further ado here is the syntax

>

> **_New-SmbShare –Name LyncShare -Path C:\LyncShare –Description “Lync 2013 File Share” –FullAccess Administrators_**

    
[ ![](http://feeds.wordpress.com/1.0/comments/everythingsysadmin.wordpress.com/586/) ](http://feeds.wordpress.com/1.0/gocomments/everythingsysadmin.wordpress.com/586/) ![](http://stats.wordpress.com/b.gif?host=everythingsysadmin.wordpress.com&blog=8998607&post=586&subd=everythingsysadmin&ref=&feed=1)

        