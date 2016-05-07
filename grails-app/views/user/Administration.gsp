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
<!--userId: ${session.userId} -->
<!--ipAddress: ${session.ipAddress} -->
<h1>&nbsp;&nbsp;&nbsp;Angry Buffalo CMS | Simple Administration Panel</h1>

<tag:isAdvancedAdmin  expanded="${session.expanded}">
    <tag:redirectDetailedAdministrationPage/>
</tag:isAdvancedAdmin>

<table width="650">
    <tag:isAdmin userId="${session.userId}">
        <tr>
            <td>

        <TR VALIGN=TOP ALIGN=center>
            <TD colspan="5">
                <h2><g:link action="DetailedAdministration" >Expand this page</g:link></h2>
            </TD>
        </TR>

        <tag:notInitialized>
            <TR VALIGN=TOP ALIGN=LEFT>

                <TD>
                    <table  WIDTH=50 HEIGHT=50 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                        <tr>
                            <td align="center"> <g:link controller="setup" action="presetTheData"  class="logon"><strong>Preset The System Data</strong></g:link><br>
                        </tr>
                    </table>
                </TD>

            </TR>
        </tag:notInitialized>

        <TR VALIGN=TOP ALIGN=LEFT>



            <TD>
                <table  WIDTH=50 HEIGHT=50 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"><g:link controller="user"  class="logon" action="logout"><g:img uri="/images/nicoscmsLogOutBtn.jpg" width="130" height="130" /><!-- strong>Logout</strong --></g:link></td>
                    </tr>
                </table>
            </TD>

            <TD>
                <table  WIDTH=50 HEIGHT=50 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>
                        <td align="center"> <g:link controller="categories" action="categoryManager"  class="logon" ><g:img uri="/images/nicoscmsCategoryManagerBtn.jpg" width="120" height="130" /><!-- strong>1_Category Manager</strong --></g:link></td>
                    </tr>
                </table>
            </TD>

            <TD>
                <table  WIDTH=50 HEIGHT=50 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <g:link controller="page" action="articleManager"  class="logon" ><g:img uri="/images/ArticleManagerBtn.jpg" width="130" height="130" /><!-- strong>2_Article Manager</strong --></g:link></td>
                    </tr>
                </table>
            </TD>


            <TD>
                <table  WIDTH=50 HEIGHT=50 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>
                        <td align="center"> <g:link controller="textContent"  class="logon"  action="textContentManager" ><g:img uri="/images/nicoscmsContentManager.jpg" width="130" height="130" /><!-- strong>3_Text_Content Manager</strong --></g:link></td>
                    </tr>
                </table>
            </TD>


            <TD>
                <table  WIDTH=50 HEIGHT=50 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                    <tr>

                        <td align="center"> <g:link controller="homepage" action="index" class="logon" target="_blank"><g:img uri="/images/nicoscmsViewWebContentBtn.jpg" width="130" height="130" /><!-- strong>View_CMS Web_Content</strong></strong --></g:link><br></td>
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
<br>


<tag:isNotAuthenticated  userId="${session.userId}">
    <tag:redirectLogonPage/>
</tag:isNotAuthenticated>
</body>
</html>