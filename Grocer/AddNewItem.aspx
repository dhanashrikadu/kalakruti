<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="AddNewItem.aspx.cs" Inherits="OnlineClothing.Grocer.AddNewItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="app-content content container-fluid">
        <div class="content-wrapper">
        <div class="content-header row">
        </div>
         <div class="content-body"><!-- stats -->
         <div class="row">
         <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
          <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
        <table class="table table-bordered table-hover">
            <tr>
                <td colspan="2" bgcolor="#fff">
                    <asp:Label ID="Label2" runat="server" Text="Fill Stock :" Font-Bold="true" Font-Size="Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td td colspan="2">
                    <div class="col-lg-16">
                        Category :
                    </div>
                    <div class="col-lg-16">
                        <%--  <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                        </asp:DropDownList>--%>
                        <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                        <%--OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"--%>
                    </div>
                </td>
                </tr>
                <tr>
                <td td colspan="2">
                    <div class="col-lg-16">
                        Sub Category :
                    </div>
                    <div class="col-lg-16">
                        <asp:DropDownList ID="ddlSubCategory" runat="server" class="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"
                            AutoPostBack="True">
                            <%--onselectedindexchanged="ddlsubcategory_selectedindexchanged"--%>
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
                        <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" OnSelectedIndexChanged="ddlproducts_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>
            <%-- <tr>
                <td colspan="2">
                    <div class="col-lg-16">
                        <asp:Button ID="btnShowItems" runat="server" Text="Show Items" Width="100px" Height="30px"
                            ToolTip="Continue" CssClass="btn btn-primary pull-right" PostBackUrl="" onclick="showItemGrid" /></div>
                </td>
            </tr>--%>
        </table>
    </div>
    <%--===========================================================--%>
            <asp:Panel ID="PnlShowGrid" runat="server" Visible="false">
        <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td bgcolor="#fff">
                        <asp:Label ID="Label4" runat="server" Text="Save List:" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16" align="center">
                            <asp:Panel ID="PnlShowGridsss" runat="server" ScrollBars="Both" >
                                <div class="col-md-16">
                                    <asp:Label ID="Label1" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <div class="col-lg-16" align="center">
                                        <asp:GridView ID="gvItemList" runat="server" CssClass="table table-bordered" ForeColor="Black"
                                            GridLines="None" AutoGenerateColumns="False">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk" runat="server" Checked="true"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sr.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                        <asp:Label ID="lblItemID" runat="server" Visible="false" Text='<%# Bind("ItemQtyId") %>'></asp:Label>
                                                          <%--<asp:Label ID="lblIsShow" runat="server" Visible="false" Text='<%# Bind("IsShow") %>'></asp:Label>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:Image ID="img" runat="server" ImageUrl='<%# Bind("Image") %>' Height="50px"
                                                            Width="50px" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Item Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Quantity">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnFreez" runat="server" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" Text='<%# Eval("Qty")%>' OnClick="btnFreez_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <%--<div class="col-lg-16">
                    <asp:Button ID="btnItemsSave" runat="server" Text="Save Items" Width="100px" Height="40px"
                        ToolTip="Continue" CssClass="btn btn-primary pull-right" OnClick="btnSave_click" />
                </div>--%>
                                    </div>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <div class="col-lg-16">
                            <asp:Button ID="btnUpdateRates" runat="server" Text="Save Items" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                ToolTip="Continue" OnClick="btnSave_click" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
         </div>
         </div>
         </div>
         </div>
</asp:Content>
