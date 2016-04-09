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
    <title>Image Item Editor</title>
</head>
<body>

<h1>Angry Buffalo CMS | Image Item Editor</h1>
<h3>Operation :${operation }</h3>

<table>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td><g:link controller="user" action="Administration">Administration</g:link></td>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
        <td>

            <g:form  controller="images" action="imageSave" method="post">
                <input type="hidden" value="${operation }"  name="operation" id="operation"/>
                <div class="form_description">
                    <h2>Image Item Editor</h2>
                </div>


                <div class="fieldcontain  required">
                    <label for="imageId">
                        Image Id
                        <span class="required-indicator">*</span>
                    </label>
                    <input type="text" id="imageId" name="imageId" maxlength="15" required="" value="${image?.imageId}" />
                </div>

                <div class="fieldcontain  required">
                    <label for="imageFileName">
                        Image File Name
                        <span class="required-indicator">*</span>

                    </label>
                    <input type="text" name="imageFileName" size="50" value="${image?.imageFileName}" id="imageFileName" />
                </div>

                <div class="fieldcontain ">
                    <label for="imagePath">
                        Image Path

                    </label>
                    <input type="text" name="imagePath" size="50" value="${image?.imagePath}" id="imagePath" />
                </div>

                <div class="fieldcontain  required">
                    <label for="imageTitle">
                        Image Title
                        <span class="required-indicator">*</span>

                    </label>
                    <input type="text" name="imageTitle" size="30" value="${image?.imageTitle}" id="imageTitle" />
                </div>

                <div class="fieldcontain  ">
                    <label for="published">
                        Published

                    </label>
                    <input type="hidden" name="_published" /><input type="checkbox" name="published" checked="checked" id="published"  />
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