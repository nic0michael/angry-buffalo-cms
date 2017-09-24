<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/03
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%
//    List<TextContent> textContents=TextContent.findAll([sort: "textContentId", order: "asc"]) ;
//    List<Template>templates=Template.findAll([sort: "templateId", order: "asc"])
//    Setup setup =Setup.findBySetupId("MASTER_RECORD")
%>
<%@ page import="za.co.nico.cms.Setup; za.co.nico.cms.Template; za.co.nico.cms.TextContent" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
  <title></title>
</head>
<body>

<h1>Angry Buffalo CMS | Front Page Manager</h1>

<div>

    %{--White--}%
    <div class="btn-group">
        <button type="button" class="btn btn-default"><g:link controller="user" action="Administration">Administration Panel</g:link></button>
    </div>


    %{--White--}%
    <div class="btn-group">
        <button type="button" class="btn btn-default">Administrator's Functions</button>
        <button type="button" class="btn btn-default dropdown-toggle"
                data-toggle="dropdown">
            <span class="caret"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><g:link controller="user" action="Administration">1)&nbsp;Control Panel</g:link></li>
            <li><g:link controller="user" action="AdvancedAdministration">2)&nbsp;Advanced Administration</g:link></li>
            <li><g:link controller="user" action="controlPanel">3)&nbsp;Control Panel</g:link></li>
            <li><g:link controller="homepage" action="cacheContent">4)&nbsp;Cache the Content</g:link></li>
            <li><g:link controller="user" action="logout">5)&nbsp;Logout</g:link></li>
        </ul>
    </div>


    %{--Blue--}%
    <div class="btn-group">
        <button type="button" class="btn btn-primary">FrontPage Manager</button>
        <button type="button" class="btn btn-primary dropdown-toggle"
                data-toggle="dropdown">
            <span class="caret"></span>
            <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><g:link controller="homepage" action="index" target="_blank">1)View Content</g:link></li>
            <li><g:link controller="categories" action="categoryManager">2)&nbsp;Category Manager</g:link></li>
            <li><g:link controller="page" action="articleManager">3)&nbsp;Article Manager</g:link></li>
            <li><g:link controller="textContent" action="textContentManager">4)&nbsp;Text ContentManager</g:link></li>
            <li><g:link controller="menu" action="menuManager">5)&nbsp;Menu Manager</g:link></li>
            <li><g:link controller="menuHierarchy" action="menuSave">6)&nbsp;Menu Hierarchy Manager</g:link></li>
            <li><g:link controller="page" action="frontPageManager">7)&nbsp;FrontPage Manager</g:link></li>
            <li><g:link controller="images" action="imageManager">8)&nbsp;Image Manager</g:link></li>
            <li><g:link controller="banner" action="bannerManager">9)&nbsp;Banner Manager</g:link></li>
            <li><g:link controller="template" action="templateManager">10)&nbsp;Template Manager</g:link></li>
        </ul>
    </div>

</div>
<br>
  <table>
      <tr>
          <td></td>
          <td>
              <g:form controller="page" action="frontpageAddRemove" method="post">
                  <input type="hidden" name="operation" value="SET_TEMPLATE" />
                  <h2>Option 1 : Associate a template to the frontpage</h2>
                  <br>
                  <ul >

                      <ul id="li_0" >
                          <label for="templateId">
                              Template
                              <span class="required-indicator">*</span>
                          </label>
                          <span>
                              <select id="templateId" name="templateId" required="" class="many-to-one" >
                                  <option value="${setup?.siteTemplate?.templateId}" selected="selected" >${setup?.siteTemplate?.toString()}</option>
<%
                          for(Template template:templates){
%>
                                  <option value="${template.templateId}" >${template.toString()}</option>
<%
                          }
%>
                              </select>
                          </span>
                      </ul>

                  </ul>
                  <br>
                  <ul class="buttons">

                      %{--<input type="hidden" name="form_id" value="860138" />--}%

                      <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
                  </ul>
                  <br><br>
                  </ul>
                      <hr>
                   <br>
                  <h2>Option 2 : Add Delete Content on Frontpage</h2>


                  <g:actionSubmitImage value="Add" action="frontPageAdd"
                                       src="${resource(dir: 'images', file: 'ButtonAdd55.jpg')}"  /> &nbsp;&nbsp;
                  <g:actionSubmitImage value="Delete" action="frontPageDelete"
                                       src="${resource(dir: 'images', file: 'ButtonDelete55.jpg')}" />
                      <ul id="li_1" >
                          <br><label class="description" for="element_1">Choose content to add/remove on Frontpage </label>
                          <span>
                              <br>
<%
        for(TextContent textContent: textContents) {
%>                            <!-- ${textContent?.textContentId} ||  -->
                              <input type="radio" id="" name="textContentId" class="element radio"  value="${textContent?.textContentId}" />
                              <label class="choice" for="textContentId">${textContent?.toString()}<b> ${textContent?.addTofrontPage}</b></label><br>
<%
        }
%>

                          </span>
                      </ul>
                      <ul id="li_2" >
                      %{--<br><label class="description" for="element_2">Action to perform with above </label>--}%
                      %{--<div>--}%
                          %{--<select class="element select medium" id="operation" name="operation">--}%
                              %{--<option value="" selected="selected"></option>--}%
                              %{--<option value="1" >Selection</option>--}%
                              %{--<option value="ADD" >Add to Homepage</option>--}%
                              %{--<option value="REMOVE" >Remove from Homepage</option>--}%
                              %{--<option value="SET_TEMPLATE" >Set Template for Homepage</option>--}%
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
          <td></td>
      </tr>
      <tr>
          <td></td>
          <td><g:link controller="user" action="logout">Logout</g:link><br></td>
          <td></td>
      </tr>
  </table>


</body>
</html>