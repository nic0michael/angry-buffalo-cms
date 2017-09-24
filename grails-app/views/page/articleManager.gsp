<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    List<Page> articles=Page.findAll([sort: "pageId", order: "asc"]) ;

%>
<%@ page import="za.co.nico.cms.*; za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<html>
<head>
    <meta name="layout" content="main"/>
  <title>Article(Page) Manager</title>

</head>
<body>
<h1>Angry Buffalo CMS | Article(Page) Manager</h1>

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
        <button type="button" class="btn btn-primary">Article Manager</button>
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
<br>
<table>
    <tr>
        <td></td>
        <td>
            <g:form controller="page" action="articleDetailsEditor"  method="post">

                <g:actionSubmitImage value="Add" action="add"
                                     src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Edit" action="editText"
                                     src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
                <g:actionSubmitImage value="Delete" action="delete"
                                     src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" />
                <fieldset class="form">
                    <h2>NicosCMS has the following Articles :</h2>

                    <%
                        for(Page article : articles) {
                    %>
                    <!-- ${article.pageId} ||  -->
                    <input type="radio" id="pageId" name="pageId" class="element radio"  value="${article.pageId}" />
                    <label class="choice" for="pageId">${article.toString()}</label><br>
                    <%
                        }
                    %>
                    <label class="description" for="pageId"><br>Select Article and press Edit/Delete or just press Add </label>
                    %{--<ul id="li_2b" >--}%
                        %{--<label class="description" for="operation"><br>Select Operation to perform</label>--}%
                        %{--<div>--}%
                            %{--<select class="element select medium" id="operation" name="operation">--}%
                                %{--<option value="" selected="selected">Selection please</option>--}%
                                %{--<option value="EDIT" >Edit this Article(Page)</option>--}%
                                %{--<option value="ADD" >Add a New Article(Page)</option>--}%
                            %{--</select>--}%
                        %{--</div>--}%
                    %{--</ul>--}%

                </fieldset>
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