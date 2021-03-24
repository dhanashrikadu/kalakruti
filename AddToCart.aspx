<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="OnlineClothing.AddToCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">     var addthis_config = { "data_track_addressbar": true };</script>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-518a46984fa73489"
        temp_src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-518a46984fa73489"></script>
    <script type="text/javascript">
        function changeQuantity(control, id, action) {
            var lblQuantity = document.getElementById(control.id.replace(id, "QtyCount"));

            // var lblhiddenQuantity = document.getElementById(control.id.replace(id, "hiddenQtyCount"));
            var quantity = lblQuantity.innerHTML;
            // var quantity = lblhiddenQuantity.innerHTML;
            if (action == "plus") {

                lblQuantity.innerHTML = parseInt(quantity, 10) + 1;
                // lblhiddenQuantity.innerHTML = parseInt(quantity, 10) + 1;
                // lblhiddenQuantity.innerHTML = lblQuantity.innerHTML;
            }
            if (action == "minus") {
                lblQuantity.innerHTML = parseInt(quantity, 10) - 1;
            }
        }
    </script>
    
<script type="text/javascript">
    function ShowCurrentTime(control, id) {
        var lblnewQuantity = document.getElementById('<%=txtcount.ClientID%>').Value;
        var lblgrateid = document.getElementById(control.id.replace(id, "hdnGRateId")).value;
        var lblitemid = document.getElementById(control.id.replace(id, "hdnlblGID")).value;
        console.log("hdn1", document.getElementById("lblCartValue").textContent);
        document.getElementById("lblCartValue").textContent = parseInt(document.getElementById("lblCartValue").textContent) + 1;
      
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            
         
      

  
    <!-- Start Shop Detail  -->
    <div class="shop-detail-box-main">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                          <asp:Image ID="Image1" runat="server" class="d-block w-100 img-fluid" ImageUrl='<%# Eval("Image") %>' />
                           
                        </div>
                       <%-- <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev"> 
						<i class="fa fa-angle-left" aria-hidden="true"></i>
						<span class="sr-only">Previous</span> 
					</a>
                        <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next"> 
						<i class="fa fa-angle-right" aria-hidden="true"></i> 
						<span class="sr-only">Next</span> 
					</a>
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                <img class="d-block w-100 img-fluid" src="images/smp-img-01.jpg" alt="" />
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="1">
                                <img class="d-block w-100 img-fluid" src="images/smp-img-02.jpg" alt="" />
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="2">
                                <img class="d-block w-100 img-fluid" src="images/smp-img-03.jpg" alt="" />
                            </li>
                        </ol>--%>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                    
                    <h2>
                    <asp:Label ID="lblItemName" runat="server"></asp:Label>
                    <asp:Label ID="lblgrocerid" Visible="false" runat="server"></asp:Label>
                    </h2>
                        <%--<h2>Fachion Lorem ipsum dolor sit amet</h2>--%>
                        <h5><span>Price ₹</span> <del><asp:Label ID="lblMRP" runat="server"></asp:Label></del>
                        </h5>
                        <h2><span>Price ₹</span> <asp:Label ID="lblOfferate" runat="server"></asp:Label></h2>
                        <h2><span>Description : </span></h2><p></panel><asp:Label ID="lblDescription" runat="server"></asp:Label></p>
                         <asp:HiddenField runat="server" ID="hdnGRateId" ></asp:HiddenField>
                          <asp:HiddenField runat="server" ID="hdnlblGID" ></asp:HiddenField>
                       <%-- <p class="available-stock"><span> More than 20 available / <a href="#">8 sold </a></span>
                            <p>
                                <h4>Short Description:</h4>
                                <p>Nam sagittis a augue eget scelerisque. Nullam lacinia consectetur sagittis. Nam sed neque id eros fermentum dignissim quis at tortor. Nullam ultricies urna quis sem sagittis pharetra. Nam erat turpis, cursus in ipsum at,
                                    tempor imperdiet metus. In interdum id nulla tristique accumsan. Ut semper in quam nec pretium. Donec egestas finibus suscipit. Curabitur tincidunt convallis arcu. </p>--%>  
                              <ul>
                                    <li>
                                        <div class="form-group size-st ">
                                            <label class="size-label">Size</label>
                                             <asp:DropDownList ID="ddlSize" runat="server"  class="form-control quantity-box" ValidationGroup="AddToCart">
                                              <asp:ListItem Text="--- Select ----" Value="0"></asp:ListItem>
                                              <asp:ListItem Text="S" Value="1"></asp:ListItem>
                                             <asp:ListItem Text="M" Value="2"></asp:ListItem>
                                              <asp:ListItem Text="L" Value="3"></asp:ListItem>
                                               <asp:ListItem Text="XL" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="XXL" Value="5"></asp:ListItem>
                                                  <asp:ListItem Text="Free Size" Value="6"></asp:ListItem>                                            
                                            </asp:DropDownList>

                                            <asp:CompareValidator ControlToValidate="ddlSize" ID="CompareValidator1" SetFocusOnError="true"
                                            ValidationGroup="AddToCart" CssClass="errormesg" ErrorMessage="Please select a Size"
                                            runat="server" Display="Dynamic"  ForeColor="Red"
                                            Operator="NotEqual" ValueToCompare="0" Type="Integer" />
                                          

                                        
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form-group quantity-box">
                                            <label class="control-label">Quantity</label>
                                            <%--<input id="lblCountQuantity" class="form-control" value="0" min="0" max="20" type="number">--%>
                                            <asp:TextBox ID="txtcount" runat="server"  ValidationGroup="AddToCart" class="form-control" value="1" min="1" max="2" TextMode="Number"></asp:TextBox> 

                                            <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtcount"  ForeColor="Red"
                                           ValidationGroup="AddToCart" SetFocusOnError="True" ErrorMessage="Please Set the Quantity."></asp:RequiredFieldValidator>

                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Maximum Limit is 2"  ValidationGroup="AddToCart" 
                                            ControlToValidate="txtcount" ForeColor="Red" MaximumValue="2" MinimumValue="1"></asp:RangeValidator>
                                         
                                            
                                        </div>
                                    </li>
                                </ul>

                                <div class="price-box-bar">
                                    <div class="cart-and-bay-btn">
                                        <asp:LinkButton class="btn hvr-hover" data-fancybox-close="" ID="lbtnBuyNew" 
                                            runat="server" onclick="lbtnBuyNew_Click"  >Buy New</asp:LinkButton> 
                                       <%-- <a class="btn hvr-hover" data-fancybox-close="" href="#">Buy New</a>  onclick="lbtnAddTOCart_Click"--%>
                                      

                                          <%--<img id="Img1" runat="server" enableviewstate="false" onclick="javascript:ShowCurrentTime(this,'Img1')"  style="height:40px; width:120px; " src="../Images/Icons/images.jpg">--%>
                                       <asp:LinkButton ID="lbtnAddTOCart" runat="server" CssClass="btn hvr-hover" OnClick="lbtnAddTOCart_Click"  Text="Add To Cart" 
                                        ValidationGroup="AddToCart" ></asp:LinkButton> 
                                        <%--OnClientClick="ShowCurrentTime(this,'lbtnAddTOCart')"--%>
                                        <%--EnableViewState="false" --%>
                                       <%-- <asp:LinkButton class="btn hvr-hover" data-fancybox-close="" ID="lbtnBuyNow" 
                                            runat="server" onclick="lbtnBuyNow_Click1" >Buy Now</asp:LinkButton> --%>
                                       <%-- <a class="btn hvr-hover" data-fancybox-close="" href="#">Add to cart</a>--%>
                                    </div>
                                </div>

                                <div class="add-to-btn">
                                   <%-- <div class="add-comp">
                                        <a class="btn hvr-hover" href="#"><i class="fas fa-heart"></i> Add to wishlist</a>
                                        <a class="btn hvr-hover" href="#"><i class="fas fa-sync-alt"></i> Add to Compare</a>
                                    </div>--%>
                                    <div class="share-bar">
                                        <a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                                        <a class="btn hvr-hover" href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a>
                                        <a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                                        <a class="btn hvr-hover" href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a>
                                        <a class="btn hvr-hover" href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                    </div>
                </div>
            </div>

         

        </div>
    </div>
    <!-- End Cart -->

   

    </div>

   

</asp:Content>
