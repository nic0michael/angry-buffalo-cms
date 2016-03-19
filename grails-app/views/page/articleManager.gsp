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
<table>
    <tr>
        <td></td>
        <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td>
            <g:form controller="page" action="articleDetailsEditor"  method="post">

                <g:actionSubmitImage value="Add" action="add"
                                     src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Edit" action="editText"
                                     src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
                <g:actionSubmitImage value="Delete" action="delete"
                                     src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" /> &nbsp;&nbsp;
                <a href="../user/administration"><img src="${resource(dir: 'images', file: 'CancelButton55.jpg')}"/></a>
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