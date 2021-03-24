<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="OnlineClothing.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="500px">
                    <div class="table-main table thead">
                                <asp:GridView ID="GvCardDtl" runat="server" CssClass="table table-bordered" 
                                    GridLines="None" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                            <%--    <asp:Label ID="lblCartId" runat="server" Visible="false" Text='<%# Bind("cartID") %>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image">   
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" Height="70px" Width="70px" ImageUrl='<%# Eval("Image") %>'  />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product">   
                                            <ItemTemplate>
                                            <asp:Label ID="lblBrandName" runat="server" Text='<%# Eval("BrandName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                               <asp:Label ID="lblMRP" runat="server" Text='<%# Eval("OfferRate") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                  <div class="quantity-box">
                                                      <asp:TextBox ID="txtQunatity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                                     <%-- <asp:TextBox ID="txtcount" runat="server" class="form-control" Text='<%# Bind("Quantity") %>' value="0" min="0" max="20" TextMode="Number")></asp:TextBox>--%>
                                                </div>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                  <div class="pro-qty">
                                                      <%--<asp:TextBox ID="txtTotal" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>--%>
                                                      <asp:LinkButton ID=lbtnRemoveFromCart class="fas fa-times remove-pr" 
                                                       runat="Server" ></asp:LinkButton>
                                            </div>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                   <%-- <HeaderStyle BackColor="#7fad39" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center" />--%>
                                   <HeaderStyle BackColor="#d33b33" Font-Bold="True" ForeColor="#ffffff" HorizontalAlign="Left" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099"  HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                </asp:GridView>
                                
                                </div>
                            </asp:Panel>
                      
                       <%-- </table>--%>
                    </div>
                </div>
            </div>

           

           
    </div>
    <!-- End Cart -->
</asp:Content>
