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

  <table>
      <tr>
          <td></td>
          <td><g:link controller="user" action="Administration"><b>Administration Home Page</b></g:link><br></td>
          <td></td>
      </tr>
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