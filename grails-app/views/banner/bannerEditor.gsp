<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/16
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>

<%
    List<Images> images =Images.findAll()
%>
<%@ page import=" za.co.nico.cms.Images; za.co.nico.cms.BasicTagLib" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Banner Editor</title>
</head>
<body>

<h1>&nbsp;&nbsp;&nbsp;NicoCMS | Banner Editor</h1>
<h3>Operation :${operation }</h3>

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

            <g:form controller="banner" action="bannerSave" method="post">
                <input type="hidden" value="${operation }"  name="operation" id="operation"/>
            %{--<input type="hidden" name="id" value="1" id="id" />--}%
            %{--<input type="hidden" name="version" value="0" id="version" />--}%
                <fieldset class="form">




                    <div class="fieldcontain  required">
                        <label for="bannerId">
                            Banner Id
                            <span class="required-indicator">*</span>
                        </label>
                        <input type="text" name="bannerId" maxlength="35" required="" value="${banner?.bannerId }" id="bannerId" />
                    </div>

                    <div class="fieldcontain  ">
                        <label for="bannerCssClass">
                            Banner Css Class

                        </label>
                        <input type="text" name="bannerCssClass" value="${banner?.bannerCssClass}" id="bannerCssClass" />
                    </div>

                    <div class="fieldcontain  ">
                        <label for="bannerTitle">
                            Banner Title

                        </label>
                        <input type="text" name="bannerTitle" value="${banner?.bannerTitle }" id="bannerTitle" />
                    </div>

                    <div class="fieldcontain  required">
                        <label for="imageId">
                            Image
                            <span class="required-indicator">*</span>
                        </label>
                        <select id="imageId" name="imageId" required="" class="many-to-one" >
                            <option value="${banner?.image?.imageId}" selected="selected" >${banner?.image?.toString() }</option>
                            <%
                                for(Images image:images){
                            %>
                            <option value="${image?.imageId}" >${image?.toString()}</option>
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
                        <label for="useSiteTitle">
                            Use Site Title

                        </label>
                        <input type="hidden" name="_useSiteTitle" /><input type="checkbox" name="useSiteTitle" checked="checked" id="useSiteTitle"  />
                    </div>


                </fieldset>
                <fieldset class="buttons">
                    <input type="submit" name="create" class="save" value="Submit" id="create" />
                </fieldset>
            </g:form>
        </td>
        <td>&nbsp;&nbsp;</td>
    </tr>
</table>
</body>
</html>