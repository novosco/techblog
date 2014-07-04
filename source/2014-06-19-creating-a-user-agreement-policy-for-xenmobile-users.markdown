---
title: Creating A User Agreement Policy for XenMobile Users
date: 2014-06-19 10:49:40 +0100
tags: Uncategorized
author: rainco
---

Getting users to agree to security policies is tricky enough at the best of times. It’s one thing to say your managing devices – but do your users agree to how you do it, how you monitor their use of the device and access to your corporate data? We could spend a lot more time discussing that question – but for now, lets get a basic agreement in place for smartphones and tablets. Make sure you run it past HR and that you are quoting the correct IT policies and terms of use. You should have these in place for PC and laptops already.

Notices are pushed out from the XenMobile server using a combination of a simple PDF document and a Deployment package targeted at a group of users or mobile devices. Inserting the Notice to a Base Package will ensure all devices get it on enrollment.

There are three main steps to deploying the notice:

- Create Security Notice document
- Deploy to test user/group
- Deploy in live package

First, start by creating your security or user agreement notice – bearing in mind the size of the device screen. For example, A5 is well suited to 9/10” tablet devices. Include your company logo or letter heading to brand and make it look official.

Save the document as a PDF to your local PC. Then go into the MDM Console.

[ ![pol1](http://cjrainey.files.wordpress.com/2014/06/pol1.png?w=394&h=24) ](https://cjrainey.files.wordpress.com/2014/06/pol1.png)

In the Files tab, click on New File – upload the document.

[ ![pol3](http://cjrainey.files.wordpress.com/2014/06/pol3.png?w=410&h=138) ](https://cjrainey.files.wordpress.com/2014/06/pol3.png)

Select the document, and tick the button for Term and Conditions PDF – and Default if required.

[ ![pol3](http://cjrainey.files.wordpress.com/2014/06/pol3.png?w=502&h=169) ](https://cjrainey.files.wordpress.com/2014/06/pol3.png)

Then go to the Deployment tab. Select a Base Package – select Files, and use “>” to add to Resources to Deploy.

[ ![pol4](http://cjrainey.files.wordpress.com/2014/06/pol4.png?w=391&h=215) ](https://cjrainey.files.wordpress.com/2014/06/pol4.png)

You can then deploy the Package. New devices should now get prompted with the notice on enrollment.

Once in place, you can then use the Reporting tab and get feedback on who has accepted the policy using the Terms and Conditions report.

[ ![pol5](http://cjrainey.files.wordpress.com/2014/06/pol5.png?w=468&h=142) ](https://cjrainey.files.wordpress.com/2014/06/pol5.png)

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/94/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/94/) ![](http://stats.wordpress.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=94&subd=cjrainey&ref=&feed=1)
