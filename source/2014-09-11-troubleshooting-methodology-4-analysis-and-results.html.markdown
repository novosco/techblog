---
title: Troubleshooting Methodology 4 &#58; Analysis and results
date: 2014-09-11 13:26 UTC
tags: Troubleshooting
author: shane_bre
---

At the risk of sounding like a debater, let me begin with a definition: The Oxford English Dictionary defines Analysis as:  

> Detailed examination of the elements or structure of something

Another good word for this step would the Theorising. OED gives us:  

> Form a theory or theories about something

READMORE

Basically we look at the information we have gathered and try to come up with an explanation for the occurrence from it. The order is most important as if you theorise before getting some data the temptation is to make the data fit the theory rather than the theory fit the data. Holmes was very clear on the unacceptability of this in the previous post! Most of this phase changes from issue to issue and there are a lot of times where this phase is done in parallel with the data collection phase (sometimes the cause is obvious when you get some information on the problem). While there is much variation in how the analysis proceeds there are a few general questions that always need to be answered:

- Patch levels: is the product on a supported version?
- Does the issue description match a known bug?
- Check event logs around the time of the known occurrences of the issue. Any items of note should be recorded even if they don’t appear relevant at the moment, may be useful later.  
- Confirm it's not a configuration issue.

Results:

The final phase -and if you're working in a customer facing support role, the most important one -is giving results to the interested parties.  

The end result of the analysis will take one of four forms:  

- The cause is identified and the issue resolved.
- The cause is not identified but an acceptable work around is found.  
- The cause is not identified and no workaround is possible. Needs to be escalated to vendor.  
- The cause is not identified and you have to refine the approach and find more information.  

Of the above results I would honestly only consider #1 and #3 to be the end of the matter. With 1 you have resolved the problem and with 3 its escalated to the vendor and you have to work with them but with specialist help a solution should be found or at least a cause identified. I would consider #2 to be ok in the short to medium term but not a valid solution in the long term and obviously #4 means you have to start the whole process again.  

Hopefully the time spent reading these posts will help refine whatever method you use to troubleshoot issues.
