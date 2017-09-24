<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/16
  Time: 8:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    List<Banner> banners=Banner.findAll([sort: "bannerId", order: "asc"]) ;
%>
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<%@ page import="za.co.nico.cms.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
  <title>Banner Manager</title>
</head>
<body>

<h1>&nbsp;&nbsp;&nbsp;Angry Buffalo CMS | Banner Manager</h1>


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
        <button type="button" class="btn btn-primary">Banner Manager</button>
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
<br><br>

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>
            <g:form controller="banner" action="bannerEditor" method="post">

                <g:actionSubmitImage value="Add" action="addBanner"
                                     src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Edit" action="editBanner"
                                     src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
                <g:actionSubmitImage value="Delete" action="deleteBanner"
                                     src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" />
                <ul >

                    <ul id="li_1" >
                        <br><label class="description" for="element_1">Choose content to add/remove to Frontpage </label>
                        <span>
                            <br>
                            <%

                                for(Banner banner: banners) {
                            %>
                            <!-- ${banner?.bannerId} ||  -->
                            <input type="radio" id="" name="bannerId" class="element radio"  value="${banner?.bannerId}" />
                            <label class="choice" for="bannerId">${banner?.toString()}</label><br>
                            <%
                                }
                            %>

                        </span>
                    %{--</ul>--}%
                    %{--<ul id="li_2" >--}%
                        %{--<br><label class="description" for="element_2">Action to perform with above </label>--}%
                        %{--<div>--}%
                            %{--<select class="element select medium" id="operation" name="operation">--}%
                                %{--<option value="" selected="selected">Selection please</option>--}%
                                %{--<option value="ADD" >Add new Banner</option>--}%
                                %{--<option value="EDIT" >Edit Banner</option>--}%
                                %{--<option value="REMOVE" >Disable Banner</option>--}%
                            %{--</select>--}%
                        %{--</div>--}%
                    %{--</ul>--}%
                    %{--<br>--}%
                    %{--<ul class="buttons">--}%

                        %{--<input type="hidden" name="form_id" value="860138" />--}%

                        %{--<input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />--}%
                    %{--</ul>--}%
                </ul>
            </g:form>
        </td>
        <td>&nbsp;&nbsp;</td>
    </tr>
</table>

</body>
</html>