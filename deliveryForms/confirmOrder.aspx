<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryForms/masterDeliveryBoy.Master" AutoEventWireup="true"
    CodeBehind="confirmOrder.aspx.cs" Inherits="OnlineClothing.deliveryForms.confirmOrder" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn1
        {
            color: #FFF !important;
            text-shadow: 0 1px 0 rgba(0,0,0,.25);
            background-image: none !important;
            border: 0px solid #FFF;
            border-top-color: rgb(255, 255, 255);
            border-right-color: rgb(255, 255, 255);
            border-bottom-color: rgb(255, 255, 255);
            border-left-color: rgb(255, 255, 255);
            border-radius: 0;
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="app-content content container-fluid">
  <div class="content-wrapper">
   <div class="content-header row">
   </div>
   <div class="content-body"><!-- stats -->
     <div class="row">
  <div class="container-fluid no-gutter">
        <div class="row row-centered no-gutter">
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
                <div class="panel panel-default shadowHover">
                    <asp:DataList ID="dlgrocer" runat="server" CssClass="row" CellPadding="2" CellSpacing="2"
                        Font-Bold="True" ForeColor="#fef9e7" HorizontalAlign="Center" RepeatColumns="1"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="row" style="height: 100%; width: 500px; padding-top: 1px; background-color: White">
                                <div class="col-sm-2" style="height: 100%; width: 500px; padding-top: 1px">
                                    <!--THUMBNAIL#2-->
                                    <div class="panel-body" style="height:150px; width: 500px; padding-top: 1px;">
                                        <div class="thumbnail label-success" style="height:100%; width: 350px; 
                                            background-color:  #2d5986">
                                                                                                
                                            <div class="hubPanel panel-body">
                                             <div class="panelLogo" style="color: White;">
                                                 <table><tr><td>
                                                    <i class="fa fa-cart-arrow-down fa-2x"></i>
                                                  </td><td style="padding-left:10px">
                                                    <asp:Label runat="server" ID="Label1" Font-Size="14px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                                Text='<%# Eval("ShopName")%>'></asp:Label>
                                              
                                                    </td>
                                                    <td style="padding-left:140px">
                                                    <a href="/Mapping2.aspx" class="panelLink">
                                                        <div class="hubPanel panel-body" style="background-color:White; height:35px; padding-top:5px; padding-left:5px; width:31px">
                                                            <div class="panelLogo" style="color: #2969B0;">
                                                               <i class="fa fa-share-square fa-2x"></i>
                                                            </div>
                                                        </div>
                                                    </a></td> </tr></table>
                                                </div>
                                              
                                          
                            
                                      
                                       
                                      
                                            <div class="caption" style="padding-left:32px">
                                                <h4>
                                                    <small>
                                                        <asp:Label runat="server" ID="Label3" Font-Size="14px" ForeColor="#d1d1e0" Style="font-family: Celias,Helvetica"
                                                            Text='<%# Eval("ShopAddr")%>'></asp:Label>
                                                    </small>
                                                </h4>
                                            </div>
                                        </div> 
                                       
                                    </div>
                                </div>
                            </div></div>
                        </ItemTemplate>
                    </asp:DataList>
               
              
                    <asp:DataList ID="DlDeliveryBoy" runat="server" CssClass="row" CellPadding="2" CellSpacing="2"
                        Font-Bold="True" ForeColor="#fef9e7" HorizontalAlign="Center" RepeatColumns="1"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="row" style="height: 100%; width: 500px; padding-top: 1px; background-color: White">
                                <div class="col-sm-2" style="height: 100%; width: 500px; padding-top: 1px">
                                   
                                    <div class="panel-body" style="height: 100%; width: 500px; padding-top: 1px;">
                                        <div class="thumbnail label-success" style="height: 100%; width: 350px; 
                                            background-color: #47476b">
                                
                                                    <asp:Label ID="Label4" runat="server" Font-Size="12px" Text=" Order Id :"></asp:Label>
                                                    <asp:Label ID="lblConOdrID" runat="server" Text='<%# Eval("ConfirmOdrID")%>' Font-Bold="true"
                                                        Font-Size="15px" ForeColor="White" Style="font-family: Celias,Helvetica"></asp:Label>
                                              
                                            <div class="hubPanel panel-body">
                                             <div class="panelLogo" style="color: White;">
                                                 <table><tr><td>
                                                    <i class="fa fa-map-marker fa-2x"></i>
                                                    <asp:Label ID="Location" runat="server" ForeColor="#d1d1e0" Font-Size="12px" Text=" DELIVERY LOCATION"></asp:Label>
                                                    </td>
                                                    <td style="padding-left:100px">
                                                    <a href="/Mapping2.aspx" class="panelLink">
                                                        <div class="hubPanel panel-body"style="background-color:White; height:35px; padding-top:5px; padding-left:5px; width:31px">
                                                            <div class="panelLogo" style="color: #2969B0;">
                                                                <i class="fa fa-share-square fa-2x"></i>
                                                            </div>
                                                        </div>
                                                    </a></td> </tr></table>
                                                </div>
                                              
                                          
                            
                                        <div class="col-md-6" style="padding-left: 25px">
                                            <asp:Label runat="server" ID="Label1" Font-Size="14px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                                Text='<%# Eval("Cust_Name")%>'></asp:Label>
                                        </div> 
                                       
                                            <div class="caption" style="padding-left:26px">
                                                <h4>
                                                    <small>
                                                        <asp:Label runat="server" ID="Label3" Font-Size="14px" ForeColor="#d1d1e0" Style="font-family: Celias,Helvetica"
                                                            Text='<%# Eval("Cust_Address")%>'></asp:Label>
                                                    </small>
                                                </h4>
                                            </div>
                                        </div>
                                        <div style="background-color: Green; padding-top: 10px; height: 35px; text-align: center">
                                            <asp:Button ID="Button1" runat="server" Font-Size="15px" ToolTip='<%# Eval("Deli_ID") %>'
                                                BackColor="Green" Font-Bold="true" OnClick="btn_PickupConfirmed" ForeColor="White"
                                                BorderStyle="None" Style="font-family: Celias,Helvetica" Text="ORDER CONFIRMED" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div></div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
</div>
</div>
</div>
</asp:Content>
