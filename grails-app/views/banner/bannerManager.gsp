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

<br><br>

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="user" action="Administration">Administration</g:link></td>
        <td>&nbsp;&nbsp;</td>
    </tr>

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