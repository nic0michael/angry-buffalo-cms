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

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="user" action="Administration">Administration</g:link></td>
        <td>&nbsp;&nbsp;</td>
    </tr>
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
