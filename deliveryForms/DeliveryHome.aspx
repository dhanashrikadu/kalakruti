<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryForms/masterDeliveryBoy.Master" AutoEventWireup="true" CodeBehind="DeliveryHome.aspx.cs" Inherits="OnlineClothing.deliveryForms.DeliveryHome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>    
    <script>
        function getLocation() {           
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
                

            } else {
                document.getElementById("Label1").value = "Geolocation is not supported by this browser.";
            }
        }
        function showPosition(position) {

            document.getElementById('<%=txtlatitude.ClientID %>').value = position.coords.latitude

            document.getElementById('<%=txtlongitude.ClientID %>').value = position.coords.longitude;

            document.getElementById('<%=btnsave.ClientID %>').click();

        }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="app-content content container-fluid">
  <div class="content-wrapper">
   <div class="content-header row">
   </div>
   <div class="content-body"><!-- stats -->
     <div class="row">
<asp:Panel ID="panellatlang" runat="server" >
    <div >
        <asp:TextBox ID="txtlatitude"  runat="server" ></asp:TextBox>
        <asp:TextBox ID="txtlongitude"  runat="server"></asp:TextBox>
        <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_click" />
    </div></asp:Panel>
    <div class="container-fluid no-gutter" style="background-color: #47476b">
        <div class="row row-centered no-gutter" style="padding-top: 20px">
            <div class="dashboard-panel">
                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 col-centered" ng-show="showWiki">
                    <div class="panel panel-default shadowHover">
                        <a href="/deliveryForms/confirmOrder.aspx"class="panelLink">
                        <%--<asp:LinkButton ID="btnsave" runat="server" class="panelLink" onclick="SaveLOngitude_click" ></asp:LinkButton>--%>
                            <div class="hubPanel panel-body">
                                <div class="panelLogo" style="color: #2969B0;">
                                    <i class="fa fa-search fa-4x"></i>
                                </div>
                                <div class="panelTitleBar">
                                    <div class="panelTitle">

                                        Searching for Orders
                                    </div>
                                </div>
                                <div class="panelContent">
                                    <%--Learn new tips, tricks, and access helpful documents--%>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="panel panel-default shadowHover">
                        <a href="/Wiki" class="panelLink">
                            <div class="hubPanel panel-body">
                                <div class="panelLogo" style="color: #2969B0;">
                                    <i class="fa fa-cart-plus fa-4x"></i>
                                </div>
                                <div class="panelTitleBar">
                                    <div class="panelTitle">
                                        Today's Orders
                                    </div>
                                </div>
                                <div class="panelContent">
                                    <%--Learn new tips, tricks, and access helpful documents--%>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="panel panel-default shadowHover">
                        <a href="/Community" class="panelLink">
                            <div class="hubPanel panel-body">
                                <div class="panelLogo" style="color: mediumpurple;">
                                    <i class="fa fa-money fa-4x"></i>
                                </div>
                                <div class="panelTitleBar">
                                    <div class="panelTitle">
                                        Floating Cash
                                    </div>
                                </div>
                                <div class="panelContent">
                                    <%--Browse information from other users in a forum style.--%>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 col-centered" ng-show="showKB">
                <a href="/knowledgeBase" class="panelLink">
                    <div class="panel panel-default shadowHover">
                        <div class="hubPanel panel-body">
                            <div class="panelLogo" style="color: #D14841;">
                                <i class=" 	fa fa-rupee fa-4x"></i>
                            </div>
                            <div class="panelTitleBar">
                                <div class="panelTitle">
                                    Today's earnings
                                </div>
                            </div>
                            <div class="panelContent">
                                <%--Answers to common questions and helpful training tips--%>
                            </div>
                        </div>
                    </div>
                </a><a href="#" class="panelLink">
                    <div class="panel panel-default shadowHover">
                        <div class="hubPanel panel-body">
                            <div class="panelLogo" style="color: #00A885;">
                                <i class=" 	fa fa-credit-card  fa-4x"></i>
                            </div>
                            <div class="panelTitleBar">
                                <div class="panelTitle">
                                    Week's Earning
                                </div>
                            </div>
                            <div class="panelContent">
                                <%--Send a ticket to our support team or review existing tickets--%>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    </div>
    </div>
</div>
</div>

</asp:Content>
