<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="za.co.nico.cms.*; za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Article (Page) Details Editor</title>

</head>
<body>
<h1>Angry Buffalo CMS | Article (Page) Details Editor</h1>
<table>
    <tr>
        <td></td>
        <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td>

            <h1>Article (Page) Details Editor</h1>
            <h3>Operation :${operation }</h3>
            <g:form controller="page" action="articleSave" method="post">
                <input type="hidden" value="${operation }"  name="operation" id="operation"/>
                <fieldset class="form">

                    <div class="fieldcontain  required">
                        <label for="pageId">
                            Short Name (Page Id)
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="pageId" maxlength="15" required="" value="${page?.pageId}" id="pageId" />
                    </div>

                    <div class="fieldcontain  ">
                        <label for="pageUrl">
                            Page Url

                        </label>
                        <input type="text" name="pageUrl" value="${page?.pageUrl}" id="pageUrl" />
                    </div>

                    <div class="fieldcontain  required">
                        <label for="permissionId">
                            Access
                            <span class="required-indicator">*</span>
                        </label>
                        <select id="permissionId" name="permissionId" required="" class="many-to-one" >
                            <option value="${page?.access?.permissionId}" selected="selected" >${page?.access?.toString()}</option>
<%
                List<Permissions> permissions =Permissions.findAll()
                for(Permissions permission:permissions){
%>
                            <option value="${permission.permissionId}" >${permission.toString()}</option>
<%
                }
%>
                        </select>
                    </div>

                    <div class="fieldcontain  required">
                        <label for="userId">
                            Author
                            <span class="required-indicator">*</span>
                        </label>
                        <select id="userId" name="userId" required="" class="many-to-one" >
                            <option value="${page?.author?.userId}" selected="selected" >${page?.author?.toString()}</option>
<%
               List<User>authors =User.findAll()
               for(User author:authors){
%>
                            <option value="${author?.userId}" >${author?.toString()}</option>
<%
               }
%>
                        </select>
                    </div>

                    <div class="fieldcontain  required">
                        <label for="templateId">
                            Template
                            <span class="required-indicator">*</span>
                        </label>
                        <select id="templateId" name="templateId" required="" class="many-to-one" >
                            <option value="${page?.template?.templateId}" selected="selected" >${page?.template?.toString()}</option>
<%
                List<Template>templates =Template.findAll()
                for(Template template:templates){
%>
                            <option value="${template.templateId}" >${template?.toString()}</option>
<%
                }
%>
                        </select>
                    </div>

                    <div class="fieldcontain  required">
                        <label for="categoryId">
                            Category
                            <span class="required-indicator">*</span>
                        </label>
                        <select id="categoryId" name="categoryId" required="" class="many-to-one" >
                            <option value="${page?.category?.categoryId}" selected="selected" >${page?.category?.toString()}</option>
<%
                                List<Categories>categories =Categories.findAll()
                                for(Categories category:categories){
%>
                            <option value="${category?.categoryId}" >${category?.toString()}</option>
<%
                                }
%>
                        </select>
                    </div>

                    <div class="fieldcontain  ">
                        <label for="published">
                            Published

                        </label>
                        <input type="hidden" name="_published" /><input type="checkbox" name="published" checked="checked" id="published"  />
                    </div>

                    <div class="fieldcontain  ">
                        <label for="title">
                            Title

                        </label>
                        <input type="text" name="title" value="${page?.title}" id="title" />
                    </div>

                </fieldset>
                <fieldset class="buttons">
                    <input type="submit" name="create" class="save" value="Submit" id="create" />
                </fieldset>
            </g:form>
        </td>
        <td></td>
    </tr>

</table>




<g:link controller="user" action="logout">Logout</g:link><br>
</body>
</html>