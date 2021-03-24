<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="GrocerProfile.aspx.cs" Inherits="OnlineClothing.Grocer.GrocerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
        .page-content2
        {
            margin-top: 12px;
            margin-bottom: 12px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="app-content content container-fluid">
      <div class="content-wrapper ">
        <div class="content-header row  col-md-3">
        </div>
        <div class="content-body col-md-6"><!-- stats -->
<div class="row">
<%--<div class="col-lg-12">--%>
     
            <div class="col-lg-12" >
                <div style="background-color: #f2f2f2">
                <center>
                    <asp:Label ID="grocerprofile" runat="server" Text="My Profile" Font-Bold="true" Font-Names="san-serif"
                        Font-Size="Large"></asp:Label>
                        </center>
                </div>
                   <asp:Panel ID="Panel2" runat="server" CssClass="page-content2">
                   <table class="table-responsive border box-shadow-3 col-md-3">
                   
                       <tr>
                           <td colspan="2" align="center">
                           
                               <asp:Image ID="imgprof" runat="server" CssClass="img-circle" Width="200" Height="200"
                                    ImageUrl='<%# Eval("image") %>' /><br />
                                    <div style="padding-top:30px">
                                <asp:Label ID="Label1" runat="server" Text="Profile Photo" Font-Size="15px"></asp:Label>
                                </div>
                           </td>
                       </tr>
                       <tr >
                       <td colspan="2" align="center" style="padding:20px"> 
                       <b> <asp:Label ID="Label2" runat="server" Text="Shop-Details:" Font-Size="15px" Font-Italic="true"></asp:Label></b>
                       </td>
                       </tr>
                       <tr>
                       <td> <asp:Label ID="lblSName" runat="server" Text="Shop Name:-  " Font-Size="15px"></asp:Label></td>
                       <td><asp:Label ID="lblShopmn" runat="server" Text="Shop Name:-  " Font-Size="15px"></asp:Label></td>
                       </tr>
                        <tr>
                       <td> <asp:Label ID="lblSaddr" runat="server" Text="Shop Address:-  " Font-Size="15px"></asp:Label></td>
                       <td> <asp:Label ID="lblSadrress" runat="server" Text="" Font-Size="15px"></asp:Label></td>
                       </tr>
                       <tr>
                       <td><asp:Label ID="lblSreg" runat="server" Text="Shop Registration No:-  " Font-Size="15px"></asp:Label>
                          </td>
                       <td><asp:Label ID="lblSHOPreg" runat="server" Text="" Font-Size="15px"></asp:Label></td>
                       </tr> 
                       <tr><td></td></tr>
                       <tr>
                        
                       <td colspan="2" align="center"  style="padding:20px">
                       <b><asp:Label ID="Label4" runat="server" Text="Shop-Owner Details:" Font-Size="15px" Font-Italic="true"></asp:Label></b>
                       </td>
                       </tr>
                        <tr>
                       <td> <asp:Label ID="lblOwnNM" runat="server" Text="Shop Owner Name:-  " Font-Size="15px"></asp:Label></td>
                        <td> <asp:Label ID="lblSnm" runat="server" Text="" Font-Size="15px"></asp:Label></td>
                       </tr>
                        <tr>
                       <td> <asp:Label ID="lblMobNo" runat="server" Text="Mobile No:-  " Font-Size="15px"></asp:Label><br /></td>
                        <td><asp:Label ID="lblMOb" runat="server" Text="" Font-Size="15px"></asp:Label></td>
                       </tr>
                        <tr>
                       <td> <asp:Label ID="lblEmailId" runat="server" Text="Email-ID:-  " Font-Size="15px"></asp:Label></td>
                        <td> <asp:Label ID="lblEmail" runat="server" Text="" Font-Size="15px"></asp:Label></td>
                       </tr>
                        <tr>
                       <td> <asp:Label ID="lblOwnAdhar" runat="server" Text="Owner Adhar No:-  " Font-Size="15px"></asp:Label></td>
                        <td> <asp:Label ID="lblAdhar" runat="server" Text="" Font-Size="15px"></asp:Label></td>
                       </tr>
                        <tr>
                       <td></td>
                        <td></td>
                       </tr>
                        <tr>
                       <td colspan="2" align ="center"  style="padding:20px"> <asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" 
                             OnClick="update_click" />
                              <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"  />
                              </td>                     
                       </tr>
                       

                     
                   
                   </table>
                   </asp:Panel>
                      <asp:Panel ID="pnlAddShop" runat="server" Visible="false" CssClass="page-content2">
            <div id="myTabContent" class="tab-content ">
             <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
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
                    <asp:Label ID="Label5" runat="server" Text="Shop Name" Font-Size="15px"></asp:Label>
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
                    <asp:Label ID="Label6" runat="server" Text="Shop Owner Name" Font-Size="15px"></asp:Label>
                    <asp:TextBox ID="txtOwnNm" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label7" runat="server" Text="Mobile No" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtMobNo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label8" runat="server" Text="Email-ID" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label9" runat="server" Text="Owner Adhar No" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtOwnAdhar" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                   <div class="form-group col-lg-16">
                    <asp:Label ID="Label12" runat="server" Text="Account No" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label13" runat="server" Text="IFSC Code" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtIFSCcode" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group col-lg-16">
                    <asp:Label ID="Label10" runat="server" Text="Password" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label11" runat="server" Text="Confirm Pass" Font-Size="15px"></asp:Label><br />
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
                <asp:Button ID="btnRagister" runat="server" Text="Update" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnRegister_click"
                    />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnCancel_Click" />
                   </div>
            </div>
            </div>
          </asp:Panel>
                    </div>
        
                </div>
       
    
    </div>
</div>
</div>

</asp:Content>
