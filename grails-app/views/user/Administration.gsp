<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/13
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Administration Panel</title>
</head>
<body>
<h1>&nbsp;&nbsp;&nbsp;Angry Buffalo CMS | Administration Panel</h1>
<div>


    %{--Blue--}%
    <div class="btn-group">
        <button type="button" class="btn btn-primary">Administration Panel</button>
    </div>


    %{--White--}%
    <div class="btn-group">
        <button type="button" class="btn btn-default">Administrator's Functions</button>
        <button type="button" class="btn btn-default dropdown-toggle"
                data-toggle="dropdown">
            <span class="caret"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><g:link controller="user" action="Administration">1)&nbsp;Administration</g:link></li>
            <li><g:link controller="user" action="AdvancedAdministration">2)&nbsp;Advanced Administration</g:link></li>
            <li><g:link controller="user" action="controlPanel">3)&nbsp;Control Panel</g:link></li>
            <li><g:link controller="homepage" action="cacheContent">4)&nbsp;Cache the Content</g:link></li>
            <li><g:link controller="user" action="logout">5)&nbsp;Logout</g:link></li>
        </ul>
    </div>



    %{--White--}%
    <div class="btn-group">
        <button type="button" class="btn btn-default">Editor's Functions</button>
        <button type="button" class="btn btn-default dropdown-toggle"
                data-toggle="dropdown">
            <span class="caret"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><g:link controller="homepage" action="index" target="_blank">1)View Content</g:link></li>
            <li><g:link controller="categories" action="categoryManager">2)&nbsp;Category Manager</g:link></li>
            <li><g:link controller="page" action="articleManager">3)&nbsp;Article Manager</g:link></li>
            <li><g:link controller="textContent" action="textContentManager">4)&nbsp;Text ContentManager</g:link></li>
            <li><g:link controller="menu" action="menuManager">5)&nbsp;Menu Manager</g:link></li>
            <li><g:link controller="menuHierarchy" action="menuSave">6)&nbsp;Menu Hierarchy Manager</g:link></li>
            <li><g:link controller="page" action="frontPageManager">7)&nbsp;FrontPage Manager</g:link></li>
            <li><g:link controller="images" action="imageManager">8)&nbsp;Image Manager</g:link></li>
            <li><g:link controller="banner" action="bannerManager">9)&nbsp;Banner Manager</g:link></li>
            <li><g:link controller="template" action="templateManager">10)&nbsp;Template Manager</g:link></li>
            <li><g:link controller="homepage" action="deleteAllFileContent">11)&nbsp;Delete all Pages</g:link></li>
        </ul>
    </div>



