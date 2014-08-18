---
title: ShareFile Enterprise  &#8211; to Mobility and beyond!
date: 2014-08-07 12:55:07 +0100
tags: Citrix
author: rainco
---

With so many customers looking at ShareFile I often get asked how it works and where does the data get saved and sync’d. In this blog, I will give you a quick overview of ShareFile Enterprise and some of the useful tools you can use for accessing, sharing and syncing your files and data to a secure location in your data centre.

ShareFile is a Citrix product that competes directly with Dropbox, Google Drive and other online file sync tools of which there are now dozens available – all with cloud storage, some with on premise and varying security standards. With ShareFile you can store data in the cloud and in your data centre as well as getting access to your existing file server resources and NAS drives in your secure network.  For full details, check out the Citrix web site – but here is a quick overview for now.** **

[ ![sf1](http://cjrainey.files.wordpress.com/2014/08/sf1.png?w=362&h=245) ](https://cjrainey.files.wordpress.com/2014/08/sf1.png)

The StorageZone Controller provides users with secure access to SharePoint document libraries and network file drives through Storage Zones Connectors. Users log onto ShareFile from their mobile device and retrieve a list of enterprise data repositories, which may include network drives and SharePoint document libraries.

After choosing an enterprise resource, the user authenticates with the StorageZone Controller using their company credentials, and is then able to enumerate and securely transfer files between the mobile device and the customer data center.

![sf2](http://cjrainey.files.wordpress.com/2014/08/sf21.png?w=451&h=209)

 

All  folders here – except _Internal NovoShare_ – are hosted on Citrix ShareFile cloud. We have a 20gb cloud store. By default, all users’ folders are on the internal storage.

The _Internal NovoShare_ is an iSCSI attached NAS with 3TB data available to staff. This is called a StorageZone, and runs on an internal Windows 2008 R2 server and gives our users about 20Gb each.

[ ![sf3](http://cjrainey.files.wordpress.com/2014/08/sf3.png?w=404&h=141) ](https://cjrainey.files.wordpress.com/2014/08/sf3.png)

Being ISO certified, all our key data resides in a secure data center with very controlled access. Only our BCP documents would be stored in the Citrix cloud for emergencies.

Below – _Connectors _– links into your existing NTFS shares and SharePoint document repositories. New connectors can link into DropBox and other storage to enable migration or two way collaboration.

[ ![sf4](http://cjrainey.files.wordpress.com/2014/08/sf4.png?w=427&h=167) ](https://cjrainey.files.wordpress.com/2014/08/sf4.png)

All of these folders are residing in our secure hosted data center. None of the files get sent to the Citrix Cloud – which only acts as a broker and authentication.

**Single Sign-On from AD**

Logging into the MDM portal on a browser, allows you to click on ShareFile – and seamlessly login to the ShareFile web site.

![sf5](http://cjrainey.files.wordpress.com/2014/08/sf5.png?w=300&h=112)

SAML single sign-on can also be enabled for using the _/SAML/login_ extension to the normal web portal.

**Outlook Plugin**

[ ![sf6](http://cjrainey.files.wordpress.com/2014/08/sf6.png?w=700) ](https://cjrainey.files.wordpress.com/2014/08/sf6.png)

 

 

 

 

This is very useful and allows files to be attached easily from ShareFile –  and to attach new files, that are then sent into ShareFile instead of emailed to multiple recipients.

**Desktop Widget**

Allows you to browse into your files and folders from a Windows/Mac desktop.

[ ![sf7](http://cjrainey.files.wordpress.com/2014/08/sf71.png?w=387&h=197) ](https://cjrainey.files.wordpress.com/2014/08/sf71.png)

**Sync Tool**

Sync Tools allows you to sync local folders up to your ShareFile storage.

[ ![sf8](http://cjrainey.files.wordpress.com/2014/08/sf8.png?w=359&h=100) ](https://cjrainey.files.wordpress.com/2014/08/sf8.png)

So, if your local laptop drive is encrypted as it should be , you can sync all or some of the data files to the Sharefile cloud folders.

**Citrix World Wide ShareFile**

[ ![sf9](http://cjrainey.files.wordpress.com/2014/08/sf9.png?w=300&h=164) ](https://cjrainey.files.wordpress.com/2014/08/sf9.png)

Citrix ShareFile uses a “Control Plane” – sharefile.com and sharefile.eu, are used for broker authentication and location of data when hosted.  For example, European customers can choose to have the data in .eu. The Control Plane provides users with a list of files and folders, but doesn’t hold them in the Citrix cloud if they are onsite – instead, the device is directed to the on premise store.

[ ![sf10](http://cjrainey.files.wordpress.com/2014/08/sf10.png?w=417&h=227) ](https://cjrainey.files.wordpress.com/2014/08/sf10.png)

Guest users and other contacts can be given access to shares and files very easily for single download or time restricted periods. FTP service? – no problem. Customizing your web portal is also very easy and provides a nice familiar interface for users. Various administrative rights can be delegated, and folder permissions granted so you can allow other users to control access and content.

ShareFile Enterprise is available as a separate product. However, if you are also considering an enterprise mobile device management (MDM) solution  Citrix XenMobile Enterprise includes ShareFile Enterprise for just a few dollars more than ShareFile on its own. Definitely worth checking that out. Free 30 days trial also available on request.

** **

**Some useful links:**

Main product information

[http://www.sharefile.com/](http://www.sharefile.com/)

ShareFile for Health

[http://www.sharefile.com/industries/Healthcare/?src=direct&v=e&cat=1](http://www.sharefile.com/industries/Healthcare/?src=direct&v=e&cat=1)

Security

[http://www.citrix.com/products/sharefile/features/secure-by-design.html](http://www.citrix.com/products/sharefile/features/secure-by-design.html)

Choose where data is stored

[http://www.citrix.com/products/sharefile/features/storagezones.html](http://www.citrix.com/products/sharefile/features/storagezones.html)

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/134/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/134/) ![](http://pixel.wp.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=134&subd=cjrainey&ref=&feed=1)
