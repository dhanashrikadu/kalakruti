<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineClothing.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <!-- Start Slider -->
 
 <%--     
    <div id="slides-shop" class="cover-slides">
           <ul class="slides-container">
      <asp:DataList ID="dlBanner" runat="server">
          <ItemTemplate> 
               <asp:Image ID="imgbanner" runat="server" ImageUrl='<%# Eval("HeaderImage") %>'/>  
            </ItemTemplate>
       </asp:DataList>
   </ul>
  </div>
               <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
            </div>--%>
         
    <div id="slides-shop" class="cover-slides">
           <ul class="slides-container">
          
      <asp:Repeater ID="RBanner" runat="server">
          <ItemTemplate> 
         
               <asp:Image ID="imgbanner" runat="server" ImageUrl='<%# Eval("HeaderImage") %>'/>  
             
            </ItemTemplate>
            
       </asp:Repeater>
       
   </ul>
  </div>
               <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
            </div>
 
  <%-- <ul class="slides-container">
  <asp:AdRotator ID="AdRotator1" runat="server"  AdvertisementFile="~/myAds.xml"/>
  </ul>--%>
  <!-- End Slider -->

    <!-- Start Slider -->
  <%--  <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-left">
                <img src="images/Banner_8.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                           
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/banner_9.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-right">
                <img src="images/banner_10.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                           
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>--%>
    <!-- End Slider -->

     <!-- Start Categories  -->
    <div class="categories-shop" style="padding-bottom:0px;">
        <div class="container">
         
           <%--  <asp:DataList ID="dtlProduct" runat="server"  HorizontalAlign="Center" RepeatDirection="Horizontal" Font-Bold="True" >
             <ItemTemplate>
              
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                 <div class="products-single fix">
                    <div class="shop-cat-box">
                     <asp:ImageButton ID="imgitem" class="img-fluid" ImageUrl='<%# Eval("Image")%>' ToolTip='<%# Eval("ProductId")%>' Height="300px" Width="500px" runat="server" />
                     </div>
                        <img class="img-fluid" src="images/t-shirts-img.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">T-shirts</a>
                       <div class="shop-cat-box">
                        <asp:Label ID="ProductName" class="btn hvr-hover" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </div>
                    </div>
                     </div>
                
             </ItemTemplate>


             </asp:DataList>--%>


              <div class="row special-list">
               
                  <asp:DataList ID="dtlProduct" runat="server"  BackColor="White" CellPadding="2"
                                CellSpacing="2" Font-Bold="True" ForeColor="#fef9e7" HorizontalAlign="Center"  
                                RepeatDirection="Horizontal"><%-->CssClass="row"--%>
                                <ItemTemplate>
                                 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 special-grid best-seller">
                                 <div class="products-single fix">
                                    <div class="shop-cat-box">
                                       
                                      <asp:ImageButton ID="imgitem" ImageUrl='<%# Eval("Image") %>'  runat="server"  
                                        Height="300" ToolTip='<%# Eval("ProductId")%>' 
                                        onclick="imgitem_Click" ></asp:ImageButton>
                                      
                                           <%--    Width="300px"   --%>   
                                                         
                                   <h2 style="padding-bottom:0px;">
                                   <asp:Label runat="server" ID="lblProdDetail" Font-Size="20px" ForeColor="White" Style="font-family:Calibri; width:100%;" class="btn hvr-hover"
                               Font-Bold="true" Text='<%# Eval("ProductName")%>'>
                              </asp:Label>
                             </h2>
                             
                           
                          </div>
                        
                        </div>
                        </div>
                        </ItemTemplate>
                            </asp:DataList>
                    </div>
              
           
       </div>
    </div>
       
      
    <!-- End Categories -->



  <%--  <!-- Start Categories  -->
    <div class="categories-shop">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/t-shirts-img.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">T-shirts</a>
                    </div>
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/shirt-img.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Shirt</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/wallet-img.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Wallet</a>
                    </div>
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/women-bag-img.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Bags</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/shoes-img.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Shoes</a>
                    </div>
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/women-shoes-img.jpg" alt="" />
                        <a class="btn hvr-hover" href="#">Women Shoes</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Categories -->--%>

      <!-- Start Products  -->
    <div class="products-box"  style="padding-top:0px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Featured Products</h1>
                       <%-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>--%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button class="active" data-filter="*">All</button>
                            <button data-filter=".top-featured">Top featured</button>
                            <button data-filter=".best-seller">Best seller</button>
                        </div>
                    </div>
                </div>
            </div>
          <%-------------------------------------------- Experiment Start--%>
             <div class="row special-list">
               
                  <asp:DataList ID="dlMyKirana" runat="server"  BackColor="White" CellPadding="2"
                                CellSpacing="2" Font-Bold="True" ForeColor="#fef9e7" HorizontalAlign="Center"  
                                RepeatDirection="Horizontal"><%-->CssClass="row"--%>
                                <ItemTemplate>
                                 <div class="col-lg-3 col-md-6 special-grid best-seller">
                                 <div class="products-single fix" >
                                    <div class="box-img-hover">
                                        <div class="type-lb">
                                            <p class="sale">Sale</p>
                                        </div>
                                      
                                      <asp:ImageButton ID="imgitem" ImageUrl='<%# Eval("Image") %>'  runat="server"  Height="300" Width="250"
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
                                 <asp:LinkButton ID="LKAddtoCart" class="cart" runat="server" ToolTip='<%# Eval("ItemId")%>'
                                        onclick="LKAddtoCart_Click2" >Add to Cart</asp:LinkButton>
                               
                            </div>
                          </div>
                        <div class="why-text" style="height:100px">
                             <h4>
                             <asp:Label ID="lblgrocer" runat="server" Visible="false"  Text='<%#Eval("GrocerId")%>' ></asp:Label>
                             <span>₹ </span>
                              <asp:Label runat="server" ID="Label1" Font-Size="16px" ForeColor=#333333 Style="font-family:Calibri"
                               Font-Bold="true" Text='<%#Eval("OfferRate")%>'>
                              </asp:Label><br>
                              <asp:Label runat="server" ID="lblProdDetail" Font-Size="16px" ForeColor=#333333 Style="font-family:Calibri"
                               Font-Bold="true" Text='<%# Eval("SubCatName")%>'>
                              </asp:Label>
                             </h4>
                        </div>
                        </div>
                        </div>
                        </ItemTemplate>
                            </asp:DataList>
                    </div>
               
           
           <%-- <div class="row special-list">
                <div class="col-lg-3 col-md-6 special-grid best-seller">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="images/img-pro-01.jpg" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="#">Add to Cart</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $7.79</h5>
                        </div>
                    </div>
                </div>
--%>
              <%--  <div class="col-lg-3 col-md-6 special-grid top-featured">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="new">New</p>
                            </div>
                            <img src="images/img-pro-02.jpg" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="#">Add to Cart</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $9.79</h5>
                        </div>
                    </div>
                </div>--%>

              <%--  <div class="col-lg-3 col-md-6 special-grid top-featured">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="images/img-pro-03.jpg" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="#">Add to Cart</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $10.79</h5>
                        </div>
                    </div>
                </div>--%>

               <%-- <div class="col-lg-3 col-md-6 special-grid best-seller">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <div class="type-lb">
                                <p class="sale">Sale</p>
                            </div>
                            <img src="images/img-pro-04.jpg" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="#">Add to Cart</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>Lorem ipsum dolor sit amet</h4>
                            <h5> $15.79</h5>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
    <!-- End Products  -->


</asp:Content>

