<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/28
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>${homePageTitle}</title>
</head>
<body>
<!-- templateGspFile : ${templateGspFile} -->
<%
    if(templateGspFile==null || templateGspFile.length()<3 ) {
%>
<g:render template="templates/tableTemplate" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplate"          )) {
%>
<g:render template="templates/tableTemplate" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("divTemplate2"           )) {
%>
<g:render template="templates/divTemplate2" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("htmlTableTemplateGreen" )) {
%>
<g:render template="templates/htmlTableTemplateGreen" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateBlue"      )) {
%>
<g:render template="templates/tableTemplateBlue" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateGold"      )) {
%>
<g:render template="templates/tableTemplateGold" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateGreen"     )) {
%>
<g:render template="templates/tableTemplateGreen" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateLightBlue" )) {
%>
<g:render template="templates/tableTemplateLightBlue" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateLightGreen")) {
%>
<g:render template="templates/tableTemplateLightGreen" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateLightRed"  )) {
%>
<g:render template="templates/tableTemplateLightRed" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateOrange"    )) {
%>
<g:render template="templates/tableTemplateOrange" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("tableTemplateRed"       )) {
%>
<g:render template="templates/tableTemplateRed" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("userTemplate1"          )) {
%>
<g:render template="templates/userTemplate1" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("userTemplate2"          )) {
%>
<g:render template="templates/userTemplate2" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("userTemplate3"          )) {
%>
<g:render template="templates/userTemplate3" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("userTemplate4"          )) {
%>
<g:render template="templates/userTemplate4" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("userTemplate5"          )) {
%>
<g:render template="templates/userTemplate5" var="hc"  ></g:render>

} else if(templateGspFile!=null && templateGspFile.equals("userTemplate6"          )) {
%>
<g:render template="templates/userTemplate6" var="hc"  ></g:render>
<%
    }
%>

%{--${hc.contentForPageOnMenu(thePageId)}--}%
</body>
</html>