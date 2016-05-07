<%--
  Created by IntelliJ IDEA.
  User: nickm
  Date: 3/19/16
  Time: 10:11 AM
--%>

<%@ page import="za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Administration Panel</title>
</head>
<body>
<%
    session.setAttribute("expanded","true");
%>
<!--userId: ${session.userId} -->
<h1>&nbsp;&nbsp;&nbsp;Angry Buffalo CMS | Administration Panel Expanded</h1>
<table width="600">

    <tag:isAdmin userId="${session.userId}">
        <tr>

        <TR VALIGN=TOP ALIGN=center>
            <TD colspan="5">
                <h2><g:link action="simple" >Simplify this page</g:link></h2>
            </TD>
        </TR>        <td>

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

                        <td align="center"> <g:link controller="user" action="AdvancedAdministration"  class="logon" ><g:img uri="/images/nicoscmsScaffoldBtn.jpg" width="130" height="130" /><!-- strong>Advanced_Administration Grails Scaffold</strong --></g:link></td>
                    </tr>
                </table>
            </TD>

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


        </TR>


    </td>
        </tr>
    </tag:isAdmin>
    <tr>
        <td colspan="5">
            <a href="../content/help/NicosCMS_EditorsGuide.pdf" target="_blank"><h2><strong>Editors Guide</strong></h2></a><br>
            <A href="http://www.webbanner24.com/" target="_blank">http://www.webbanner24.com/</A><br>
            <A href="http://mybannermaker.com/" target="_blank">http://mybannermaker.com/</A><br>
            <A href="http://www.bannerfans.com/banner_maker.php" target="_blank">http://www.bannerfans.com/banner_maker.php</A><br>
            <A href="https://www.base64encode.org/" target="_blank">https://www.base64encode.org/</A><br>
            <A href="https://www.base64decode.org/" target="_blank">https://www.base64decode.org/</A><br>
            <A href="http://mylanguages.org/converter.php" target="_blank">mylanguages unicode converter</A><br>
            <A href="http://www.bible-researcher.com/greek-unicode.html"  target="_blank">greek-unicode</A><br>
            <g:link controller="user" action="logon">Logon</g:link><br>
            <g:link controller="user" action="logout">Logout</g:link><br>
        </td>
    </tr>
</table>



</body>
</html>