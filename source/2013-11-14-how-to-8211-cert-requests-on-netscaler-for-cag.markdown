---
title: How to &#8211; Cert requests on NetScaler for CAG
date: 2013-11-14 15:57:34 +0000
tags: Uncategorized
author: rainco
---

When setting up a virtual CAG on NetScaler – you can apply a certificate in a couple of different ways.

One option is to use IIS and request the certificate, return the request from the vendor and then use openssl on the IIS server, to convert the IIS to .PEM format.

Another option is to use the NetScaler admin tools to generate the request. To do this, you first must have your NetScaler license applied.

When requesting a cert from the NetScaler you have to generate a private key file. This is attached in the code of the cert request file, and then used to verify the source when you re-import.

You can also use a wildcard certificate. This is likely to be one that is used in other web servers so it’s important you know the private key password so you can import. You may also have to carry out the openssl conversion on IIS server before you can use on the NetScaler.

NetScaler can of course host multiple CAG vm, and act as a proxy for other internal sites –as well as perform SSL of loading for secure site traffic – so you could have more than one certificate on NetScaler.

I’m going to create my certificate request on the NetScaler using the admin gui.

- Go to Traffic Management and SSL – look for Create RSA Key
- This prompts for filename – which is held on the NetScaler file system.
- Give the file a name, a bit size – usually 2048 and then format – PEM and Encoding DES.
- Enter a passphrase and then confirm this – make sure you record it or use a familiar phrase.
- You can check the location of the file using Manage Certificates – which lists the folder location of the certificate and key files.
- Next, generate the certificate request using Create CSR.
- In the next screen, enter the details of the cert request as shown here.
- Give the cert request a name – and Browse to the key file.
- Enter the passphrase, and fill in the Distinguished Name Fields.

Make sure that the cert or domain name you are requesting is actually associated with the company.

This can cause issues if the company name is not precise – so worth checking the domain in a whois lookup.

Also make sure you enter the fields marked “\*” – an error will prompt you if you miss any. Also, before going to site – do the cert request at least a week in advance – it can take several days to get certs approved by some vendors in relation to government organisations for example.

When confirmed, click OK – then go into Manage Certificates to locate the request.

At this stage, you will need to either download the file OR select View and copy the text.

Your request is now ready to be submitted to a certificate authority.

On return, download the certificate and.

You should also apply the intermediate certificate chain and link it to your main cert.

To do this, get the intermediate cert from the vendor, and save to local folder.

- Click on Install and browse to the folder – give the intermediate cert a name eg DaddyBundle, and click on Create then Close.
- In the main cert screen – you can then right click on main CAG cert and select Link – then select the DaddyBundle.
-  Click ok
- You can now assign the ssl cert to your virtual CAG.

The process is pretty easy once you do it a few times, so do practice it before you go to site or get stuck with a support call.

**References:**

**Generate SSL Cert Request**

[http://support.citrix.com/article/CTX109260](http://support.citrix.com/article/CTX109260)

**Converting CAG pfx to PEM**

[http://support.citrix.com/article/ctx106028](http://support.citrix.com/article/ctx106028)

**OpenSSL Commands**

Convert a DER file (.crt .cer .der) to PEM

openssl x509 -inform der -in certificate.cer -out certificate.pem

When converting from IIS – you need to import on the IIS server you generated the request from  – otherwise export with key will fail.

Convert a PEM file to DER

openssl x509 -outform der -in certificate.pem -out certificate.der

Convert a PKCS#12 file (.pfx .p12) containing a private key and certificates to PEM

openssl pkcs12 -in keyStore.pfx -out keyStore.pem -nodes

    
[ ![](http://feeds.wordpress.com/1.0/comments/cjrainey.wordpress.com/33/) ](http://feeds.wordpress.com/1.0/gocomments/cjrainey.wordpress.com/33/) ![](http://stats.wordpress.com/b.gif?host=cjrainey.wordpress.com&blog=60326277&post=33&subd=cjrainey&ref=&feed=1)
