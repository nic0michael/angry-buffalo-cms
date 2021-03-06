<%@ page import="za.co.nico.cms.HomepageController" %>
<%
    HomepageController homepage=new HomepageController()
    String pageId=params.page_id;           // http://grails.org/doc/2.4.x/ref/Controllers/params.html
%>
%{--<%= pageId %>--}%
<div id="container" style="width:1024px">

    <div id="header" style="background-color:#8ddd84;">
        <table width="100%">
            <tr>
                <td width="15%"></td>
                <td width="70%" valign="top" align="center">
                    <h1 style="margin-bottom:0;">&nbsp;${hc?.homePageTitle()}</h1>
                </td>
                <td width="15%"></td>
            </tr>
        </table>

    </div>

    <div id="menu" style="background-color:#80aa6f;height:200px;width:100px;float:left;">
        <b>Menu</b><br>
        &nbsp;<br>${hc?.homePageMenu()}
    </div>

    <div id="content" style="background-color:#FFFFFF;height:85%;width:550px;float:left;">
        ${hc?.pageContent(pageId)}
    </div>

    <div id="footer" style="background-color:#8ddd84;clear:both;text-align:center;">
        &nbsp;${hc?.siteCopyright()}
    </div>

</div>
