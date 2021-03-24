<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="CompletedOrder.aspx.cs" Inherits="OnlineClothing.Grocer.CompletedOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="app-content content container-fluid">
        <div class="content-wrapper">
        <div class="content-header row">
        </div>
         <div class="content-body"><!-- stats -->
         <div class="row">
             <table class="table table-bordered table-hover">
              <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
       
        <tr>
            <td bgcolor="#f2f2f2">
                <div class="col-lg-6" align="left">
                    <asp:Label ID="Label3" runat="server" Text="Complete Order List :" Font-Bold="true"
                        Font-Size="Large"> </asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="col-lg-16" align="center">
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="550px" Width="100%">
                        <asp:GridView ID="gvCompleteorders" runat="server" CssClass="table table-bordered"
                            AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#CC9966"
                            BorderStyle="None" BorderWidth="1px" CellPadding="10">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                       <%-- <asp:Label ID="lblGrocerId" runat="server" Visible="false" Text='<%# Bind("GrocerId") %>'></asp:Label>--%>
                                        <asp:Label ID="lblCustID" runat="server" Visible="false" Text='<%# Bind("CustId") %>'></asp:Label>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Confirm Order Id">
                                    <ItemTemplate>
                                      <%--  <asp:Label ID="lblCustOdrID" runat="server" Text='<%# Bind("ConfirmOdrID") %>'></asp:Label>--%>
                                        <asp:Label ID="lblConfirmorderId" runat="server" Text='<%# Bind("ConfirmOdrID")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                        <%--<asp:Label ID="lblcustnm" runat="server" Text='<%# Bind("CustFullName") %>'></asp:Label>--%>
                                        <asp:Label ID="lblcustnm" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddr" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Mobile No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmob" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Email-ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEm" runat="server" Text='<%# Bind("EmailId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="Order Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDeliDt" runat="server" Text='<%# Bind("Delivery_Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Total Price">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTprice" runat="server" Text='<%# Bind("Toatal_price") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Order Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrderstatus" runat="server" Text="Completed"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="Print_click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                             <asp:Button ID="btnChangeStatus" runat="server" Text="Ready to Delivered" CssClass="btn btn-red btn-darken-2" 
                                             ForeColor="White" Font-Bold="true" OnClick="Changestatus_click" ToolTip='<%# Bind("ConfirmOdrID") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                             <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </td>
        </tr>
    </table>
         </div>
         </div>
         </div>
         </div>
</asp:Content>
