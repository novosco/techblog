---
title: XenDesktop &amp; XenApp 7.5  &#8211; time to get planning!
date: 2014-07-23 14:29:53 +0100
tags: Citrix
author: rainco
---

Time is moving on for the current XenApp 6.5 platform with only some two years left to go on the standard Life Cycle, that will come around sooner than you think.

There are many things to consider when moving to a new XenApp platform, not least of all changes in operating systems, application compatibility and printing (as always). Since my early days of working on MetaFrame 3, Citrix has been promising reduced management overheads, fewer consoles and better support for mixed OS environments. However, while they did do away with the old Citrix Management Console eventually, you were still left with Web Interface, Licensing and AppCentre to manage different parts of your environment. Then of course XenDesktop came along and brought new consoles, new management protocols and another database – and a StoreFront. Nearly forgot –  a Provisioning Server farm, console and database just to keep you on your toes!

My previous blog post on [AppDNA](http://tech.novosco.com/20140708-citrix-appdna-8211-analyzing-your-apps-for-those-new-os-deployments/) touched on the challenge of making applications compatible with new desktop and server operating systems. But what about the management challenge of hosting virtual desktops, shared desktops and publishing your applications?

Citrix has been working hard on that chestnut for a couple of years and the recent launch of XenDesktop/XenApp 7.5 now provides administrators with the ability to manage and deploy various operating systems and applications from a more unified console, namely Citrix Studio.

Key to this new platform is the FlexCast Management Architecture, or FMA. FlexCast was previously used in licensing terms only. For nearly twenty years now Citrix Presentation Server based products including XenApp 6.5 have relied on IMA – Independent Management Architecture for the underlying farm communications, load balancing, policies, and admin etc etc. A tried and tested product, many millions of users have been relying on IMA all over the world for application and desktop delivery.

Here are a few of the new terms to get your head around -

|  

**Instead of this in XenApp 6**

  |  

**Think of this in XenApp 7**

  |
|  

Independent Management Architecture (IMA)

  |  

FlexCast Management Architecture (FMA)

  |
|  

Farm

  |  

Delivery Site

  |
|  

Worker Group

  |  

Session Machine Catalog, Delivery Group

  |
|  

Worker

  |  

Virtual Delivery Agent, Server OS Machine

Desktop OS Machine

  |
|  

Zone and Data Collector

  |  

Delivery Controller

  |
|  

Delivery Services Console

  |  

Citrix Studio and Citrix Director

  |
|  

Publishing applications

  |  

Delivering applications

  |
|  

Data store

  |  

Database

  |
|  

Load Evaluator

  |  

Load Management Policy

  |
|  

Administrator

  |  

Delegated Administrator Role

  |

(Source, XenApp eDocs – [http://support.citrix.com/proddocs/topic/xenapp-xendesktop-75/cds-previous-xa-admins.html](http://support.citrix.com/proddocs/topic/xenapp-xendesktop-75/cds-previous-xa-admins.html) )

FMA however introduces some new capabilities that IMA could not deliver. The main being the ability to deploy the Citrix Virtual Desktop Agent (VDA) to both Windows desktop operating systems, and servers –  and manage both in the same place. Think about that for a second. No more multiple farms with different version of Windows and XenApp. A single console where you manage desktops, machine images and applications. You can even use the VDA on physical PCs – useful for administrator or power users with heavy graphics and connect directly with HDX.

Key Components:

[ ![fma](http://cjrainey.files.wordpress.com/2014/07/fma.png?w=392&h=254) ](https://cjrainey.files.wordpress.com/2014/07/fma.png)

Of course, with change – there are some things that are no longer. User Shadowing, Oracle Database support, SSO for Win 8.1/2012, Local Text Echo, Legacy Printing (XP/DOS clients) –  are no longer supported. Secure Gateway, still in use by some customers, is no longer supported and customers are advised to move to NetScaler Gateway as a replacement for remote access. Web Interface is still supported but customers are also expected to migrate to StoreFront with Web Interface having a limited shelf life and no further development.

So get planning! A two year window to get all your old x32 or 16 bit applications tested, upgraded or redeveloped is really not very long. Some will be easier than others. With an AppV now bundled, you could give that a try or look at Unidesk. Licensing, print strategy, remote access and your hyper visor platform all need careful consideration. I’ll be looking into those in more depth in my next few blogs.

**Useful Links:**

[XenApp 7.5 and XenDesktop 7.5](http://support.citrix.com/proddocs/topic/xenapp-xendesktop/cds-xenapp-xendesktop-75-landing.html)

[XenApp/Desktop 7.5 – Not supported](http://support.citrix.com/proddocs/topic/xenapp-xendesktop-75/cds-overview-features-not-in-this-release.html)

[XenApp Support Matrix](http://support.citrix.com/article/CTX122442)

 

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/117/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/117/) ![](http://pixel.wp.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=117&subd=cjrainey&ref=&feed=1)
