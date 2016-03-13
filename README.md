
# Welcome to Angry Buffalo CMS (ABCms) Open-source Project

This is an opensource Groovy-Grails project that gives you a Open Source CMS Server which runs on the Tomcat , Glassfish web servers

After the Author: Nico Michael's wifes business web site, which running Joomla was hacked Nico decided to write the opensource project Nico'sCMS
from which this is forked as that would not credit to Nico only but to all who join and contribute to this project 

#About the Author: Nico Michael
 
Nico worked at Standard Bank South Africa as a senior Java Developer
Where he did Production Support on their Vignette CMS system
This Vignette CMS system runs on the IBM Websphere server which is designed for very large traffic (IBM hosts the Olympic games on the same software stack)
Later Nico became team leader of a team of template developers

After leaving Standard Bank, Nico became a volunteer of an American NGO , Hellenic Electronic Communications (HEC)
At HEC he persuated their Executive Committee to move away from Static web pages and use a CMS system
Nico Chose the Java Based OpenCMS and found that they did not provide more than one free template
It was one of the HEC projects for the St Nicholas Church of Japan in Johannesburg that Nico wrote a template
"The StNicholas Template" and contributed it to open-source to allow OpenCMS developers to have an alternative template to use. 
This template appeared in the definitive book on template development for OpenCMS .

Later Nico persuaded the Executive Committee of HEC to replace OpenCMS with Joomla as this CMS came with many free templates you can download from the Internet
Nico even placed his wife's business on Joomla until one day when the site was hacked , and the details of her business were published in a hackers website 

# Leassons learned
 
1)When working on the Vignette CMS Nico had to write a program the "Auto-Cacher" to allow a very large website to have all
  its new content cached so as not to give the Banks customers degraded web page performance on paged with new content 
2)Most CMS systems out there require a developer with special skills to write new templates
3)Many CMS systems can be broken into by hackers (with Brute force and other hacking penetration techniques ,  Kalilinix)

Nico wanted his CMS project to get arround all of these problems

# Features
 
1) An easy to use Joomla lookalike (But thats where the similarities end) 
2) Better security using a login page with a Capcha image to block bruteforce 
3) Most CMS applications feature Templates that require a fair amount of Coding skills HTML PHP Java ...etc
   We provide a way to define Templates based on existing building blocks without having to write complex code
4) Using a template manager The administrator can create Templates without writing a line of code
   Just choosing from 15 the BaseTemplate  (tableTemplate or divTemplate) Associating banner and other imges and styles
5) A move away from PHP based CMS's which seem to be targeted by Hackers we have moved to Java WAR file that can be
   deployed on Tomcat or Glassfish web servers
6) We have chosen the Groovy Language written on the Grails platform
7) Some of the Comercial CMS programs do not allow the Webmaster to cache the content. We added two Cache Buttons.
   So you don't have to wait for the pages to be loaded before they are cached
8) The Cached content is stored as encoded files not HTML text files making it a bit harder for hackers to modify

# Wish List
 
1) To save the IP address of the user making a failed login and when that IP has 3 failed loggins to block that user for 24 hours
2) create Divtemplates to use in addition to the tableTemplate creating wenb pages with Div tags instead of Teble Tags
   (We already have the DivTemplate we just need to integraye it and to test it
3) The vestigial NicoCMS files to be renamed to ABCms files
4) To encrypt the Cached files to make them harder to modify by Hackers 

# Websites
 
http://www.arduino.org.za/angry-buffalo-cms/


# To login go to:
 
http://localhost:8080/Angry_Buffalo_CMS/admin

We have recently release a stable version of NicosCMS and completed the first set of easy to read and comprehensive documentation for the 
Administrator and the developer
In short we have taken a few CMS systems looked at their features and their dissadvantages and came up with a new approach with the emphasis 
on functionality and simplicity 

# SDK Versions
 
Grails 2.2.2
Java 1.7

# Pluggin Versions
 
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.8.3"
        runtime ":resources:1.1.6"
        build ":tomcat:$grailsVersion"
        runtime ":database-migration:1.3.2"
        compile ':cache:1.0.1'
        compile ":ckeditor:4.4.1.0" (We plan to use ckeditor:4.5.4.0 when we upgrade the Grails version)


# This software is licensed  
 
Under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; 
either version 3.0 of the License, or (at your option) any later version.