</div>
<table width="600">
    <tag:isAdmin userId="${session.userId}">
        <tr>
            <td>

        <TR VALIGN=TOP ALIGN=LEFT>
            <tag:notInitialized>
                <TD WIDTH=70 HEIGHT=20>
                    <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                        <tr>

                            <td align="center"> <g:link controller="setup" action="presetTheData"  class="logon"><strong>Preset The System Data</strong></g:link><br>
                        </tr>
                    </table>
                </TD>
            </tag:notInitialized>
        </TR>

        <TR VALIGN=TOP ALIGN=LEFT>


            <TD WIDTH=70 HEIGHT=80>
                <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <g:link controller="homepage" action="index" class="logon" target="_blank"><g:img uri="/images/nicoscmsViewWebContentBtn.jpg" width="130" height="130" /><!-- strong>View_CMS Web_Content</strong></strong --></g:link><br></td>
                    </tr>
                </table>
            </TD>

            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <g:link controller="categories" action="categoryManager"  class="logon" ><g:img uri="/images/nicoscmsCategoryManagerBtn.jpg" width="130" height="130" /><!-- strong>1_Category Manager</strong --></g:link></td>
                    </tr>
                </table>
            </TD>

            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <g:link controller="page" action="articleManager"  class="logon" ><g:img uri="/images/ArticleManagerBtn.jpg" width="130" height="130" /><!-- strong>2_Article Manager</strong --></g:link></td>
                    </tr>
                </table>
            </TD>


            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>
                        <td align="center"> <g:link controller="textContent"  class="logon"  action="textContentManager" ><g:img uri="/images/nicoscmsContentManager.jpg" width="130" height="130" /><!-- strong>3_Text_Content Manager</strong --></g:link></td>
                    </tr>
                </table>
            </TD>

            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <g:link controller="menu" action="menuManager"  class="logon"><g:img uri="/images/nicoscmsMenuManagerBtn.jpg" width="130" height="130" /><!-- strong>4_Menu Manager</strong --></g:link></td>
                    </tr>
                </table>
            </TD>

        </TR>


        <TR VALIGN=TOP ALIGN=LEFT>


        <TD WIDTH=70 HEIGHT=20>
            <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>

                    <td align="center"> <g:link controller="page" action="frontPageManager"  class="logon" ><g:img uri="/images/nicoscmsFrontPageBtn.jpg" width="130" height="130" /><!-- strong>8_Front_Page Manager</strong --></g:link></td>
                </tr>
            </table>
        </TD>

        <TD WIDTH=70 HEIGHT=20>
            <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>

                    <td align="center"> <g:link controller="images" action="imageManager"  class="logon" ><g:img uri="/images/nicoscmsImageManagerBtn.jpg" width="130" height="130" /><!-- strong>5_Image Manager</strong --></g:link></td>
                </tr>
            </table>
        </TD>

        <TD WIDTH=70 HEIGHT=20>
            <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>

                    <td align="center"> <g:link controller="banner" action="bannerManager"  class="logon" ><g:img uri="/images/nicoscmsBannerManagerBtn.jpg" width="130" height="130" /><!-- strong>6_Banner &nbsp; Manager</strong --></g:link></td>
                </tr>
            </table>
        </TD>

        <TD WIDTH=70 HEIGHT=20>
            <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>

                    <td align="center"> <g:link controller="template" action="templateManager"  class="logon" ><g:img uri="/images/nicoscmsTemplateManager.jpg" width="130" height="130" /><!-- strong>7_Template Manager</strong --></g:link></td>
                </tr>
            </table>
        </TD>




        <TD WIDTH=70 HEIGHT=20>
            <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                 <tr>

                        <td align="center"> <g:link controller="user" action="AdvancedAdministration"  class="logon" ><g:img uri="/images/nicoscmsScaffoldBtn.jpg" width="130" height="130" /><!-- strong>Advanced_Administration Grails Scaffold</strong --></g:link></td>
                 </tr>
            </table>
        </TD>

        </TR>

        <TR VALIGN=TOP ALIGN=LEFT>


            <TD WIDTH=70 HEIGHT=115>
                <table  WIDTH=110 HEIGHT=110 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"><g:link controller="user"  class="logon" action="logout"><g:img uri="/images/nicoscmsLogOutBtn.jpg" width="130" height="130" /><!-- strong>Logout</strong --></g:link></td>
                    </tr>
                </table>
            </TD>

            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=90 HEIGHT=110 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center">
                            <a href="http://www.flamingtext.com/All-Logos" class="logon"  target="_blank"  ><g:img uri="/images/nicoscmsLogoMakerBtn.jpg" width="130" height="130" /><!-- strong>Logo_Maker1</strong --></a><br>
                            %{--<a href="http://logotypemaker.com/logo-maker" class="logon"  target="_blank"  ><strong>Logo_Maker2</strong></a>--}%
                        </td>
                    </tr>
                </table>
                <!-- http://www.freelogoservices.com/step1 -->
                <!-- http://logotypemaker.com/logo-maker -->
            </TD>
            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=80 HEIGHT=110 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>
                        <td align="center">
                            <a href="http://www.bannerfans.com/banner_maker.php" class="logon"  target="_blank"  ><g:img uri="/images/nicoscmsBannerMakerBtn.jpg" width="130" height="130" /><!-- strong>Banner_Maker_1</strong --></a><br>
                            %{--<a href="http://www.webbanner24.com/" class="logon"  target="_blank"  ><strong>Banner_Maker_2</strong></a>--}%
                        </td>
                    </tr>
                </table>
            </TD>


            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=80 HEIGHT=110 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <a href="http://www.phpform.org/" class="logon"  target="_blank"  ><g:img uri="/images/nicoscmsFormBuilderBtn.jpg" width="130" height="130" /><!-- strong>Online_Form Builder</strong --></a></td>
                    </tr>
                </table>
            </TD>




            <TD WIDTH=70 HEIGHT=20>
                <table  WIDTH=70 HEIGHT=70 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <g:link controller="homepage" action="cacheContent"  class="logon" ><g:img uri="/images/nicoscmsCacheContent_.jpg" width="130" height="130" /><!-- strong>Advanced_Administration Grails Scaffold</strong --></g:link></td>
                    </tr>
                </table>
            </TD>


            <!-- http://www.webbanner24.com/ -->
            <!-- http://mybannermaker.com/ -->
            <!-- http://www.bannerfans.com/banner_maker.php -->



        </TR>

        </td>
    </tr>
    </tag:isAdmin>
    <tr>
        <td>
            <a href="/NicosCMS/content/help/NicosCMS_EditorsGuide.pdf" target="_blank"><h2><strong>Editors Guide</strong></h2></a>
            <g:link controller="user" action="logon">Logon</g:link><br>
            <g:link controller="user" action="logout">Logout</g:link><br>
        </td>

    </tr>
</table>

<tag:isNotAuthenticated  userId="${session.userId}">
    <tag:redirectLogonPage/>
</tag:isNotAuthenticated>
</body>
</html>