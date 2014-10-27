---
title: Troubleshooting Methodology 3 &#58; Data Collection
date: 2014-09-11 13:10 UTC
tags: Troubleshooting
author: shane_bre
---

For a completely fictional character, Sherlock Holmes does give some great quotes:  

> "It is a capital mistake to theorize before one has data. Insensibly, one begins to twist facts to suit theories, instead of theories to suit facts."

To solve any problem you need data on what is happening. Without data, you are effectively playing darts blindfolded.  

READMORE

Data takes many forms and it's not all about log collection. In all honesty, logs are usually one of the last things you look for. Unless you have some idea of what you are looking for, there is just too much information to parse. The only reasonably common exception to this would be the Windows event logs as (a) they really don’t record verbose logs and (b) if you have timings for when the problem occurred you can really focus your searches. Generally though the answers from the scoping questions (listed in previous post) are much more useful during the initial phase of the troubleshooting. Of the scoping questions the most important questions are:

- Has this ever worked?
- Is it a supported configuration?

If the configuration is never going to work you are trying to perform a miracle rather than troubleshoot, and miracles in production environments are best avoided.  

It's hard to give specific recommendations about what data to collect as this will vary massively from problem to problem. In fact in my experience the scoping questions usually end up being the data collection for all but the most intractable of problems. While I can't give specific recommendations about information required there is some general information always required:

- Environmental information ( Virtualisation, physical, Operating system, etc.)
- Software versions and hotfix/patch level
- For Windows servers, event logs are always a good place to start
- Reproducibility or timings of when the issue occurs/occurred
- Screenshots of error messages or videos of the event happening.

That last one may seem strange but that whole "picture being a thousand words " isn't a total exaggeration. In a previous job with a software vendor I had a case once where a customer was having a graphical display problem with the software. After sometime troubleshooting it for some time and getting nowhere I eventually showed the video the customer had sent me to a colleague who knew exactly what bug it was and supplied me with a fix. This illustrates two things: 1) don’t be afraid to ask for help and 2) pictures/videos can be the bit you need to solve the problem
This is the penultimate blog of the series. The final blog will cover Analysis and results.