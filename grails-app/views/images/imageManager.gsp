<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="za.co.nico.cms.*"%>
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List<Images> images= Images.findAll([sort: "imageId", order: "asc"]) ;
%>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Image Manager</title>
</head>
<body>

<h1>Angry Buffalo CMS | Image Manager v2</h1>

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
        <button type="button" class="btn btn-primary">Image Manager</button>
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
        <td>&nbsp;&nbsp;</td>
        <td>

            <g:form controller="images" action="imageAddChange" method="post">

                <g:actionSubmitImage value="Add" action="addImage"
                                     src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Edit" action="editImage"
                                     src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
                <g:actionSubmitImage value="Delete" action="deleteImage"
                                     src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" />
                <ul >

                    <ul id="li_2" >
                        <label class="description" for="imageId"><br>Select a Image item to Edit/Add </label>
                        <div>

                            <%
                                for(Images image :images) {
                            %>
                            <!-- ${image.imageId} ||  -->
                            <input type="radio" id="imageId" name="imageId" class="element radio"  value="${image.imageId}" />
                            <label class="choice" for="imageId">${image.toString()}</label><br>
                            <%
                                }
                            %>

                        </div>
                    </ul>

                    %{--<ul id="li_2b" >--}%
                        %{--<label class="description" for="operation"><br>Select Operation to perform</label>--}%
                        %{--<div>--}%
                            %{--<select class="element select medium" id="operation" name="operation">--}%
                                %{--<option value="" selected="selected">Selection please</option>--}%
                                %{--<option value="EDIT" >Change this Image</option>--}%
                                %{--<option value="ADD" >Add a New Image</option>--}%
                            %{--</select>--}%
                        %{--</div>--}%
                    %{--</ul>--}%
                    %{--<br>--}%

                    %{--<li class="buttons">--}%
                        %{--<input type="hidden" name="form_id" value="860091" />--}%

                        %{--<input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />--}%
                    %{--</li>--}%
                </ul>
            </g:form>

        </td>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="user" action="logout">Logout</g:link><br>
        <td>&nbsp;&nbsp;</td>
    </tr>
</table>
</body>
</html>
