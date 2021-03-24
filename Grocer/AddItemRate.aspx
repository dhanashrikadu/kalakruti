<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="AddItemRate.aspx.cs" Inherits="OnlineClothing.Grocer.AddItemRate" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="atk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div class="app-content content container-fluid">
        <div class="content-wrapper">
        <div class="content-header row">
        </div>
         <div class="content-body"><!-- stats -->
         <div class="row">
             <asp:Panel ID="PnlMain" runat="server">
        <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
         <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
            <table class="table table-bordered table-hover" style="border-style:ridge;">
                <tr>
                    <td colspan="2" bgcolor="#fff">
                        <asp:RadioButtonList ID="rbtItemPriceSrch" runat="server" RepeatDirection="Horizontal"
                            CssClass="rbt" AutoPostBack="true" OnSelectedIndexChanged="rbtItemPriceSrch_SelectedIndexChanged">
                            <asp:ListItem Value="1">Search Product</asp:ListItem>
                            <asp:ListItem Value="2">By Category</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
             <asp:Panel ID="PnlSearch" runat="server" Visible="false">
        <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td colspan="2" bgcolor="#fff">
                        <asp:Label ID="Label1" runat="server" Text="Search Product:" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSearchProduct" Width="100%" runat="server" CssClass="form-control"
                            Style="height: 30px;" EnableViewState="true" placeholder="search for product "
                            OnTextChanged="txtsearchproduct_TextChanged" AutoPostBack="true" ValidationGroup="vgTicket"></asp:TextBox>
                        <atk:autocompleteextender id="txtSearchProduct_AutoCompleteExtender" runat="server"
                            delimitercharacters="" enabled="True" servicepath="" servicemethod="GetClients"
                            targetcontrolid="txtSearchProduct" enablecaching="true" minimumprefixlength="1"
                            completionsetcount="10" completionlistcssclass="panel">
                                                    </atk:autocompleteextender>
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
        </div>
    </asp:Panel>
             <asp:Panel ID="pnlItemRate" runat="server" Visible="false">
        <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td colspan="2" bgcolor="#fff">
                        <asp:Label ID="Label2" runat="server" Text="Fill Stock :" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                            Category :
                        </div>
                        <div class="col-lg-16">
                            <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                            Sub Category :
                        </div>

                        <div class="col-lg-16">
                            <asp:DropDownList ID="ddlSubCategory" runat="server" class="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"
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
                            <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" OnSelectedIndexChanged="ddlproducts_SelectedIndexChanged"
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Visible="false" >
             <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
        <table class="table table-bordered table-hover">
            <tr>
                <td bgcolor="#fff">
                    <asp:Label ID="Label3" runat="server" Text="Item Rate List :" Font-Bold="true" Font-Size="Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="col-lg-16" align="center">
                        
                            <asp:GridView ID="gvItemRate" runat="server" CssClass="table table-bordered" ForeColor="Black" Font-Size="Medium"
                                GridLines="None" AutoGenerateColumns="False" OnRowEditing="gvItemRate_RowEditing"
                                OnRowCancelingEdit="gvItemRate_RowCancelingEdit" OnRowUpdating="gvItemRate_RowUpdating">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr.No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                            <asp:Label ID="lblGrocerId" runat="server" Visible="false" Text='<%# Bind("GrocerRateId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image ID="imgrate" runat="server" ImageUrl='<%# Bind("Image") %>' Height="50px"
                                                Width="50px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qty">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MRP">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMRP" runat="server" Enabled="false" Text='<%# Bind("MRP") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Service Charge">
                                        <ItemTemplate>
                                            <asp:Label ID="lblServiceCharge" runat="server" Enabled="false" Text="10%"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Owner Rate" Visible="false">
                                        <ItemTemplate>
                                            <%-- <asp:TextBox ID="txtOwnerRate" runat="server" Text="" OnTextChanged="txtOwnerRate_Click" AutoPostBack="true"></asp:TextBox>--%>
                                            <asp:Label ID="lblMRP1" runat="server" Enabled="false" Text='<%# Bind("MRP") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:TemplateField HeaderText="Offer Rate">
                                            <ItemTemplate>
                                           
                                                     <asp:Label ID="lblMRP2" runat="server" Text='<%# Bind("OfferRate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Offer Rate">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_OffeRate" runat="server" Text='<%#Eval("OfferRate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_OffeRate" runat="server" Text='<%#Eval("OfferRate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Discount">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_Discount" runat="server" Text='<%#Eval("Discount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txt_Discount" runat="server" Text='<%#Eval("Discount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                   </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btn_Edit" runat="server" Text="Edit" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" CommandName="Edit" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Button ID="btn_Update" runat="server" Text="Update" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" CommandName="Update" />
                                            <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" CommandName="Cancel" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                               <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                            </asp:GridView>
                        
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <div class="col-lg-16">
                        <asp:Button ID="btnUpdateRates" runat="server" Text="Update Items Rates" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" ToolTip="Continue" OnClick="btnUpdateRates_click" />
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
