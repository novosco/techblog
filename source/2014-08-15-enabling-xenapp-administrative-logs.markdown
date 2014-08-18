---
title: Enabling XenApp Administrative logs
date: 2014-08-15 11:21:47 +0100
tags: AppCentre
author: rainco
---

If you have a busy XenApp farm with lots of published apps, users and administrators who have (I hope!) got delegated access – you may often want to check on who made a change, or removed a published app or affected some other settings. XenApp 7.5 Desktop Director has logging enabled by default.

 

It often gets over looked during setup, but the History node in the XenApp AppCentre console is all you need. If you click on it, and it’s blank – then it’s not enabled and you will need to configure it. Here’s how!

[ ![log1](http://cjrainey.files.wordpress.com/2014/08/log1.png?w=300&h=140) ](https://cjrainey.files.wordpress.com/2014/08/log1.png)

Create a  service account for the DB owner- AD or a local SQL account on the database server, documenting the account and password.

Setup a new SQL database on your preferred server. By the way  –  If you want put the logs on the same server as your Farm DataStore server, you could look in the MF20.dsn and look for the “server=” line.  Start/Run  – \\citrixserver1\C$\Program Files (x86)\Citrix\Independent Management Architecture\  – should take you to mf20.dsn.

You can use Oracle, but all customers I come across are on SQL server.

Then create the database with a suitable name – eg xenapplog and assign the service account as the DB Owner.

Now – login to a DataCollector in your Citrix Farm. Right click on the farm name, and go to Farm Properties and click on Configuration Logging.

  [ ![log2](http://cjrainey.files.wordpress.com/2014/08/log21.png?w=361&h=95) ](https://cjrainey.files.wordpress.com/2014/08/log21.png)

Then click on Configure Database.

[ ![log3](http://cjrainey.files.wordpress.com/2014/08/log3.png?w=341&h=130) ](https://cjrainey.files.wordpress.com/2014/08/log3.png)

Enter the name of the database server, the authentication mode and the service account details.

[ ![log4](http://cjrainey.files.wordpress.com/2014/08/log4.png?w=300&h=220) ](https://cjrainey.files.wordpress.com/2014/08/log4.png)

Then select the database you created from the list.

![log5](http://cjrainey.files.wordpress.com/2014/08/log5.png?w=300&h=122)

Unless your database  uses encryption, select No for Use Encryption. Click Next.

[ ![log6](http://cjrainey.files.wordpress.com/2014/08/log6.png?w=300&h=251) ](https://cjrainey.files.wordpress.com/2014/08/log6.png)

Then click on Test Database Connection – OK, then Finish.

[ ![log7](http://cjrainey.files.wordpress.com/2014/08/log7.png?w=300&h=244) ](https://cjrainey.files.wordpress.com/2014/08/log7.png)

The only other option is to secure the delete options – by ticking the box for “Require Admin to enter database credentials before clearing log”. You did record that account password didn’t you?

[ ![log8](http://cjrainey.files.wordpress.com/2014/08/log8.png?w=300&h=109) ](https://cjrainey.files.wordpress.com/2014/08/log8.png)

Click on Get Log – and recent changes should start to appear. You can also amend the columns and set Filters for tasks and data range if looking to narrow down the search for changes.

![log10](http://cjrainey.files.wordpress.com/2014/08/log10.png?w=300&h=287)

So, a very useful addition to the console, and easy to setup. Happy Logging!

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/174/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/174/) ![](http://pixel.wp.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=174&subd=cjrainey&ref=&feed=1)
