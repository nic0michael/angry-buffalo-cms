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
    List<Menu> menuItems= Menu.findAll([sort: "menuId", order: "asc"]) ;
%>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Menu Manager</title>
</head>
<body>

<h1>Angry Buffalo CMS | Menu Manager v2</h1>

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>
            <g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link><br>
            <g:link controller="menuHierarchy" action="insert" >Insert in MenuHierarchy Table</g:link>
        </td>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>

            <g:form controller="menu" action="menuEditor" method="post">

                <g:actionSubmitImage value="Add" action="add"
                                     src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Edit" action="editText"
                                     src="${resource(dir: 'images', file: 'ButtonEdit55.jpg')}" />  &nbsp;&nbsp;
                <g:actionSubmitImage value="Delete" action="delete"
                                     src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" />
                <ul >

                    <ul id="li_2" >
                        <br>
                        <h2>NicosCMS has the following Menu entries :</h2>

                        <div>

                            <%
                                for(Menu menuItem :menuItems) {
                            %>
                            <!-- ${menuItem?.menuId} ||  -->
                            <input type="radio" id="menuId" name="menuId" class="element radio"  value="${menuItem?.menuId}" />
                            <label class="choice" for="menuId">${menuItem?.toString()}</label><br>
                            <%
                                }
                            %>

                            <label class="description" for="menuId"><br>Select Menu Entry and press Edit/Delete or just press Add</label>
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
