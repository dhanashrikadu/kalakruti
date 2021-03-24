<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin1.Master" AutoEventWireup="true" CodeBehind="AddNewShop.aspx.cs" Inherits="OnlineClothing.Admin.AddNewShop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-content2
        {
            margin-top: 12px;
            margin-bottom: 12px;
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
      
            <asp:Panel ID="pnlgrid" runat="server" style="padding-left: 20px; padding-right: 19px;">

                 <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
                <table class="table table-bordered table-hover">
                    <tr>
                        <td bgcolor="#FFF">
                            <asp:Label ID="Label3" runat="server" Text="Category Lists :" Font-Bold="true" Font-Size="Large"></asp:Label>
                        </td>
                    </tr>
               
               <tr>
                    <td>
                 <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
                  <asp:GridView ID="gvShop" runat="server" AutoGenerateColumns="false"  CssClass="table-bordered" 
                    Width="100%">
                    <HeaderStyle BackColor="#b40000" ForeColor="White" Height="30px" />
                    <RowStyle Height="40px" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                  <asp:Label ID="lblhederid" runat="server" Visible="false" Text='<%# Bind("GrocerId") %>'></asp:Label>
                                <%--<asp:label id="lblitemid" runat="server" visible="false" text='<%# bind("itemqtyid") %>'></asp:label>--%>
                            </ItemTemplate>
                            <ItemStyle Width="10px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <asp:Image ID="imgheader" runat="server" ImageUrl='<%# Bind("image") %>' Height="50px" Width="50px" />
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCatName" runat="server" Text='<%# Bind("ShopOwnName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marathi Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblMarathiCatName" runat="server" Text='<%# Bind("ShopName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCatName" runat="server" Text='<%# Bind("MobNo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marathi Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblMarathiCatName" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCatName" runat="server" Text='<%# Bind("ShopAddr") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marathi Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblMarathiCatName" runat="server" Text='<%# Bind("AreaCode") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCatName" runat="server" Text='<%# Bind("ShopRegNo") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                  <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" onclick="btnDelete_Click"  />
                            </ItemTemplate>
                             <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                     <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                </asp:GridView>
                 </td>
                    </tr>  
                <%-- <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />--%>
                    <tr>
                    <td>
                    
                       
                <div class="col-lg-16" style="text-align:right;">
                  <asp:Button ID="AddNewSh" runat="server" Text="Register New Shop" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" onclick="AddNewSh_Click" />
                </div>
                 </td>
                    </tr>  
                 </table>
              </div>
            </asp:Panel>
                 <asp:Panel ID="pnlAddShop" runat="server" Visible="false" CssClass="page-content2">
            <div id="myTabContent" class="tab-content ">
             <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
                <ul class="nav nav-tabs">
                   <%-- <li class="active"><a href="#" data-toggle="tab">Add New Shop</a></li>--%>
                    <li><asp:Label ID="Label1" runat="server" Text="Update Shop Information :" Font-Bold="true"
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
                    <asp:Label ID="Label12" runat="server" Text="Account No" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label13" runat="server" Text="IFSC Code" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtIFSCcode" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group col-lg-16">
                    <asp:Label ID="Label2" runat="server" Text="Password" Font-Size="15px"></asp:Label><br />
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group col-lg-16">
                    <asp:Label ID="Label4" runat="server" Text="Confirm Pass" Font-Size="15px"></asp:Label><br />
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
                <asp:Button ID="btnRagister" runat="server" Text="Register " CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnRegister_click"
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
   
</asp:Content>
