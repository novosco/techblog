---
title: Citrix AppDNA &#8211; analyzing your apps for those new OS deployments.
date: 2014-07-08 12:52:54 +0100
tags: Citrix
author: rainco
---

Upgrading a Citrix farm from one operating system to another has always been a difficult task to manage particularly if you have a stack of applications that have been developed for an older operating system. Neither Microsoft of Citrix support “in place” upgrade for terminal servers – so you must deploy new server OS and new Citrix platform to move up to the latest system. New servers, new Citrix, new profiles, new printers ..and potentially new applications.

READMORE

Getting your apps to work on a new OS is often the biggest headache in a Citrix migration. This may be because your internal application team or third party developed the apps for your business on tools that were current at the time – but pretty useless now. If they developed them on Windows XP or Server 2003 – it’s very likely they won’t run at all on Windows 8 or Server 2012 R2. Various changes to Windows security and kernel access on 2008 R2 and 2012 mean that these older apps will fail at the first hurdle on any x64 OS. The same challenge exists if you want to move from Windows XP to Windows 7 or 8, and if you want to go for a VDI solution like Citrix XenDesktop or VMware View.

This is not the same challenge as deploying the application. Using tools like AppV or Citrix Streaming, or Unidesk doesn’t get around the problem of the application not working on the platform. These tools help with deployment – not compatibility if the application doesn’t work.

This is a big challenge for companies with a large set of applications. Hospitals, councils and other government department have hundreds of applications. Some private sector companies with lots of staff and specialist manufacturing systems have apps written by staff that may have left years ago – but the business relies on those applications for critical processes. I know of one customer who is still running Windows NT 4 and Citrix MetaFrame 1.8 because of this very issue. They also have Windows Server 2000 and 2003 with Citrix XP and PS4. The apps are written as 16 bit. The systems are years out of support – but they can’t migrate the applications – they just don’t run. They have a XenApp 6.5 farm on 2008 – but can’t deploy the apps.  The risk to the business is running aging applications on old server platforms with no support, poor recovery methods and lack of best practice and security. With little or no chance or being updated  - without massive cost just to evaluate the code.

So what do you do? You could take the application and ask one of your developers (if you have one) to dissect the code, tell you what’s wrong and then fix it. This could take weeks depending on the code and your developer’s knowledge of an app he didn’t write, in a language he’s never used. There is a good chance something will be missed. You could engage an external developer to look at the app and the code, and give you a quote for rewriting it. That could also take weeks, and be very expensive – per application. Multiply that across your entire application list and you could be looking at a substantial outlay to get your applications up to Windows 8 and Server 2012 standards.

The Citrix answer to this challenge is AppDNA. AppDNA “reduces the amount of testing needed for applications and provides detailed information that can be used as the basis for the overall testing plan when migrating”.

  [ ![app1](http://cjrainey.files.wordpress.com/2014/07/app1.png?w=300&h=229) ](https://cjrainey.files.wordpress.com/2014/07/app1.png)

AppDNA – Windows 8 overview. Five applications analysed, one needs re-written, others need some work and two are good to go.

This is a powerful analysis tool that can take your application installer MSI, capture or AppV package and deploy it through a virtual machine template and pull together all the changes, DLL’s, registry and system security changes that are required to get it installed. The AppDNA server is then able to compare this to various target operating systems that you want to migrate to – and provide you with a very detailed breakdown of the applications requirements and what’s needed to get it over to the new OS. Newer applications may only require a few changes.

Older applications may require complete re-write. Either way , the system reports this back in minutes – not days or weeks. Inject a several more application into the system and you could easily have an estimate of the work involved in updating or re-writing  your critical applications. Web sites can also be targeted to report back on browser compatibility using user simulation and a web spider tool. Using an easy to follow Red, Amber,Green traffic light system – management reports and effort calculations can be provided.

The latest 7.5 version is available for download and trial, bundled with Platinum Edition, and includes integration with XenServer, VSphere and Hyper-V as well as VMware Workstation. As a Citrix engineer I can see this being a very useful tool and could drastically reduce the time, effort and cost involved in application migration to the latest server and desktop operating systems. Still, I’m glad I’m not a developer!

Some sample reports:

![app3](http://cjrainey.files.wordpress.com/2014/07/app3.png?w=610&h=255)

[ ![app4](http://cjrainey.files.wordpress.com/2014/07/app4.png?w=601&h=208) ](https://cjrainey.files.wordpress.com/2014/07/app4.png)

**References:**

AppDNA – Over View

[http://www.citrix.com/products/appdna/overview.html](http://www.citrix.com/products/appdna/overview.html)

Citrix TV – AppDNA

[http://www.citrix.com/tv/#tags/appdna+7.5](http://www.citrix.com/tv/#tags/appdna+7.5)

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/105/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/105/) ![](http://stats.wordpress.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=105&subd=cjrainey&ref=&feed=1)
