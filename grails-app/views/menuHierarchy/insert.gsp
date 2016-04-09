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
<g:link controller="user" action="Administration">Administration</g:link> <br>
<h1>MenuHierarchy Table Insert</h1>
<g:form controller="menuHierarchy" action="menuSave" method="post">
    <fieldset class="form">
        <div class="fieldcontain  required">
            <label for="parentPageId">
                Parent Page Id
                <span class="required-indicator">*</span>
            </label>
            <select id="parentPageId" name="parentPageId" required="" class="many-to-one" >
                <option value="HOME_PAGE" >HOME PAGE</option>
                <g:each var="menu" in="${menus}">
                    <option value="${menu?.label}" >${menu?.toString()}</option>
                </g:each>
            </select>
        </div>

        <div class="fieldcontain  required">
            <label for="childId">
                Child
                <span class="required-indicator">*</span>
            </label>
            <select id="childId" name="childId" required="" class="many-to-one" >
                <g:each var="menu" in="${menus}">
                    <option value="${menu?.id}" >${menu?.toString()}</option>
                </g:each>
            </select>
        </div>


    </fieldset>
    <fieldset class="buttons">
        <input type="submit" name="create" class="save" value="Insert" id="create" />
    </fieldset>
</g:form>
<br>
<table border="1">
    <hr>
    <tr>
        <td align="right" width="20%"><strong>Parent</strong></td>
        <td align="left" width="80%"><strong>Child</strong></td>
    </tr>
    <g:each var="menuHierarchy" in="${menuHierarchies}">
        <tr>
            <td align="right" width="20%">${menuHierarchy?.parentPageId}</td>
            <td align="left" width="80%">${menuHierarchy?.child?.label}</td>
        </tr>
    </g:each>
</table>
</body>
</html>