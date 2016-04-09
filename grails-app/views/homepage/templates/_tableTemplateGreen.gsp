<%@ page import="za.co.nico.cms.Banner; za.co.nico.cms.Menu; za.co.nico.cms.Setup; za.co.nico.cms.HomepageController" %>
<%
    HomepageController homepage=new HomepageController()
    String pageId=params.page_id;       // http://localhost:8080/NicosCMS/homepage/index?page_id=page1
    List<Menu> menus=Menu.findAllByIsSideMenu(true)
    String bottomBanner =" "
    String topBanner =" "

    if(pageId==null){
        pageId=" "
    }
    bottomBanner =homepage.getBottomBannerUrl( pageId)
    topBanner =homepage.getTopBannerUrl( pageId)



%>

<style type="text/css">
.topBannerImg {
    background-image: url('${request.contextPath}${topBanner}');
    height:220px
}

.bottomBannerImg {
    background-image: url('${request.contextPath}${bottomBanner}');
    height:90px
}
</style>


<!-- bottomBanner= ${bottomBanner} -->
<!-- topBanner= ${topBanner} -->

%{--<%= pageId %>--}%



<table style="width:1024px;" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2" style="background-color:#FFA500;" >
            <table style="width:1024px;"  cellpadding="0" cellspacing="0" background="${request.contextPath}${topBanner}">
                <tr>
                    <td align="center">
                        <h1 style="margin:0;padding:0;">${homepage?.siteTitle()}</h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br><br><br><br><br><br><br>
                    </td>
                </tr>
                <tr>
                    <td valign="bottom" align="left">
                        [<a href="index" class="topMenuClass">Home Page</a>]

                        <g:each in="${menus}" var="menu" >
                            &nbsp;[<a href="index?page_id=${menu?.urlPageIdParameter}" class="topMenuClass">${menu?.label }</a>]
                        </g:each>
                    </td>
                </tr>
            </table>

        </td>
    </tr>

    <tr>
        <td style="background-color:#80aa6f; width:100px;vertical-align:top;">
            <br><b>&nbsp;Menu</b><br>
            <table>
                <tr>
                    <td valign="bottom">
                        [<a href="index" class="topMenuClass">Home Page</a>]
                    </td>
                </tr>
                <g:each in="${menus}" var="menu" >
                    <tr>
                        <td>[<a href="index?page_id=${menu?.urlPageIdParameter}" class="topMenuClass">${menu?.label }</a>]</td>
                    </tr>
                </g:each>
            </table>
        </td>
        <td style="background-color:#eeeeee;height:550px;width:400px;vertical-align:top;">
            ${homepage?.pageContent(pageId)}
        </td>
    </tr>

    <tr>
        <td colspan="2" >
            <table style="width:1024px;" style="height:90px"  cellpadding="0" cellspacing="0" background="${request.contextPath}${bottomBanner}">
                <tr>
                    <td align="center" style="height:90px;width:1024px;vertical-align:middle;">
                        ${homepage?.siteCopyright()}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
