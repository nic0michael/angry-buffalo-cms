<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/16
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="za.co.nico.cms.*"%>
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
  <title>Category Editor</title>
</head>
<body>

<h1>Angry Buffalo CMS | Category Editor</h1>
<h3>Operation :${operation }</h3>
<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>

            <g:form id="form_860091" controller="categories" action="categorySave" method="post">
                <input type="hidden" value="${operation }"  name="operation" id="operation"/>
                %{--<div class="form_description">--}%
                    %{--<h2>Category Editor</h2>--}%
                %{--</div>--}%

                <div class="fieldcontain  required">
                    <label for="categoryId">
                        Short Name (Category Id)
                        <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="categoryId" maxlength="15" required="" value="${category?.categoryId}" id="categoryId" />
                </div>

                <div class="fieldcontain  ">
                    <label for="description">
                        Description

                    </label>
                    <input type="text" name="description" value="${category?.description}" id="description" />
                </div>

                <div class="fieldcontain  ">
                    <label for="published">
                        Published

                    </label>
                    <input type="hidden" name="_published" /><input type="checkbox" name="published" id="published"  />
                </div>

                <div class="fieldcontain  ">
                    <label for="title">
                        Title

                    </label>
                    <input type="text" name="title" value="${category?.title}" id="title" />
                </div>

                <br>
                <ul >


                    <li class="buttons">
                        <input type="hidden" name="form_id" value="860091" />

                        <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
                    </li>
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