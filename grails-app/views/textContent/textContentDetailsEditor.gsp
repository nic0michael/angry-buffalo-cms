<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    List<Page>pages=Page.findAll([sort: "pageId", order: "asc"]) ;
    List<Language> languages=Language.findAll()
    //   String textContentText= textContent?.textContentText
%>
<%@ page import="za.co.nico.cms.*; za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Text Content Details Editor</title>
    <ckeditor:resources/>
</head>
<body>
<h1>Angry Buffalo CMS | Text Content Details Editor</h1>
<h3>Operation :${operation }</h3>

<g:form controller="textContent" action="textContentSave" method="post">
    <input type="hidden" name="id" value="${textContent?.id}" id="id" />
    <input type="hidden" name="version" value="2" id="version" />
    <table>
        <tr>
            <td></td>
            <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td>

                <h1>Text Content Details Editor</h1>


                <g:actionSubmitImage value="Edit" action="saveTextContentDetails"
                                     src="${resource(dir: 'images', file: 'SaveButton55.jpg')}"  /> &nbsp;&nbsp;

                <a href="../user/administration"><img src="${resource(dir: 'images', file: 'CancelButton55.jpg')}"/></a>


                <input type="hidden" value="${operation }"  name="operation" id="operation"/>
                <fieldset class="form">

                    <div class="fieldcontain  required">
                        <label for="pageId">
                            Select Article for this Page
                            <span class="required-indicator">*</span>
                        </label>
                        <select id="pageId" name="pageId" required="" class="many-to-one" >
                            <option value="${textContent?.page?.pageId}" selected="selected" >${textContent?.toString()}</option>
                            <%

                                for(Page page:pages){
                            %>
                            <option value="${page?.pageId}" >${page?.toString()}</option>
                            <%                       }

                            %>                        </select>
                    </div>
                    <div class="fieldcontain  required">
                        <label for="textContentId">Page short name<br>(Text Content Id)
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="textContentId" maxlength="15" required="" value="${textContent?.textContentId}" id="textContentId" />
                    </div>

                    <div class="fieldcontain  required">
                        <label for="textContentType">
                            Text Content Type
                            <span class="required-indicator">*</span>
                        </label>
                        <select name="textContentType" required="" id="textContentType" >
                            <option value="${textContent?.textContentType}" selected="selected" >${textContent?.textContentType}</option>
                            <option value="HTML" >HTML</option>
                            <option value="XML" >XML</option>
                            <option value="Text" >Text</option>
                        </select>
                    </div>


                    <div class="fieldcontain  required">

                        <label for="addTofrontPage">
                            Language :
                        </label>

                        <select name="language" id="language">
                            <option value="${textContent?.language?.languageName}" selected>${menu?.language?.languageName}</option>
                            <%
                                for(Language language:languages){
                            %>
                            <option value="${language?.languageName}">${language?.languageName}</option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="fieldcontain  ">
                        <label for="addTofrontPage">
                            Add To Front Page

                        </label>
                        <input type="hidden" name="_addTofrontPage" /><input type="checkbox" name="addTofrontPage" id="addTofrontPage" checked="checked" />
                    </div>

                    <div class="fieldcontain  ">
                        <label for="isLocked">
                            Is Locked

                        </label>
                        <input type="hidden" name="_isLocked" /><input type="checkbox" name="isLocked" id="isLocked"  />
                    </div>

                    <div class="fieldcontain  required">
                        <label for="homePageOrder">
                            Home Page Order
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="number" name="homePageOrder" value="${textContent?.homePageOrder}" required="" id="homePageOrder" />
                    </div>


                    <div class="fieldcontain  required">
                        <label for="pageOrder">
                            Page Order
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="number" name="pageOrder" value="${textContent?.pageOrder}" required="" id="pageOrder" />
                    </div>

                </fieldset>

                <div class="fieldcontain  required">

                    <ckeditor:config
                            height="550px"
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
            </td>
            <td></td>
        </tr>

    </table>

</g:form>
<g:link controller="user" action="logout">Logout</g:link><br>
</body>
</html>