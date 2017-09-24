<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/16
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>

<%
    List<Banner> banners =Banner.findAll()
%>

<%@ page import="za.co.nico.cms.Banner; za.co.nico.cms.Images; za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Template Editor</title>
</head>
<body>

<h1>&nbsp;&nbsp;&nbsp;NicoCMS | Template Editor</h1>
<h3>Operation :${operation }</h3>

<br><br>

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="template" action="templateSave">Administration</g:link></td>
        <td>&nbsp;&nbsp;</td>
    </tr>

    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>
            <g:form controller="template" action="templateSave" method="post">
                <input type="hidden" value="${operation }"  name="operation" id="operation"/>



                <div class="fieldcontain  required">
                    <label for="templateId">
                        Template Id
                        <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="templateId" maxlength="15" required="" value="${template?.templateId}" id="templateId" />
                </div>

                <div class="fieldcontain  ">
                    <label for="cssPath">
                        Css Path

                    </label>
                    <input type="text" name="cssPath" value="${template?.cssPath}" id="cssPath" />
                </div>

                <div class="fieldcontain  required">
                    <label for="bottomBannerId">
                        Bottom Banner
                        <span class="required-indicator">*</span>
                    </label>
                    <select id="bottomBannerId" name="bottomBannerId" required="" class="many-to-one" >
                        <option value="${template?.bottomBanner?.bannerId}" selected="selected" >${template?.bottomBanner?.toString()}</option>
<%
                        for(Banner banner:banners){
%>
                        <option value="${banner?.bannerId}"  >${banner?.toString()}</option>
<%
                        }
%>

                    </select>
                </div>

                <div class="fieldcontain  ">
                    <label for="published">
                        Published

                    </label>
                    <input type="hidden" name="_published" /><input type="checkbox" name="published" checked="checked" id="published"  />
                </div>

                <div class="fieldcontain  ">
                    <label for="templateJspFile">
                        Template Jsp File

                    </label>
                    <select name="templateJspFile" id="templateJspFile" >
                        <option value="${template?.templateJspFile}" selected="selected" >${template?.templateJspFile}</option>
                        <option value="divTemplate2" >divTemplate1</option>
                        <option value="divTemplate2" >divTemplate2</option>
                        <option value="htmlTemplate1" >htmlTemplate1</option>
                        <option value="userTemplate1" >userTemplate1</option>
                        <option value="userTemplate2" >userTemplate2</option>
                        <option value="userTemplate3" >userTemplate3</option>
                        <option value="userTemplate4" >userTemplate4</option>
                        <option value="userTemplate5" >userTemplate5</option>
                        <option value="userTemplate6" >userTemplate6</option>
                    </select>
                </div>

                <div class="fieldcontain  ">
                    <label for="templateName">
                        Template Name

                    </label>
                    <input type="text" name="templateName" value="${template?.templateName}" id="templateName" />
                </div>

                <div class="fieldcontain  required">
                    <label for="topBannerId">
                        Top Banner
                        <span class="required-indicator">*</span>
                    </label>
                    <select id="topBannerId" name="topBannerId" required="" class="many-to-one" >
                        <option value="${template?.topBanner?.bannerId}" selected="selected" >${template?.topBanner?.toString()}</option>
                        <%
                            for(Banner banner:banners){
                        %>
                        <option value="${banner?.bannerId}"  >${banner?.toString()}</option>
                        <%
                            }
                        %>

                    </select>
                </div>

                </fieldset>
                <fieldset class="buttons">
                    <input type="submit" name="create" class="save" value="Submit" id="create" />
                </fieldset>
            </g:form>
        </td>
        <td>&nbsp;&nbsp;</td>
    </tr>
</table>
</body>
</html>