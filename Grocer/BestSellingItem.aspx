<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="BestSellingItem.aspx.cs" Inherits="OnlineClothing.Grocer.BestSellingItem" %>
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
             <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
        <table class="table table-bordered table-hover">
            <tr>
                <td colspan="2" bgcolor="#fff">
                    <asp:Label ID="Label2" runat="server" Text="Best Offers :"  Font-Bold="true" Font-Size="Large"></asp:Label>
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
                <%--===========================================================--%>
             <asp:Panel ID="PnlShowGrid" runat="server" Visible="false">
        <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
        <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
            <table class="table table-bordered table-hover">
                <tr>
                    <td bgcolor="#fff">
                        <asp:Label ID="Label4" runat="server" Text="Save List:" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <div class="col-lg-16" align="center">
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <contentTemplate>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
                                <asp:GridView ID="gvItemRate" runat="server" CssClass="table table-bordered" ForeColor="Black"
                                    GridLines="None" AutoGenerateColumns="False">
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
                                                <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                            
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MRP">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMRP" runat="server" Enabled="false" Text='<%# Bind("MRP") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Offer Rate">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOfferare" runat="server" Enabled="false" Text='<%# Bind("OfferRate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField> <asp:TemplateField HeaderText="Discount %">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtDiscount" runat="server" MaxLength="2" Text="" OnTextChanged="txtDiscount_click"
                                                    AutoPostBack="true" onkeypress="return functionx(event)"></asp:TextBox>
                                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic"
                                                    ErrorMessage="Enter only 1-99%" ValidationExpression="\d{2}" ControlToValidate="txtDiscount"
                                                    CssClass="text-danger" Type="Integer" MinimumValue="1" MaximumValue="99"
                                                    Font-Size="XX-Small"></asp:RegularExpressionValidator>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Final Offer Rate">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtFinalOfferRate" runat="server" Enabled="false" Text=""></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                                </asp:GridView>
                            </asp:Panel>
                            </contentTemplate>
                           </asp:UpdatePanel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <div class="col-lg-16">
                            <asp:Button ID="btnDiscount" runat="server" Text="Save Discount" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                ToolTip="Continue" OnClick="Discount_click" />
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
