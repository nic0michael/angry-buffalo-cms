<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/09/05
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>MenuHierarchy Table Insert</title>
</head>

<body>

<h1>Menu Hierarchy Manager</h1>

<div>

    %{--White--}%
    <div class="btn-group">
        <button type="button" class="btn btn-default"><g:link controller="user" action="Administration">Administration Panel</g:link></button>
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
            <li><g:link controller="user" action="Administration">1)&nbsp;Control Panel</g:link></li>
            <li><g:link controller="user" action="AdvancedAdministration">2)&nbsp;Advanced Administration</g:link></li>
            <li><g:link controller="user" action="controlPanel">3)&nbsp;Control Panel</g:link></li>
            <li><g:link controller="homepage" action="cacheContent">4)&nbsp;Cache the Content</g:link></li>
            <li><g:link controller="user" action="logout">5)&nbsp;Logout</g:link></li>
        </ul>
    </div>


    %{--Blue--}%
    <div class="btn-group">
        <button type="button" class="btn btn-primary">Menu Hierarchy Manager</button>
        <button type="button" class="btn btn-primary dropdown-toggle"
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
        </ul>
    </div>

</div>
<g:form controller="menuHierarchy" action="menuSave" method="post">
    <fieldset class="form">
        <div class="fieldcontain  required">
            <label for="parentMenuId">
                Parent Page Id
                <span class="required-indicator">*</span>
            </label>
            <select id="parentMenuId" name="parentMenuId" required="" class="many-to-one">
                <option value="HOME_PAGE">HOME PAGE</option>
                <g:each var="menu" in="${menus}">
                    <option value="${menu?.menuId}">${menu?.toString()}</option>
                </g:each>
            </select>
        </div>

        <div class="fieldcontain  required">
            <label for="childMenuId">
                Child
                <span class="required-indicator">*</span>
            </label>
            <select id="childMenuId" name="childMenuId" required="" class="many-to-one">
                <g:each var="menu" in="${menus}">
                    <option value="${menu?.menuId}">${menu?.toString()}</option>
                </g:each>
            </select>
        </div>

    </fieldset>
    <fieldset class="buttons">
        <input type="submit" name="create" class="save" value="Insert" id="create"/>
    </fieldset>
</g:form>
<br>
<table border="1">
    <hr>
    <tr>
        <td align="right" width="50%"><strong>Parent</strong></td>
        <td align="left" width="50%"><strong>Child</strong></td>
    </tr>
    <g:each var="menuHierarchy" in="${menuHierarchies}">
        <tr>
            <td align="right" width="20%">${menuHierarchy?.parent?.toString()}</td>
            <td align="left" width="80%">${menuHierarchy?.child?.toString()}</td>
        </tr>
    </g:each>
</table>
</body>
</html>