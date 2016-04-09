<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="za.co.nico.cms.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<%
    TextContent defaultText=TextContent.findByTextContentId('DEFAULT')
    String initialValue=defaultText.textContentText
//    String initialValue="Hello this page is under construction <br><br><br>(<b>Default content</b>) "

%>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Text Content Editor</title>
    <ckeditor:resources/>
</head>
<body>
<h1>Angry Buffalo CMS | Text Content Editor</h1>
<table>
    <tr>
        <td></td>
        <td><g:link controller="user" action="Administration">Administration</g:link><br></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td>

            <h1>Article (Page) Details Editor</h1>

            <g:form controller="textContent" action="textContentSave" method="post">

                <g:actionSubmitImage value="Save" action="saveText"
                                     src="${resource(dir: 'images', file: 'SaveButton55.jpg')}"  /> &nbsp;&nbsp;
                <g:actionSubmitImage value="Cancel" action="cancelText"
                                     src="${resource(dir: 'images', file: 'CancelButton55.jpg')}" />  &nbsp;&nbsp;
            %{--<fieldset class="buttons">--}%
            %{--<input type="submit" name="create" class="save" value="Submit" id="create" />--}%
            %{--</fieldset>--}%

                <input type="hidden" name="textContentId" value="${textContent?.textContentId}">
                <input type="hidden" name="textContentType" value="${textContent?.textContentType}">
                <input type="hidden" name="pageOrder" value="${textContent?.pageOrder}">
                <input type="hidden" name="homePageOrder" value="${textContent?.homePageOrder}">
                <input type="hidden" name="pageId" value="${textContent?.page?.pageId}">
                <input type="hidden" name="addTofrontPage" value="${textContent?.addTofrontPage}">

                <fieldset class="form">

                    <div class="fieldcontain  required">

                        <ckeditor:config
                                height="350px"
                                width="95%"
                                uiColor= '#14B8C4'
                        />

                        <ckeditor:config var="toolbar_Mytoolbar">
                            [
                                [ 'Source', '-', 'Bold', 'Italic','Underline',
                                  'Styles','Format','Font','FontSize', 'TextColor', 'BGColor','-','JustifyLeft','JustifyCenter','JustifyRight' ,'-', 'Cut','Copy','Paste','-', 'Link', 'Unlink' , 'Anchor' ,'-','Image','-','Find','Replace','SpellChecker','-','Outdent','Indent' ,'-', 'NumberedList', 'BulletedList','-','Table','HorizontalRule','PageBreak']
                            ]
                        </ckeditor:config>

                        <ckeditor:editor name="textContentText" toolbar="Mytoolbar">
                            ${textContentText}
                        </ckeditor:editor>
                    </div>


                </fieldset>

            %{--<fieldset class="buttons">--}%
            %{--<input type="submit" name="create" class="save" value="Submit" id="create2" />--}%
            %{--</fieldset>--}%
            </g:form>
        </td>
        <td></td>
    </tr>

</table>




<g:link controller="user" action="logout">Logout</g:link><br>
</body>
</html>