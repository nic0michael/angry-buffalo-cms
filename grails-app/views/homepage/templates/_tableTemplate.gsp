<%@ page import="za.co.nico.cms.Banner; za.co.nico.cms.Menu; za.co.nico.cms.Setup; za.co.nico.cms.HomepageController" %>
<%
    List<Menu> menus=Menu.findAllByIsSideMenu(true)

    String topBanner      =hc.get("topBanner"      )
    String bottomBanner   =hc.get("bottomBanner"   )
    String siteTitle      =hc.get("siteTitle"      )
    String pageContent    =hc.get("retrievePageContent"    )
    String siteCopyright  =hc.get("siteCopyright"  )
    int len=0
    if(pageContent!=null){
        len=pageContent.length()
    }
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


.buttonMouseOverHeading{
    border-left: thin solid LightBlue;
    border-bottom: thin solid Black;
    border-right : thin solid Gray;
    border-top : thin solid DarkGray;
    background-color:${hc?.get("menuHoverColour")};
}

.buttonMouseOverActiveHeading{
    border-left:  solid LightBlue;
    border-bottom:  solid Black;
    border-right :   solid Gray;
    border-top :   solid DarkGray;
    background-color:${hc?.get("menuSelectedColour")};
}


/*.buttonActiveHeading{*/
    /*border-left:  solid LightBlue;*/
    /*border-bottom:  solid Black;*/
    /*border-right :   solid Gray;*/
    /*border-top :   solid DarkGray;*/
    /*background-color: #132baa;*/
/*}*/

.buttonHeading{
    border-left: thick solid LightBlue;
    border-bottom:thin  solid Black;
    border-right :thin  solid Black;
    border-top : thick solid LightBlue;
    background-color:${hc?.get("menuBackgroundColour")};
}


.buttonWhiteHeading{
    border-left:  solid LightBlue;
    border-bottom:  solid Black;
    border-right :   solid Gray;
    border-top :   solid DarkGray;
    background-color:#FFFFFF;
}


</style>


<!-- bottomBanner= ${bottomBanner}  -->
<!-- topBanner= ${topBanner} ||  ${request.contextPath}${topBanner}  -->
<!-- params.page_id ${params.page_id} -->
<!-- retrievePageContent length ${len} -->
<!-- menuBackgroundColour : ${hc?.get("menuBackgroundColour")} -->
<%
    String siteId=hc?.get("siteId")
    String SITE_ID=hc?.get("SITE_ID")
    if(SITE_ID!=null){
        siteId=SITE_ID
    }
%>
<!-- siteId : ${hc?.get("siteId")} -->
<!-- SITE_ID : ${hc?.get("SITE_ID")} -->

<table style="width:1024px;" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2" style="background-color:#FFA500;" >
            <table style="width:1024px;"  cellpadding="0" cellspacing="0" background="${request.contextPath}${topBanner}">
                <tr>
                    <td align="left">
                        <table>
                            <tr>
                                <td align="center">
                                    <h1 style="margin:0;padding:0;">${siteTitle}</h1>
                                </td>
                            </tr>
                            <tr>
                                <td><br><br><br><br><br></td>
                            </tr>
                            <tr><!-- TOP MENU  siteId ${siteId} ::: ${hc?.get("siteId")} -->

                                <td>
                                    <tag:bootstrapTopMenu  siteUrl="${hc?.get("siteUrl")}" pageId="${hc?.get("pageId")}" siteId="${hc?.get("SITE_ID") }"></tag:bootstrapTopMenu>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

            </table>

        </td>
    </tr>
    <tr><!-- SIDE MENU -->
        <td style="background-color:${hc.get("menuColour")}; width:15%;vertical-align:top;">
            <br>
            <tag:bootstrapSideMenu pageId="${hc?.get("pageId")}"></tag:bootstrapSideMenu>
            <br><br>
        </td>
        <td style="background-color:#eeeeee;height:550px;width:85%;vertical-align:top;">
<!-- retrievePageContent inserted here -->
            ${pageContent}
        </td>
    </tr>

    <tr>
        <td colspan="2" >
            <table style="width:1024px;" style="height:90px"  cellpadding="0" cellspacing="0" background="${request.contextPath}${bottomBanner}">
                <tr>
                    <td align="center" style="height:90px;width:1024px;vertical-align:middle;">
                        ${siteCopyright}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
