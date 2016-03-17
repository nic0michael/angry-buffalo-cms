<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/16
  Time: 8:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    List<Template> templates=Template.findAll([sort: "templateId", order: "asc"]) ;
%>
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<%@ page import="za.co.nico.cms.*"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Template Manager</title>
</head>
<body>

<h1>&nbsp;&nbsp;&nbsp;Angry Buffalo CMS | Template Manager</h1>

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

            <g:form controller="template" action="templateEditor" method="post">

                <g:actionSubmitImage value="Add" action="addTemplate"
                                     src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Edit" action="editTemplate"
                                     src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
                <g:actionSubmitImage value="Delete" action="deleteTemplate"
                                     src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" />
                <ul >

                    <ul id="li_1" >
                        <br><label class="description" for="templateId">Choose template to EDIT here</label>
                        <span>
                            <br>
                            <%

                                for(Template template: templates) {
                            %>
                            <!-- ${template?.templateId} ||  -->
                            <input type="radio" id="templateId" name="templateId" class="element radio"  value="${template?.templateId}" />
                            <label class="choice" for="templateId">${template?.toString()}</label><br>
                            <%
                                }
                            %>

                        </span>
                    </ul>
                    %{--<ul id="li_2" >--}%
                        %{--<br><label class="description" for="operation">Action to perform with above </label>--}%
                        %{--<div>--}%
                            %{--<select class="element select medium" id="operation" name="operation">--}%
                                %{--<option value="" selected="selected">Selection please</option>--}%
                                %{--<option value="ADD" >Add new Template</option>--}%
                                %{--<option value="EDIT" >Edit Template</option>--}%
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