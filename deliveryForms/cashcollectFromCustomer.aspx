<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryForms/masterDeliveryBoy.Master" AutoEventWireup="true" CodeBehind="cashcollectFromCustomer.aspx.cs" Inherits="OnlineClothing.deliveryForms.cashcollectFromCustomer" %>

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
            box-shadow: none !important;
            -webkit-transition: background-color .15s,border-color .15s,opacity .15s;
            -o-transition: background-color .15s,border-color .15s,opacity .15s;
            transition: background-color .15s,border-color .15s,opacity .15s;
            vertical-align: middle;
            margin: 0;
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="app-content content container-fluid">
  <div class="content-wrapper">
   <div class="content-header row">
   </div>
   <div class="content-body"><!-- stats -->
     <div class="row">
<asp:Panel runat="server" ID="pnlCategory" >
  <div class="col-lg-16 col-xs-16 col-md-16 col-sm-16" style="padding-left: 15px; padding-top: 15px; padding-right:15px ">
   <div class="col-lg-15 col-xs-15 col-md-15 col-sm-15" style="padding-left: 15px; padding-top: 12px; background-color:
	 	 #cce6ff">
       
        <asp:Label runat="server" ID="Label4" Font-Bold="true" Font-Size="16px" ForeColor="#666" Height="35px"
                                     style=" font-family:Celias,Helvetica" Text="Collect cash from customer "></asp:Label>
       
        </div>
        <div class="col-lg-15 col-xs-15 col-md-15 col-sm-15" style="padding-left: 15px; padding-top: 25px" >
         <asp:Label runat="server" ID="Label1" Font-Bold="true" Font-Size="12px" ForeColor="GrayText" 
                                     style=" font-family:Celias,Helvetica" Text="ENTER ACTUAL AMOUNT PAID BY CUSTOMER"></asp:Label></div>
                                     <div class="col-lg-15 col-xs-15 col-md-15 col-sm-15" style="padding-left: 15px; padding-top: 12px" >
            <asp:TextBox ID="TextBox1" Width="305px" BackColor="#eff5f5" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-15 col-xs-15 col-md-15 col-sm-15" style="padding-left: 15px; padding-top: 25px" >
         <asp:Label runat="server" ID="Label2" Font-Bold="true" Font-Size="12px" ForeColor="GrayText" 
                                     style=" font-family:Celias,Helvetica" Text="RE-ENTER AMOUNT "></asp:Label></div>
                                     <div class="col-lg-15 col-xs-15 col-md-15 col-sm-15" style="padding-left: 15px; padding-top: 12px" >
            <asp:TextBox ID="TextBox2" Width="305px" BackColor="#eff5f5" runat="server"></asp:TextBox>
        </div>
        <div class="col-lg-15 col-xs-15 col-md-15 col-sm-15" style="padding-left: 15px; padding-top: 30px" >
            <asp:Button ID="btn_CollectCash" Width="305px" Height="37px" runat="server" ForeColor="White" Font-Bold="true" BackColor=" #1a8cff" Text="CASH COLLECTED" />
        </div>
        </div>
     </asp:Panel>
     </div>
</div>
</div>
</div>
</asp:Content>