---
title: My Review of EMC World 2014
date: 2014-05-15 09:44:45 +0100
tags: EMC
author: stejoh
---

This year, thanks to my employer Novosco (an EMC Partner), I got the chance to return state-side to EMC World in Las Vegas. I had an amazing time and am now only recovering properly from the jet lag and the madness that is Vegas.

[ ![photo 3](http://www.neogeek.net/wp-content/uploads/2014/05/photo-3-e1400143356705-225x300.jpeg) ](http://www.neogeek.net/wp-content/uploads/2014/05/photo-3-e1400143356705.jpeg)

From the conference, there were a number of big announcements, those that excited me most were:

**VNXe 3200 -** Which includes a pretty impressive MCx overhaul as well as bringing in new features such as FAST Cache/ FAST VP and Fibre Channel connectivity which are all firsts for the VNXe family and makes it nearly as feature rich as its bigger brother the VNX.

**ViPR 2.0 -** With the introduction of data services rather than just operating in the control plane, this is something truly to get excited about. Its got Object but now it also has ScaleIO baked-in to provide Block services (How cool is that!). They also announced that the Controller now supports HDS arrays and vBlocks.

**XtremIO Snapshots -** XtremIO gets an upgrade to include snapshots with zero overhead meaning you can go nuts. I should also mention there is a Flash Rescue Program for customers who purchased a competitor All-Flash Array (AFA), are disappointed with how it performs or behaves and need an AFA that lives up to the hype.

There was also mention of a software-only version of OneFS (from Isilon and dubbed vOneFS) which will be a supported version of the virtual Isilon (which I have running on my home ESXi server and is well worth checking out!) and a software-only version of VNX (Project Liberty) targeted at test/dev.

One of my goals before heading to Vegas was to find out more about VPLEX VE. As a huge fan of VPLEX I wanted to see just what the Virtual Edition could offer so attended a session covering the architecture. It give me a greater insight into the product, its current abilities (VNXe only today) and merits further comment but too much for here so I will follow up on this in another post.

My personal highlight of this year’s conference was Chad Sakac’s Area 52. The session was held in the largest of the rooms (a definite requirement as Chad always draws a crowd). It’s hard to describe the scale but a large room in Vegas is an insanely massive room anywhere else, think of a football field or maybe even more, where the back row of seats would only just see Chad on stage and I’m not referring to his height either (for those who don’t know, Chad is not a tall man). The room was rigged up with multiple screens to display Chad, the other presenters on stage and the slide contents. I had 3rd row seats, as you can see below.  
[ ![photo 1](http://www.neogeek.net/wp-content/uploads/2014/05/photo-11-300x225.jpeg) ](http://www.neogeek.net/wp-content/uploads/2014/05/photo-11.jpeg)  
Having followed Chad’s Virtual Geek posts on storage classification (which he likened to phylum) I found it engaging and thoroughly enjoyable with the session covering the same key points as his blog posts (check out the first one [here](http://virtualgeek.typepad.com/virtual_geek/2014/01/understanding-storage-architectures.html#more "http://virtualgeek.typepad.com/virtual_geek/2014/01/understanding-storage-architectures.html#more")). The difference was on top of his blog content, there were awesome demos of what EMC are doing in each of these areas with not every feature being completely ready for release but well on the way. They demoed Unisphere Central, EMC Storage Integrator (free), Protectpoint which is VMAX / Data Domain integration featuring lower backup load going over the network with a massive reduction backup time, XtremIO Snaps with the impact (or lack of) of its use, OneFS Cloud Pools which is basically Isilon spanning cloud services and ScaleIO running on cloud services and being moved with a live workload against it to the EMC Hybrid Cloud.  
As if those demos weren’t awesome enough, he then went on to cover what he describes as the new 5th storage type thanks to their acquisition of DSSD (really excited to hear more on this – Chad has a post on it [here](http://virtualgeek.typepad.com/virtual_geek/2014/05/a-new-5th-branch-in-the-storage-tree-of-life.html "http://virtualgeek.typepad.com/virtual_geek/2014/05/a-new-5th-branch-in-the-storage-tree-of-life.html")).

**Afterthought**  
After leaving Vegas the afterthought is very much that EMC are full throttle at creating software-only versions of their products and to make things easier they are integrating these into ViPR. Many of these software-only versions are available from their support site to get them out there, get the customer/partner familiar and to make them easier to adopt. On that note I highly recommend the virtual Isilon, go build yourself a cluster, its excellent. ViPR is also freely available since it is becoming the key management interface (with much more) it is also very much worth the download.  
Continuing on my afterthought, it is clear that EMC recognised a while back that the era of having every product with tie in’s between tin and software are over, it has never been more clear as we are now seeing the fruits of their pursuit in providing software-only versions of everything. I make this comment knowing full well that tin/software tie in’s will probably always have their place in this industry for guaranteed results, I’m thinking hardware VNX/VMAX/XtremIO, VBLOCKs, or a non-storage example would be Apple products. Its very much about the synergy between the defined stack and software running on it but in todays world, in some cases people prefer mobility and flexibility which has its cost but as always is about weighing up the pro’s and con’s of the differing solutions.  
It all makes me realise that we have an exciting period ahead where the need for customers to be aligned to knowledgable partner companies is, if anything, increasing because there are so many more choices today rather than just go with a hardware scale-up storage array and keeping on top of the options is a mammoth task which the typical customer doesn’t always have time for.
