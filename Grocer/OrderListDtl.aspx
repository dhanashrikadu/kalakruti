<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="OrderListDtl.aspx.cs" Inherits="OnlineClothing.Grocer.OrderListDtl" %>
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
              <td bgcolor ="#f2f2f2">

               <div class="col-lg-6" align="left" >
                      <asp:Label ID="Label3" runat="server" Text="Order List :" Font-Bold="true" Font-Size="Large"> </asp:Label>
               </div>
              </td>
  
              </tr>
              <tr>
              <td>
              <div class ="col-lg-16" align="center">
  
              <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="550px" Width="100%">
                                    <asp:GridView ID="gvCordersList" runat="server" CssClass="table table-bordered"
                            AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#CC9966"
                            BorderStyle="None" BorderWidth="1px" CellPadding="10">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                        <asp:Label ID="lblGrocerId" runat="server" Visible="false" Text='<%# Bind("GrocerId") %>'></asp:Label>
                                        <asp:Label ID="lblCustID" runat="server" Visible="false" Text='<%# Bind("CustomerId") %>'></asp:Label>
                                        <asp:Label ID="lblCustOdrID" runat="server" Visible="false" Text='<%# Bind("CustmerOdrId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Customer Order Id">
                                    <ItemTemplate>
                                      
                                        <asp:Label ID="lblConfirmOdrID" runat="server" Text='<%# Bind("CustmerOdrId")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Item Name">
                                    <ItemTemplate>
                                      
                                        <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                      
                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Product Detail">
                                    <ItemTemplate>
                                      
                                        <asp:Label ID="lblproductDtl" runat="server" Text='<%# Bind("productDtl")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              <%--  <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                      
                                        <asp:Label ID="lblcustnm" runat="server" Text='<%# Bind("CustFullName")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                              <%--  <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddr" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                               <%--  <asp:TemplateField HeaderText="Mobile No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmob" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                               <%--  <asp:TemplateField HeaderText="Email-ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEm" runat="server" Text='<%# Bind("EmailId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                               <%-- <asp:TemplateField HeaderText="Order Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDeliDt" runat="server" Text='<%# Bind("Delivery_Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                     


                            <%--     <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btnPrint" runat="server" Text="Print" Height="28px" Width="60px" CssClass="btn1 btn-success" OnClick="Print_click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btnAccept" runat="server" Text="Accept" Height="28px" Width="60px" CssClass="btn1 btn-success" OnClick="btnAccept_click" 
                                        
                                         />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            <%--    <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btnChangeStatus" runat="server" Text=" Ready to Delivered" BackColor="#fafafa"
                                            ForeColor="#b40000" Font-Bold="true" OnClick="Changestatus_click" ToolTip='<%# Bind("CustOrdId") %>'/>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#330099" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            <SortedAscendingCellStyle BackColor="#FEFCEB" />
                            <SortedAscendingHeaderStyle BackColor="#AF0101" />
                            <SortedDescendingCellStyle BackColor="#F6F0C0" />
                            <SortedDescendingHeaderStyle BackColor="#7E0000" />
                        </asp:GridView>
                        <asp:Label ID="lblStatus" runat="server" Text="Completed" Visible="false" ></asp:Label>
                    </asp:Panel>
  
  </div>
  
  
  </td>
  
  </tr>
  </asp:Panel> 
 </table>
         </div>
         </div>
         </div>
         </div>
</asp:Content>
