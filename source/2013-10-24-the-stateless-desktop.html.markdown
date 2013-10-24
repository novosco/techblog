---
title: The Stateless Desktop
date: 2013-10-24 16:34 UTC
tags: Desktop,VDI,RDS
author: crod
---
I tried to keep it quiet, after watching the rise of the VDI industry and what everyone, or most, were attempting, in order to replace our old buddy the desktop.
In many ways it all started with the virtualization Lords. These were, in most cases, the ones responsible for virtualizing servers what, without generalizing or offending anyone, meant they had no real clue what a desktop was and how it had to function. Or what real users were facing or experiencing on a daily basis.

READMORE

Without that knowledge the vLords, thinking they had all the required knowledge of course, started a crusade against the real desktop. Every single desktop had to be virtual. The rise of VDI. Many industry analysts predicted that millions of users would be running virtual desktops by 2013 and that physical desktops would become as rare as Silver Lamborghinis with manual transmissions and dual tone interior.

Well it did not quite happen that way.

And several lessons were learned (or at least I hope) along the way.

This blog post will actually be a series of posts, laying down the foundation about what I think is the stateless Desktop and why I truly believe this can actually be delivered in most cases to the end-users (where it makes sense of course – I am not starting Crusade #2 against the good ol’physical desktop). Oh and all that without any sort of SAN into the mix.

#A little bit of history

If you have been involved with RDS (known as Terminal Server, circa 2008) and the concept of a shared desktop (where multiple users connect to a single instance of an OS at the same time, each one with its own ‘space’ if you will), you probably understand many of the issues, or pre-requisites depending how you look at it, the solution has.

The idea, since day one, was to give users access to multiple machines (without them knowing – for them it was a remote solution pure and simple) so in case one dies the other one is there to allow the user to reconnect. As we could not predict where the user would be connected at any given time, a solution had to be in place to make sure the user documents, settings and preferences were always there with the user, no matter where he connected to.  

This was achieved with a combination of several technologies and/or mechanisms like:  

* Roaming Profiles.  
* Folder Redirection.  
* Network Drives.
* Etc  
  
The bottom line is all machines would be identical (ideally) and therefore all the required applications would be always available to the user. His data (his files and preferences/settings) would be there as well thanks to the above.

Due to limitations and/or issues with these tools or technologies we learned quite a bit about the user environment, about applications and so on. These were the days of the TS Lords. At that time any administrator that had a TS or Citrix farm under his belt understood user and application issues and how all these things cobbled together.

God save the TS Lords. Sorry, RDS Lords now.

So yes, in the RDS world users were able to work on systems that were supposed to be identical, with their settings and files stored somewhere else and made available to them when needed. Yes, it had its quirks and moments but at the end all of us survived and people were able to do their jobs. Keep that in mind.

On the next post I will discuss another thing that many seem to forget: what we are actually replacing with a virtual desktop and why it is important to understand that.  


