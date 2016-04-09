<%--
  Created by IntelliJ IDEA.
  User: NMichael
  Date: 2014/06/28
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>${hc.homePageTitle()}</title>
</head>
<body>
<%
    String ipAddress=request.getRemoteAddr()
    String ip=request.getHeader("Client-IP")
    if(ipAddress==null||ipAddress.isEmpty()){
        ipAddress=ip
    }
    session.setAttribute("ipAddress",ipAddress);

    if(templateGspFile==null || templateGspFile.length()<3 ) {
%>
<g:render template="templates/tableTemplate" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplate.gsp"          )) {
%>
<g:render template="templates/tableTemplate" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_divTemplate2.gsp"           )) {
%>
<g:render template="templates/divTemplate2" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_htmlTableTemplateGreen.gsp" )) {
%>
<g:render template="templates/htmlTableTemplateGreen" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateBlue.gsp"      )) {
%>
<g:render template="templates/tableTemplateBlue" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateGold.gsp"      )) {
%>
<g:render template="templates/tableTemplateGold" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateGreen.gsp"     )) {
%>
<g:render template="templates/tableTemplateGreen" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateLightBlue.gsp" )) {
%>
<g:render template="templates/tableTemplateLightBlue" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateLightGreen.gsp")) {
%>
<g:render template="templates/tableTemplateLightGreen" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateLightRed.gsp"  )) {
%>
<g:render template="templates/tableTemplateLightRed" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateOrange.gsp"    )) {
%>
<g:render template="templates/tableTemplateOrange" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_tableTemplateRed.gsp"       )) {
%>
<g:render template="templates/tableTemplateRed" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_userTemplate1.gsp"          )) {
%>
<g:render template="templates/userTemplate1" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_userTemplate2.gsp"          )) {
%>
<g:render template="templates/userTemplate2" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_userTemplate3.gsp"          )) {
%>
<g:render template="templates/userTemplate3" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_userTemplate4.gsp"          )) {
%>
<g:render template="templates/userTemplate4" var="hc"  ></g:render>

<%
    } else if(templateGspFile!=null && templateGspFile.equals("_userTemplate5.gsp"          )) {
%>
<g:render template="templates/userTemplate5" var="hc"  ></g:render>

} else if(templateGspFile!=null && templateGspFile.equals("_userTemplate6.gsp"          )) {
%>
<g:render template="templates/userTemplate6" var="hc"  ></g:render>
<%
    }
%>

%{--${hc.contentForPageOnMenu(thePageId)}--}%
</body>
</html>