
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Advanced Admin Panel</title>
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
    <h1>Advanced Admin</h1>

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
                        <strong><g:link controller="banner" >Banners Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="categories" >Categories Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="fileContent" >FileContent Table</g:link></strong>
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
                        <strong><g:link controller="images" >Images Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="menu" >Menu Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="page" >Articles(Page) Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="permissions" >Permissions Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="setup" >Setup Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="template" >Template Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="textContent" >TextContent Table</g:link></strong>
                    </td>
                </tr>
            </table>


            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="user" >Users Table</g:link></strong>
                    </td>
                </tr>
            </table>

            <br>
            <br>
        </div>
    </tag:isAdmin>
    <g:link controller="user" action="logon"><strong>Logon</strong></g:link><br>
    <g:link controller="user" action="logout"><strong>Logout</strong></g:link>

</div>
<div id="page-body" role="main">
    <h1>NicoCMS | Control Panel</h1>

    <div>

        %{--White--}%
        <div class="btn-group">
            <button type="button" class="btn btn-default"><g:link controller="user" action="Administration">Administration Panel</g:link></button>
        </div>

        %{--Blue--}%
        <div class="btn-group">
            <button type="button" class="btn btn-primary">Control Panel</button>
            <button type="button" class="btn btn-primary dropdown-toggle"
                    data-toggle="dropdown">
                <span class="caret"></span>
                <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><g:link controller="user" action="Administration">1)&nbsp;Administration</g:link></li>
                <li><g:link controller="user" action="AdvancedAdministration">2)&nbsp;Advanced Administration</g:link></li>
                <li><g:link controller="user" action="controlPanel">3)&nbsp;Control Panel</g:link></li>
                <li><g:link controller="homepage" action="cacheContent">4)&nbsp;Cache the Content</g:link></li>
                <li><g:link controller="user" action="logout">5)&nbsp;Logout</g:link></li>
            </ul>
        </div>




        %{--White--}%
        <div class="btn-group">
            <button type="button" class="btn btn-default">Editor's Functions</button>
            <button type="button" class="btn btn-default dropdown-toggle"
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
    <tag:isAdmin userId="${session.userId}">
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
    <tag:redirectLogonPage/>
</tag:isNotAuthenticated>

</body>
</html>


