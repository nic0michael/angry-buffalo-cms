<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    List<Page> pages = Page.findAll([sort: "pageId", order: "asc"]);
%>
<%@ page import="za.co.nico.cms.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Menu Editor</title>

</head>

<body>
<h1>Angry Buffalo CMS | Menu Editor</h1>
<table>
    <tr>
        <td></td>
        <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td>

            <h1>Menu Editor</h1>

            <h3>Operation :${operation}</h3>

            <g:form controller="menu" action="menuSave" method="post">
            %{--menuOrder--}%

                <g:actionSubmitImage value="Edit" action="saveMenuDetails"
                                     src="${resource(dir: 'images', file: 'SaveButton55.jpg')}"/> &nbsp;&nbsp;
                <g:actionSubmitImage value="Cancel" action="cancelMenuDetails"
                                     src="${resource(dir: 'images', file: 'CancelButton55.jpg')}"/>  &nbsp;&nbsp;

                <input type="hidden" value="${operation}" name="operation" id="operation"/>
                <fieldset class="form">

                    <div class="fieldcontain  required">
                        <label for="menuId">
                            Short Name (Menu Id) :
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="menuId" maxlength="15" required="" value="${menu?.menuId}" id="menuId" />
                    </div>

                <div class="fieldcontain  ">
                    <label for="label">
                        Label

                    </label>
                    <input type="text" name="label" value="${menu?.label}" id="label"/>
                </div>

                <div class="fieldcontain  required">
                    <label for="menuOrder">
                        Menu Order
                        <span class="required-indicator">*</span>
                    </label>
                    <input type="number" name="menuOrder" value="${menu?.menuOrder}" required="" id="menuOrder"/>
                </div>

                <div class="fieldcontain  required">
                    <label for="pageId">
                        Text Content(Page) :
                        <span class="required-indicator">*</span>
                    </label>
                    <select id="pageId" name="pageId" required="" class="many-to-one">
                        <option value="${menu?.page?.pageId}" selected="selected">${menu?.page?.toString()}</option>
                        <%
                            for (Page page : pages) {
                        %>

                        <option value="${page?.pageId}">${page?.toString()}</option>
                        <%
                            }
                        %>
                    </select>
                </div>


                <div class="fieldcontain  required">
                    <label for="siteId">
                        Site
                        <span class="required-indicator">*</span>
                    </label>
                    <select id="siteId" name="siteId" required="" class="many-to-one">
                        <option value="${menu?.site?.siteId}" selected="selected">${menu?.site?.toString()}</option>
                        <%
                            List<Site> sites = Site.findAll()
                            for (Site site : sites) {
                        %>
                        <option value="${site.siteId}">${site.toString()}</option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="fieldcontain  ">
                    <label for="menuURL">
                        Menu URL

                    </label>
                    <input type="text" name="menuURL" maxlength="128" value="${menu?.menuURL}" id="menuURL"/>
                </div>

                <div class="fieldcontain  ">
                    <label for="isSideMenu">
                        Is Side Menu

                    </label>
                    <input type="hidden" name="_isSideMenu"/><input type="checkbox" name="isSideMenu" checked="checked"
                                                                    id="isSideMenu"/>
                </div>

                <div class="fieldcontain  ">
                    <label for="isTopMenu">
                        Is Top Menu

                    </label>
                    <input type="hidden" name="_isTopMenu"/><input type="checkbox" name="isTopMenu" checked="checked"
                                                                   id="isTopMenu"/>
                </div>



            %{--</fieldset>--}%
            %{--<fieldset class="buttons">--}%
            %{--<input type="submit" name="create" class="save" value="Submit" id="create" />--}%
            %{--</fieldset>--}%
            </g:form>
        </td>
        <td></td>
    </tr>

</table>




<g:link controller="user" action="logout">Logout</g:link><br>
</body>
</html>