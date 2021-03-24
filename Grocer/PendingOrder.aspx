<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="PendingOrder.aspx.cs" Inherits="OnlineClothing.Grocer.PendingOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="app-content content container-fluid">
        <div class="content-wrapper">
        <div class="content-header row">
        </div>
         <div class="content-body"><!-- stats -->
         <div class="row">
         <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
            <table class="table table-bordered table-hover">
        <asp:Panel ID="serchbar" runat="server">
           
            <tr>
            <td bgcolor="#f2f2f2">
                <div class="col-lg-6" align="left">
                    <asp:Label ID="Label3" runat="server" Text="Pending Order List :" Font-Bold="true" Font-Size="Large"> </asp:Label>
                </div>
            </td>
        </tr>
    </asp:Panel>
        <tr>
            <td>
               <%-- <div class="col-lg-16" align="center">--%>
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
                        <asp:GridView ID="gvPendingorders" runat="server" CssClass="table table-bordered"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966"
                            BorderStyle="None" BorderWidth="1px" >
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                        <asp:Label ID="lblGrocerId" runat="server" Visible="false" Text='<%# Bind("GrocerId") %>'></asp:Label>
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
                               <%-- <asp:TemplateField HeaderText="Order Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOstatus" runat="server" Text="Pending"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                 <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="Print_click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                     <%--   <asp:Button ID="btnChangeStatus" runat="server" Text="Ready to Delivered" BackColor="#fafafa"
                                            ForeColor="#b40000" Font-Bold="true" OnClick="Changestatus_click" ToolTip='<%# Bind("CustOrdId") %>'/>--%>
                                        <asp:Button ID="btnPrepared" runat="server" Text="Prepare" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnPrepared_click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                           <%-- <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />--%>
                              <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                          <%--  <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />--%>
                        </asp:GridView>
                        <asp:Label ID="lblStatus" runat="server" Text="Completed" Visible="false" ></asp:Label>
                    </asp:Panel>
              <%--  </div>--%>
            </td>
        </tr>
    </table>
       </div>
         </div>
         </div>
         </div>
</asp:Content>
