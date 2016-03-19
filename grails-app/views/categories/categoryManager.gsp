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
    List<Categories> categories= Categories.findAll([sort: "categoryId", order: "asc"]) ;
%>
<html>
<head>
    <meta name="layout" content="main"/>
  <title>Category Manager</title>
</head>
<body>

<h1>Angry Buffalo CMS | Category Manager</h1>

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>

    <g:form id="form_860091" controller="categories" action="categoryEditor" method="post">

        <g:actionSubmitImage value="Add" action="add"
                             src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
        <g:actionSubmitImage value="Edit" action="editText"
                             src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
        <g:actionSubmitImage value="Delete" action="delete"
                             src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" />&nbsp;&nbsp;
        <a href="../user/administration"><img src="${resource(dir: 'images', file: 'CancelButton55.jpg')}"/></a>

        <ul >

            <ul id="li_2" >

            <div> <br>
                <h2>The following Categories are defined :</h2>

<%
        for(Categories category : categories) {
%>
                <!-- ${category.categoryId} ||  -->
                <input type="radio" id="" name="categoryId" class="element radio"  value="${category.categoryId}" />
                <label class="choice" for="textContentId">${category.toString()}</label><br>
<%
        }
%>
                <label class="description" for="element_2"><br>Select Category and press Edit/Delete or just press Add </label>
            </div>
        </ul>

            %{--<ul id="li_2b" >--}%
                %{--<label class="description" for="element_2"><br>Select Operation to perform</label>--}%
                %{--<div>--}%
                    %{--<select class="element select medium" id="element_2b" name="element_2">--}%
                        %{--<option value="" selected="selected">Selection please</option>--}%
                        %{--<option value="EDIT" >Edit this Category</option>--}%
                        %{--<option value="ADD" >Add a New Category</option>--}%
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
