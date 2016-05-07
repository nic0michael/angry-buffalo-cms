
<%@ page import="za.co.nico.cms.BasicTagLib" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Advanced Administration Panel</title>
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
    <h1>Advanced Administration</h1>

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
                        <strong><g:link controller="menuHierarchy" action="insert" >MenuHierarchy Table Insert</g:link></strong>
                    </td>
                </tr>
            </table>

            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="menuHierarchy"  >MenuHierarchy Tablet</g:link></strong>
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



            <table  WIDTH=70 HEIGHT=20 class="buttonHeading" onMouseOver="this.className='buttonMouseOverHeading'" onMouseOut="this.className='buttonHeading'" border="0">
                <tr>
                    <td align="center">
                        <strong><g:link controller="userGroups" >UserGroups Table</g:link></strong>
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <g:link controller="user" action="Administration"><b>Administration</b></g:link><br>
        </div>
    </tag:isAdmin>
    <g:link controller="user" action="logon"><strong>Logon</strong></g:link><br>
    <g:link controller="user" action="logout"><strong>Logout</strong></g:link>


</div>
<div id="page-body" role="main">
    <h1>Angry Buffalo CMS | Advanced Administration Panel</h1> <br>
    <g:link controller="user" action="Administration"><strong>Return to the Administration Panel</strong></g:link><br><br>
    <p>Please note this Administration Panel is only for Database Administration<br>If you are not a Database Administrator <g:link controller="user" action="Administration">click here to return</g:link><br><br></p>
    However if you are a Database Administrator the click the menu button with the name of the table you wish to administrate<br><br>
    <tag:isAdmin userId="${session.userId}">
        <h2>Available Controllers:</h2>

        <p>Please note the following links are only for the System Administrator<br></p>
        <ul>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
            </g:each>
        </ul>
    </tag:isAdmin>
    <br>
    <a href="../documentation/BeginnersDocumantation.pdf" target="_blank">BeginnersDocumantation.pdf</a><br>
    <tag:isAdmin userId="${session.userId}">
        <a href="../documentation/EditorsManual.pdf" target="_blank">EditorsManual.pdf</a><br>
        <a href="../documentation/AdministratratorsManual.pdf" target="_blank">AdministratratorsManual.pdf</a><br>
    </tag:isAdmin>
    <g:link controller="user" action="logon"><strong>Logon</strong></g:link><br>
    <g:link controller="user" action="logout"><strong>Logout</strong></g:link>
</div>

<tag:isNotAuthenticated  userId="${session.userId}">
    <tag:redirectLogonPage/>
</tag:isNotAuthenticated>

</body>
</html>


