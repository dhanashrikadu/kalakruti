<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryForms/masterDeliveryBoy.Master" AutoEventWireup="true" CodeBehind="Placeorder.aspx.cs" Inherits="OnlineClothing.deliveryForms.Placeorder" %>
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
<asp:Panel runat="server" ID="pnlCategory">
   <div class="col-lg-16 col-xs-16 col-md-16 col-sm-16" style="padding-left:5px;padding-top:5px" >
    <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
        <asp:Label ID="iblConOdrID" runat="server" Text='<%# Eval("ConfirmOdrID")%>'></asp:Label>
        <asp:Label runat="server" ID="Label4" Font-Bold="true" Font-Size="17px" ForeColor="#666"
                                     style=" font-family:Celias,Helvetica" Text="Welcome to new delivery "></asp:Label>
        <asp:DataList ID="DlDeliveryBoy" runat="server"  CssClass="row"
                CellPadding="2" CellSpacing="2" Font-Bold="True" ForeColor="#fef9e7" HorizontalAlign="Center"
                RepeatColumns="1" RepeatDirection="Horizontal">
                <ItemTemplate>
                   <div class="row" style="height:100%; width:500px;   padding-top:1px;background-color:White">
                   <div class="col-sm-2" style="height:100%; width:500px ; padding-top:1px"><!--THUMBNAIL#2-->
                       <div class="panel-body" style="height: 100%; width: 500px; padding-top: 1px;">
                           <div class="thumbnail label-success" style="height: 100%; width: 350px; padding-top: 20px;
                               background-color: #273039">
                               <div style="text-align: center">
                                   <asp:Label runat="server" ID="Label12" Font-Size="16px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                       Text="DELIVERY LOCATION"></asp:Label>
                                   <asp:Label ID="lblConOdrID" runat="server" Text='<%# Eval("ConfirmOdrID")%>' Font-Bold="true"
                                       Font-Size="17px" ForeColor="White" Style="font-family: Celias,Helvetica"></asp:Label>
                               </div>
                            <div class="col-md-16" style="border-color:White; border-width:thin; border-style:groove">
                            
                            <div class="col-md-6">
                            <div class="caption">
                          <h4><small> <asp:Label runat="server" ID="Label7"  Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                   Text="Name : "></asp:Label>
                            <asp:Label runat="server" ID="Label1" Font-Size="18px"  ForeColor="White" Style="font-family: Celias,Helvetica"
                                   Text='<%# Eval("Cust_Name")%>'></asp:Label></small></h4>
                                   </div>
                           </div>
                               <div class="col-md-6">
                               <div class="caption"> <h4><small>
                             <asp:Label runat="server" ID="Label8" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                   Text="Mobile No : "></asp:Label>
                               <asp:Label runat="server" ID="Label2" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                   Text='<%# Eval("Cust_Mob")%>'></asp:Label></small></h4>
                                    </div>
                                    </div>
                            <div class="col-md-6" >
                            <div class="caption"><h4><small>
                             <asp:Label runat="server" ID="Label9" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                   Text="Address : "></asp:Label>
                               
                                           <asp:Label runat="server" ID="Label3" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                               Text='<%# Eval("Cust_Address")%>'></asp:Label></small></h4>
                               </div>
                               </div>
                              <div class="col-md-6">
                              <div class="caption"><h4><small>
                             <asp:Label runat="server" ID="Label10" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                   Text="Payment Method : "></asp:Label>
                               
                               
                                   <asp:Label runat="server" ID="Label5" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                       Text='<%# Eval("Paymet_Method")%>'></asp:Label></small></h4>
                                       </div>
                                       </div>
                                       <div class="col-md-6">
                                       <div class="caption"><h4><small>
                             <asp:Label runat="server" ID="Label11" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                   Text="Payment Needed : "></asp:Label>
                                   <asp:Label runat="server" ID="Label6" Font-Size="18px" ForeColor="White" Style="font-family: Celias,Helvetica"
                                       Text='<%# Eval("Total_Amount")%>'></asp:Label></small></h4>
                               </div>
                               </div>
                               <div  style="background-color:Green;padding-top:10px; height:35px;  text-align:center">
                                   <asp:Button ID="Button1" runat="server" Font-Size="15px" ToolTip='<%# Eval("Deli_ID") %>' BackColor="Green" Font-Bold="true" 
                                   ForeColor="White" BorderStyle="None" Style="font-family: Celias,Helvetica" Text="Delivered" />
                               </div></div>
                               </div>
                           </div>
                       </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
     </asp:Panel>
     </div>
     </div>
     </div>
     </div>
</asp:Content>
