---
title: StoreFront 2.0  &#8211; September 2013
date: 2013-11-08 14:12:54 +0000
tags: Uncategorized
author: rainco
---

 

Citrix StoreFront v 2.0 has been out for a few months now and it’s finally worth a look if you haven’t already. StoreFront is what Citrix call “enterprise app store” where users can subscribe to applications just as you do with smartphone devices on Android or iOS.

[ ![clip_image002](http://cjrainey.files.wordpress.com/2013/11/clip_image002_thumb.jpg?w=244&h=106 "clip_image002") ](http://cjrainey.files.wordpress.com/2013/11/clip_image002.jpg)

The previous versions required you to install SQL Express on the server which is obviously an unwelcome addition as you have to them provide backup maintenance plans, and give your server a few more virtual sticks of RAM in your hypervisor.

READMORE

Early Storefront also proved to be a bit unreliable. After one install, I had to remove it and revert to Web Interface 5.4 as the Storefront Wallet Service kept failing and even a re-install would not fix.

With Web Interface 5.4 development at an end, and End Of Life coming in next year or two, its StoreFront you need to be installing and getting to know.

Version 2 is much leaner due to no SQL Express, and while the management console is still limited in terms of customisation (compared to Web I) – the Green Bubble GUI is now the same across web and mobile devices. Integration to CAG and your XenDesktop and XenApp farms is similar to Web-I and easy to setup.

I expect that the StoreFront management tool will get an upgrade soon to allow easy customisation and addition of your corporate logo and security notices.

[ ![clip_image004](http://cjrainey.files.wordpress.com/2013/11/clip_image004_thumb.jpg?w=212&h=159 "clip_image004") ](http://cjrainey.files.wordpress.com/2013/11/clip_image004.jpg)

With StoreFronts and App Controller – you can now push out other apps (Web/SaaS/Data) to users on web and mobile devices from your own company app store and integrate to XenMobile.

HA is much easier to configure in StoreFront compared to Web Interface. When you configure a 2nd server, it’s a simple task to initiate a link from server1 to server2.

You can then load balance in your Netscaler with Load Balancing. For migration, Web Interface and Storefront can co-exist on the same server, and Storefront can also act as the PNAgent site. Post testing -you can easily set the StoreFront web site as default in IIS and remove Web Interface.

**References:**

**StoreFront eDocs : **

[http://support.citrix.com/proddocs/topic/dws-storefront-20/dws-version-wrapper.html](http://support.citrix.com/proddocs/topic/dws-storefront-20/dws-version-wrapper.html)

**StoreFront @ CitrixTV:**

[http://www.citrix.com/tv/#videos/9334](http://www.citrix.com/tv/#videos/9334)

**Unified App Store OverView:**

[http://www.citrix.com/tv/#videos/5968](http://www.citrix.com/tv/#videos/5968)


[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/8/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/8/) ![](http://stats.wordpress.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=8&subd=cjrainey&ref=&feed=1)
