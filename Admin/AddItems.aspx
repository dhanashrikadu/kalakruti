<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin1.Master" AutoEventWireup="true" CodeBehind="AddItems.aspx.cs" Inherits="OnlineClothing.Admin.AddItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="app-content content container-fluid">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
                <div class="content-body"><!-- stats -->
        <div class="row">

          <asp:Panel runat="server" ID="PnlAddSubcat" CssClass="page-content">

         <div id="Div1" class="right-panel">
            <!-- Animated -->
                <!--  Traffic  -->
                 <table class="table table-bordered table-hover">
                <tr>
                    <td colspan="2" bgcolor="#FFF">
                        <asp:Label ID="Label3" runat="server" Text="Add Product :" Font-Bold="true"
                            Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16">
                            Select Category :
                        </div>
                        <div class="col-lg-16">
                           <asp:DropDownList ID="ddlCat" runat="server" class="form-control" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlCat_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16">
                            Select Sub Category :
                        </div>
                        <div class="col-lg-16">
                          <asp:DropDownList ID="ddlSubCat" runat="server" class="form-control" OnSelectedIndexChanged="ddlSubCat_SelectedIndexChanged"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                          Select Product :
                        </div>
                        <div class="col-lg-16">
                            <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" OnSelectedIndexChanged="ddlproducts_SelectIndexChange"
                            AutoPostBack="True">
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                 <tr>  
                  <tr> 
                    <td colspan="2">
                        <div class="col-lg-16">
                          Brand Name :
                        </div>
                        <div class="col-lg-16">
                           <asp:TextBox ID="txtbrandNm" runat="server" CssClass="form-control" placeholder="Add Items Brand Name"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                          Detail :
                        </div>
                        <div class="col-lg-16">
                           <asp:TextBox ID="txtDetails" runat="server" CssClass="form-control" placeholder="Add Details"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                 <tr>  
                    <td colspan="2">
                        <div class="col-lg-16">
                           Products Image :
                        </div>
                        <div class="col-lg-16">
                          <asp:FileUpload ID="FileUploaditem" runat="server" placeholder="Select" />
                                     <asp:RequiredFieldValidator ID="FileUpload_RequiredFieldValidator" runat="server" SetFocusOnError="true" ForeColor="Red"
                                    ControlToValidate="FileUploaditem" ErrorMessage="Choose a File">
                                   </asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>
               
                <tr align="right">
                    <td colspan="2">
                        <div class="col-lg-16">
                             <asp:Button ID="bbbtnAddItem" runat="server" Text="Add Items" 
                                ToolTip="Continue" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnAddItem_Click"
                                PostBackUrl="" />
                        </div>
                      
                    </td>
                </tr>
                </table>
               



                  <div class="orders">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                             <div class="col-lg-16">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <td bgcolor="#FFF">
                                            <asp:Label ID="LblSubcat" runat="server" Text="Item List :" Font-Bold="true"
                                                Font-Size="Large"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                              
                                <div class="card-body--">
                                   
                                         <asp:Panel ID="pnlgrid" runat="server" ScrollBars="Both" Width="100%">
                                         <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
                                        <asp:GridView ID="GvAddItem" runat="server" AutoGenerateColumns="false" CssClass="table-bordered"
                                            Width="100%">
                                            <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle Height="40px" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sr.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                        <%--<asp:label id="lblitemid" runat="server" visible="false" text='<%# bind("itemqtyid") %>'></asp:label>--%>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10px" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Items Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblItemId" runat="server" Text='<%# Bind("ItemId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle  HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                       <asp:Image ID="imgcat" runat="server" ImageUrl='<%# Bind("Image") %>' Height="50px" Width="50px" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Items Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBrandName" runat="server" Text='<%# Bind("BrandName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle  HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Details">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDetails" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle  HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnCancle" runat="server" Text="Cancel" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="Deleteitem_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </asp:Panel>
                                </div>
                            </div> <!-- /.card -->
                        </div>  <!-- /.col-lg-8 -->
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
