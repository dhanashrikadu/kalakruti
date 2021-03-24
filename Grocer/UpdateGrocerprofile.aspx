<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="UpdateGrocerprofile.aspx.cs" Inherits="OnlineClothing.Grocer.UpdateGrocerprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="app-content content container-fluid">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
                <div class="content-body"><!-- stats -->
        <div class="row">
         <asp:Panel ID="pnlAddShop" runat="server"  CssClass="page-content2">
            <div id="myTabContent" class="tab-content ">
                <ul class="nav nav-tabs">
                   <%-- <li class="active"><a href="#" data-toggle="tab">Add New Shop</a></li>--%>
                    <li><asp:Label ID="Label3" runat="server" Text="Update Shop Information :" Font-Bold="true"
                            Font-Size="Large"></asp:Label></li> 
                </ul>
                <div class="row" style="padding: 10px;">
                </div>
               
                <form id="tab">
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblArea" runat="server" Text="Area Name" Font-Size="15px"></asp:Label><br />
                    <asp:DropDownList ID="ddlArea" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblSName" runat="server" Text="Shop Name" Font-Size="15px"></asp:Label>
                    <asp:TextBox ID="txtSName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblSRegNo" runat="server" Text="Shop Registration No" Font-Size="15px"></asp:Label>
                    <asp:TextBox ID="txtSRegNo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblShopAddr" runat="server" Text="Shop Address" Font-Size="15px"></asp:Label>
                    <asp:TextBox ID="txtShopAddr" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblOwnNM" runat="server" Text="Shop Owner Name" Font-Size="15px"></asp:Label>
                    <asp:TextBox ID="txtOwnNm" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblMobNo" runat="server" Text="Mobile No" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtMobNo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblEmailId" runat="server" Text="Email-ID" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblOwnAdhar" runat="server" Text="Owner Adhar No" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtOwnAdhar" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label1" runat="server" Text="Password" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label2" runat="server" Text="Confirm Pass" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtCpass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not matched" ForeColor="Red"
                    ControlToValidate="txtCpass" ControlToCompare="txtpass"></asp:CompareValidator>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="lblimg" runat="server" Text="Upload Image" Font-Size="15px"></asp:Label><br />
                   <asp:FileUpload ID="FileUpload1" runat="server" placeholder="Select"/>
                </div>
                </form>
                <div class="col-lg-16" style="text-align:right;">
               
                    <asp:Button ID="btnRagister" runat="server" Text="Register " CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnRegister_click"/>
                     
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel"CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                    OnClick="btnCancel_click" />
                  </div>
                   
            </div>
        </asp:Panel>
        </div>
        </div>
        </div>
        </div>
        
</asp:Content>
