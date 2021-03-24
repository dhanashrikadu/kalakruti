<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="OnlineClothing.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" >
                    <div class="table-main table thead">
                     <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
                                <asp:GridView ID="GvCardDtl" runat="server" CssClass="table table-bordered" 
                                    GridLines="None" AutoGenerateColumns="False" >
                                    
                                    
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                <%--<asp:Label ID="lblCartId" runat="server" Visible="false" Text='<%# Bind("cartID") %>'></asp:Label>--%>
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
                                          
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                  <div class="quantity-box">
                                                      <asp:TextBox ID="txtQunatity" runat="server"  Text='<%# Bind("Quantity") %>' ReadOnly="true"></asp:TextBox>
                                                      
                                                  </div>
                                                 
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                             <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                             <asp:Label ID="lblSize" runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                                            
                                            </ItemTemplate>
                                            <ItemStyle Width="" HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Remove">
                                            <ItemTemplate>
                                                  <div class="pro-qty">
                                                      <%--<asp:TextBox ID="txtTotal" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>--%>
                                                      <asp:LinkButton ID=lbtnRemoveFromCart class="fas fa-times remove-pr"
                                                       runat="Server" onclick="lbtnRemoveFromCart_Click"></asp:LinkButton>
                                            </div>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                   <%-- <HeaderStyle BackColor="#7fad39" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center" />--%>
                                   <HeaderStyle BackColor="#d33b33" Font-Bold="True" ForeColor="#ffffff" HorizontalAlign="Left" />
                                   <%-- <PagerStyle BackColor="#FFFFCC" ForeColor="#330099"  HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                    <SortedDescendingHeaderStyle BackColor="#7E0000" />--%>
                                </asp:GridView>
                                
                                </div>
                            </asp:Panel>

                       <%-- <table class="table">
                            <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="thumbnail-img">
                                        <a href="#">
									<img class="img-fluid" src="images/img-pro-01.jpg" alt="" />
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									Lorem ipsum dolor sit amet
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="quantity-box"><input type="number" size="4" value="1" min="0" step="1" class="c-input-text qty text"></td>
                                    <td class="total-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="remove-pr">
                                        <a href="#">
									<i class="fas fa-times"></i>
								</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="thumbnail-img">
                                        <a href="#">
									<img class="img-fluid" src="images/img-pro-02.jpg" alt="" />
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									Lorem ipsum dolor sit amet
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 60.0</p>
                                    </td>
                                    <td class="quantity-box"><input type="number" size="4" value="1" min="0" step="1" class="c-input-text qty text"></td>
                                    <td class="total-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="remove-pr">
                                        <a href="#">
									<i class="fas fa-times"></i>
								</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="thumbnail-img">
                                        <a href="#">
									<img class="img-fluid" src="images/img-pro-03.jpg" alt="" />
								</a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									Lorem ipsum dolor sit amet
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 30.0</p>
                                    </td>
                                    <td class="quantity-box"><input type="number" size="4" value="1" min="0" step="1" class="c-input-text qty text"></td>
                                    <td class="total-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="remove-pr">
                                        <a href="#">
									<i class="fas fa-times"></i>
								</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>--%>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-6 col-sm-6">
                    <div class="coupon-box">
                        <div class="input-group input-group-sm">
                            <input class="form-control" placeholder="Enter your coupon code" aria-label="Coupon code" type="text">
                            <div class="input-group-append">
                                <button class="btn btn-theme" type="button">Apply Coupon</button>
                            </div>
                        </div>
                    </div>
                </div>
               <div class="col-lg-6 col-sm-6">
                    <div class="update-box">
                       
                               <asp:Button ID="lbtnUpadate" class="btn btn-theme" runat="server" Text="Update Cart" Visible="false" 
                                   onclick="lbtnUpadate_Click" />
                                    <asp:Button ID="btnBuyNew" class="btn btn-theme" runat="server" 
                                   Text="Buy New" onclick="btnBuyNew_Click" />
                           
                       
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-8 col-sm-12"></div>
                <div class="col-lg-4 col-sm-12">
                    <div class="order-box">
                        <h3>Order summary</h3>
                        <div class="d-flex">
                            <h4>Sub Total</h4>
                            <div class="ml-auto font-weight-bold"><asp:Label ID=lblSubTotal runat="server"></asp:Label></div>
                        </div>
                       <%-- <div class="d-flex">
                            <h4>Discount</h4>
                            <div class="ml-auto font-weight-bold"> <asp:Label ID=lblDiscount runat="server"></asp:Label></div>
                        </div>
                        <hr class="my-1">
                        <div class="d-flex">
                            <h4>Coupon Discount</h4>
                            <div class="ml-auto font-weight-bold"> <asp:Label ID=lblCouponDiscount runat="server"></asp:Label> </div>
                        </div>--%>
                        <div class="d-flex">
                            <h4>Quantity</h4>
                            <div class="ml-auto font-weight-bold"><asp:Label ID=lblQuantity runat="server"></asp:Label></div>
                        </div>
                        <div class="d-flex">
                            <h4>Shipping Cost</h4>
                            <div class="ml-auto font-weight-bold"><asp:Label ID=lblShoppingCost runat="server"></asp:Label> </div>
                        </div>
                        <hr>
                        <div class="d-flex gr-total">
                            <h5>Grand Total</h5>
                            <div class="ml-auto h5"> <asp:Label ID=lblGrandTotal runat="server"></asp:Label> </div>
                        </div>
                        <hr> </div>
                </div>
                <%--<div class="col-12 d-flex shopping-box"><a href="checkout.html" class="ml-auto btn hvr-hover">Checkout</a> </div>]--%>
                <div class="col-12 d-flex shopping-box"><asp:LinkButton ID=lbtnCheckOut 
                        class="ml-auto btn hvr-hover" runat="server" onclick="lbtnCheckOut_Click" >Checkout</asp:LinkButton></div>]
            </div>

        </div>
    </div>
    <!-- End Cart -->
</asp:Content>
