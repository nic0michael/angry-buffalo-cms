
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>
<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="status" role="complementary">
    <h1>Grails Scaffold</h1>

    <tag:isAdmin userId="${session.userId}">
        <div id="controller-list">
            %{--<div id="controller-list" role="navigation">--}%


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="user" action="Administration">Administration Panel</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="banner" >Banners</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="categories" >Categories</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="fileContent" >FileContent</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="homepage" >Homepage</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="images" >Images</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="menu" >Menu</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="page" >Page</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="permissions" >Permissions</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="setup" >Setup</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="textContent" >TextContent</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="user" >Users</g:link></strong>
                    </td>
                </tr>
            </table>
<a href="http://www.psd2cssonline.com/">psd2cssonline</a>
            <br>
            <br>
            <g:link controller="user" action="Administration"><b>Administration</b></g:link><br>
        </div>
    </tag:isAdmin>
    <g:link controller="user" action="logon"><strong>Logon</strong></g:link><br>
    <g:link controller="user" action="logout"><strong>Logout</strong></g:link>

%{--<ul>--}%
%{--<li>App version: <g:meta name="app.version"/></li>--}%
%{--<li>Grails version: <g:meta name="app.grails.version"/></li>--}%
%{--<li>Groovy version: ${GroovySystem.getVersion()}</li>--}%
%{--<li>JVM version: ${System.getProperty('java.version')}</li>--}%
%{--<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>--}%
%{--<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>--}%
%{--<li>Domains: ${grailsApplication.domainClasses.size()}</li>--}%
%{--<li>Services: ${grailsApplication.serviceClasses.size()}</li>--}%
%{--<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>--}%
%{--</ul>--}%
%{--<tag:isAdmin userId="${session.userId}">--}%
%{--<h1>Installed Plugins</h1>--}%
%{--<ul>--}%
%{--<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">--}%
%{--<li>${plugin.name} - ${plugin.version}</li>--}%
%{--</g:each>--}%
%{--</ul>--}%
%{--</tag:isAdmin>--}%
</div>
<div id="page-body" role="main">
    <h1>NicoCMS | Control Panel</h1>

    <tag:isAdmin userId="${session.userId}">
        <g:link controller="user" action="Administration"><strong>Administration</strong></g:link><br>
        <h2>Available Controllers:</h2>
        <br>
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
            </g:each>
        </ul>
    </tag:isAdmin>

    <g:link controller="user" action="logon"><strong>Logon</strong></g:link><br>
    <g:link controller="user" action="logout"><strong>Logout</strong></g:link>
</div>

<tag:isNotAuthenticated  userId="${session.userId}">
    <tag:redirectMainPage/>
</tag:isNotAuthenticated>

<tag:isAuthenticated  userId="${session.userId}">
    <tag:redirectAdminPage/>
</tag:isAuthenticated>

</body>
</html>


