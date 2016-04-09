<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    List<Language> languages=Language.findAll()
    List<Page> pages = Page.findAll([sort: "pageId", order: "asc"]);
    String menuIdValue = menu?.menuId
    if (menuIdValue == null || menuIdValue.isEmpty()) {
        menuIdValue = "";
    }
%>
<!-- MenuId->${menuIdValue}<-  -->
<%@ page import="za.co.nico.cms.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Menu Editor</title>

</head>

<body>
<h1>Angry Buffalo CMS | Menu Editor</h1>
<table>
    <tr>
        <td></td>
        <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td>

            <h1>Menu Editor</h1>

            <h3>Operation :${operation}</h3>

            <g:form controller="menu" action="menuSave" method="post">

                <g:actionSubmitImage value="Edit" action="saveMenuDetails"
                                     src="${resource(dir: 'images', file: 'SaveButton55.jpg')}"/> &nbsp;&nbsp;
                <g:actionSubmitImage value="Cancel" action="cancelMenuDetails"
                                     src="${resource(dir: 'images', file: 'CancelButton55.jpg')}"/>  &nbsp;&nbsp;

                <input type="hidden" value="${operation}" name="operation" id="operation"/>
                <fieldset class="form">


                    <div class="fieldcontain  required">
                        <label for="pageId">
                            Text Content(Page) :
                            <span class="required-indicator">*</span>
                        </label>
                        <select id="pageId" name="pageId" required="" class="many-to-one" >
                            <option value="${menu?.page?.pageId}" selected="selected" >${menu?.page?.toString()}</option>
                <%
                    for (Page page : pages) {
                %>

                <option value="${page?.pageId}">${page?.toString()}</option>
                <%
                    }
                %>
                </select>
                </div>

                <div class="fieldcontain  required">
                    <label for="language">
                        language :
                        <span class="required-indicator">*</span>
                    </label>

                    <select name="language" id="language">
                        <option value="${menu?.language?.languageName}" selected>${menu?.language?.languageName}</option>
                        <%
                            for(Language language:languages){
                        %>
                        <option value="${language?.languageName}">${language?.languageName}</option>
                        <%
                            }
                        %>
                    </select>


                </div>


                <div class="fieldcontain  required">
                    <label for="menuId">
                        Short Name (Menu Id) :
                        <span class="required-indicator">*</span>
                    </label>
                    <input type="text" name="menuId" maxlength="15" required="true" value="${menuIdValue}" id="menuId"/>
                </div>


                <div class="fieldcontain  ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please note you cant have an item on the top menu if its not on the side menu<br>
                    <label for="isTopMenu">Is in &nbsp;Top Menu</label>
                    <g:checkBox name="isTopMenu" id="isTopMenu" value="${menu?.isTopMenu}" default="Applied"/>
                </div>

                <div class="fieldcontain  ">
                    <label for="isSideMenu">Is in Side Menu</label>
                    <g:checkBox name="isSideMenu" id="isSideMenu" value="${menu?.isSideMenu}" default="Applied"/>

                </div>

                <div class="fieldcontain  ">
                    <label for="label">Label</label>
                    <input type="text" name="label" value="${menu?.label}" id="label"/>
                </div>



            %{--</fieldset>--}%
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