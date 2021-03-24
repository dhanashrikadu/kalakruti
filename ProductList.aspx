<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="OnlineClothing.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container categories-shop">
 <div class="row special-list">
               
                  <asp:DataList ID="dlMyKirana" runat="server"  BackColor="White" CellPadding="2" 
                                CellSpacing="2" Font-Bold="True" ForeColor="#fef9e7" HorizontalAlign="Center"  
                                RepeatDirection="Horizontal"><%-->CssClass="row"--%>
                                <ItemTemplate>
                                 <div class="col-lg-3 col-md-6 special-grid best-seller">
                                 <div class="products-single fix">
                                    <div class="box-img-hover">
                                        <div class="type-lb">
                                            <p class="sale">New</p>
                                        </div>
                                      
                                      <asp:ImageButton ID="imgitem" ImageUrl='<%# Eval("Image") %>'  runat="server"  Height="300" 
                                      ToolTip='<%# Eval("ProductId")%>' ></asp:ImageButton>   
                                           <%--    Width="300px"   --%>                      
                                      <%--<asp:Label ID=lblProductId runat="server" Text='<%# Eval("ProductId")%>' Visible=false></asp:Label>--%>
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <%--<a class="cart" href="#">Add to Cart</a>--%>
                                <asp:LinkButton ID="LKAddtoCart" class="cart" runat="server" 
                                ToolTip='<%# Eval("ItemId")%>' onclick="LKAddtoCart_Click">Add to Cart</asp:LinkButton>
                               
                            </div>
                          </div>
                        <div class="why-text" style="height:100px">
                             <h4>
                              <asp:Label runat="server" ID="Label1" Font-Size="16px" ForeColor=#333333 Style="font-family:Calibri"
                               Font-Bold="true" Text='<%#Eval("MRP")%>'>
                              </asp:Label><br>
                              <asp:Label runat="server" ID="lblProdDetail" Font-Size="16px" ForeColor=#333333 Style="font-family:Calibri"
                               Font-Bold="true" Text='<%# Eval("BrandName")%>'>
                              </asp:Label>
                             </h4>
                        </div>
                        </div>
                        </div>
                        </ItemTemplate>
                            </asp:DataList>
                             
                    </div>
                    </div>
</asp:Content>
