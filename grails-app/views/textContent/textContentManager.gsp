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
    List<TextContent> texts= TextContent.findAllByIsLocked(false,[sort: "textContentId", order: "asc"]) ;
%>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Text Content Manager</title>
</head>
<body>

<h1>Angry Buffalo CMS | Text Content Manager v2</h1>

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>

            <g:form controller="textContent" action="saveTextContentDetails" method="post">

                <g:actionSubmitImage value="Add" action="add"
                                     src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Edit" action="editText"
                                     src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
                <g:actionSubmitImage value="Delete" action="delete"
                                     src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Cache" action="cacheContent"
                                     src="${resource(dir: 'images', file: 'ButtonCache55.jpg')}" />  &nbsp;&nbsp;
                <a href="../user/administration"><img src="${resource(dir: 'images', file: 'CancelButton55.jpg')}"/></a>
                <ul >

                    <ul id="li_2" >
                        <div>   <br>
                            <h2>Angry Buffalo CMS has the following Text Content (Pages) :</h2><br>
                            <%
                                for(TextContent text : texts) {

                            %>
                            <!-- ${text.textContentId} ||  -->
                            <input type="radio" id="" name="textContentId" class="element radio"  value="${text.textContentId}" />
                            <label class="choice" for="textContentId">${text.toString()}</label><br>
                            <%
                                }
                            %>
                            <label class="description" for="textContent"><br>Select Content Page and press Edit/Delete or just press Add </label>
                        </div>
                    </ul>
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
