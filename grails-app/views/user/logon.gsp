<%--
  Created by IntelliJ IDEA.
  User: nickm
  Date: 2014/03/08
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="za.co.nico.cms.FailedIPAddresses; za.co.nico.cms.FailedIPAddressesController; za.co.nico.cms.BasicTagLib" %>
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<html>
<head>
    <title>Logon</title>
    <meta name="layout" content="main"/>
</head>
<body>
<%
    String ipAddress=request.getRemoteAddr()
    String ip=request.getHeader("Client-IP")
    int nrFailedAttempts
    int nrSecondsSinceLastLogon
    if(ipAddress==null||ipAddress.isEmpty()){
        ipAddress=ip
    }

    za.co.nico.cms.FailedIPAddresses failedIPAddresses=FailedIPAddresses.findByIpAddress(ipAddress)
     nrFailedAttempts=failedIPAddresses.getNrFailedAttempts()
     nrSecondsSinceLastLogon=failedIPAddresses.getNrSecondsSinceLastLogon()
    int difference =   (new Date().time - failedIPAddresses.getDate().time)/1000
    session.setAttribute("ipAddress",ipAddress);
%>
<!--ipAddress: ${session.ipAddress} -->
<!--nrFailedAttempts: ${nrFailedAttempts} -->
<!--nrSecondsSinceLastLogon: ${nrSecondsSinceLastLogon} -->
<h1>Angry Buffalo CMS | User Logon | ${session?.userId} </h1>
<g:form name="myForm" url="[action:'user',controller:'user']">
    <table>
        <tr>
            <td colspan="2">${session?.errorMessage}</td><td>
        </td>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td align="right">Name : </td><td>
            <!-- input name="loginname" type="text" value="$ {endUserInstance?.userName}" / -->
            <g:textField name="loginname" />
        </td>
        </tr>
        <tr>
            <td></td>
            <td align="right">Password : </td><td>
            <!-- input name="password" type="password" value="$ {endUserInstance?.password}" / -->
            <g:field type="password" name="password" />
        </td>
        </tr>

        <tr>
            <td></td>
            <td>
                %{--<recaptcha:ifEnabled>--}%
                    %{--<recaptcha:recaptcha theme="blackglass"/>--}%
                %{--</recaptcha:ifEnabled>--}%


            </td>
            <td></td>

        </tr>
        <tr>
            <td></td>
            <g:if test="${randonNr==0}">
                    <td><img src="${resource(dir: 'images/captcha', file: '65435775600.jpg')}" alt="0"/>
                        <input type="hidden" name="klidi" value="9961">
                    </td>
            </g:if>
            <g:elseif test="${randonNr==1}">
                    <td><img src="${resource(dir: 'images/captcha', file: '675231401.jpg')}" alt="1"/>
                        <input type="hidden" name="klidi" value="7921">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==2}">
                    <td><img src="${resource(dir: 'images/captcha', file: '2487431702.jpg')}" alt="2"/>
                        <input type="hidden" name="klidi" value="7957">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==3}">
                    <td><img src="${resource(dir: 'images/captcha', file: '3124763403.jpg')}" alt="3"/>
                        <input type="hidden" name="klidi" value="9749">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==4}">
                    <td><img src="${resource(dir: 'images/captcha', file: '3218765304.jpg')}" alt="4"/>
                        <input type="hidden" name="klidi" value="9304">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==5}">
                    <td><img src="${resource(dir: 'images/captcha', file: '75487248705.jpg')}" alt="5"/>
                        <input type="hidden" name="klidi" value="9985">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==6}">
                    <td><img src="${resource(dir: 'images/captcha', file: '763458762506.jpg')}" alt="6"/>
                        <input type="hidden" name="klidi" value="9858">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==7}">
                    <td><img src="${resource(dir: 'images/captcha', file: '5462135407.jpg')}" alt="7"/>
                        <input type="hidden" name="klidi" value="9906">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==8}">
                    <td><img src="${resource(dir: 'images/captcha', file: '723648708.jpg')}" alt="8"/>
                        <input type="hidden" name="klidi" value="9132">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr==9}">
                    <td><img src="${resource(dir: 'images/captcha', file: '7832478609.jpg')}" alt="9"/>
                        <input type="hidden" name="klidi" value="5923">
                    </td>
            </g:elseif>
            <g:elseif test="${randonNr>9}">
                    <td><img src="${resource(dir: 'images/captcha', file: '3762376510.jpg')}" alt="10"/>
                        <input type="hidden" name="klidi" value="6528">
                    </td>
            </g:elseif>

            <td>Enter the number on the image here:<br><g:textField name="captcha" /></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <tag:notLockedOut ipAddress="${ipAddress}">
                <g:submitButton name="login" class="save" value="Login" />
                </tag:notLockedOut>
            </td>

        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <br><br><br><br>
                <tag:isAuthenticated userId="${session.userId}">
                    <h2>You are already Authenticated </h2>
                    <g:link action="Administration">Back to Administration page</g:link>
                </tag:isAuthenticated>
            </td>

        </tr>
    </table><br>
    

</g:form>




<br><br><br><br><br><br><br><br><br><br><br>
| ${session.ipAddress}  &nbsp; | &nbsp; ${nrFailedAttempts} &nbsp; | &nbsp; ${difference} |
</body>
</html>