<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="OnlineClothing.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


  <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">

          
            <div class="row">
          
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="checkout-address">
                        <div class="title-left">
                            <h3>Billing address</h3>
                        </div>
                        <%--<form class="needs-validation" novalidate>--%>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">First name *</label>
                                    <asp:TextBox ID=txtFName class="form-control" runat="server"></asp:TextBox> 
                                     <asp:RequiredFieldValidator ID="requiredfieldvalidator5" runat="server" ControlToValidate="txtFName"  ForeColor="Red" 
                                  ValidationGroup="Address" SetFocusOnError="True" ErrorMessage="Please Enter First Name."></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Last name *</label>
                                    <asp:TextBox ID=txtLName class="form-control" runat="server"></asp:TextBox> 
                                    <asp:RequiredFieldValidator ID="requiredfieldvalidator6" runat="server" ControlToValidate="txtLName"  ForeColor="Red"
                                     ValidationGroup="Address" SetFocusOnError="True" ErrorMessage="Please Enter Last Name."></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="username">Mobile Number *</label>
                                
                                   <asp:TextBox ID=txtMobileNo class="form-control" runat="server" 
                                    TextMode="Number" MaxLength="10"></asp:TextBox> 
                                    <asp:RequiredFieldValidator ID="requiredfieldvalidator7" runat="server" ControlToValidate="txtMobileNo"  ForeColor="Red"
                                     ValidationGroup="Address" SetFocusOnError="True" ErrorMessage="Please Enter Mobile Number."></asp:RequiredFieldValidator>
                              
                            </div>
                            <div class="mb-3">
                                <label for="address2">Alternate Mobile Number *</label>
                                <asp:TextBox ID=txtALTMobile class="form-control" runat="server" MaxLength="10" 
                                    TextMode="Number"></asp:TextBox> 
                                
                                </div>
                            <div class="mb-3">
                                <label for="email">Email Address *</label>
                                <asp:TextBox ID=txtEMail class="form-control" runat="server"></asp:TextBox> 
                                
                                 <asp:RequiredFieldValidator ID="requiredfieldvalidator10" runat="server" ControlToValidate="txtEMail"  ForeColor="Red"
                                     ValidationGroup="Address" SetFocusOnError="True" ErrorMessage="Please Enter Email Address."></asp:RequiredFieldValidator>
                            </div>
                            <div class="mb-3">
                                <label for="address">Address *</label>
                                <asp:TextBox ID=txtAddress class="form-control" runat="server"></asp:TextBox> 
                                 <asp:RequiredFieldValidator ID="requiredfieldvalidator8" runat="server" ControlToValidate="txtAddress"  ForeColor="Red"
                                     ValidationGroup="Address" SetFocusOnError="True" ErrorMessage="Please Enter Address."></asp:RequiredFieldValidator>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="state">State *</label>
                                    <%-- <asp:DropDownList ID="ddlState" class="form-control" runat="server" 
                                        onselectedindexchanged="ddlState_SelectedIndexChanged1" AutoPostBack="true"></asp:DropDownList>--%>
                                        <asp:DropDownList ID="ddlState" class="form-control" runat="server"
                                         AutoPostBack="true" 
                                        onselectedindexchanged="ddlState_SelectedIndexChanged"></asp:DropDownList> 
                                    <asp:CompareValidator ControlToValidate="ddlState" ID="CompareValidator1" SetFocusOnError="true"
                                            ValidationGroup="Address" CssClass="errormesg" ErrorMessage="Please select a State"
                                            runat="server" Display="Dynamic"  ForeColor="Red"
                                            Operator="NotEqual" ValueToCompare="0" Type="Integer" />
                                </div>
                                <div class="col-md-5 mb-3">
                                    <label for="country">City *</label>
                                    <asp:DropDownList ID="ddlCity" class="form-control" runat="server"></asp:DropDownList>
                                    <asp:CompareValidator ControlToValidate="ddlCity" ID="CompareValidator2" SetFocusOnError="true"
                                            ValidationGroup="Address" CssClass="errormesg" ErrorMessage="Please select a City"
                                            runat="server" Display="Dynamic"  ForeColor="Red"
                                            Operator="NotEqual" ValueToCompare="0" Type="Integer" />
                                </div>
                                
                                <div class="col-md-3 mb-3">
                                    <label for="zip">Zip *</label>
                                     <asp:TextBox ID=txtZip class="form-control" runat="server"></asp:TextBox> 
                                     <asp:RequiredFieldValidator ID="requiredfieldvalidator9" runat="server" ControlToValidate="txtZip"  ForeColor="Red"
                                     ValidationGroup="Address" SetFocusOnError="True" ErrorMessage="Please Enter Zip Code."></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            
                            <%--<hr class="mb-4">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="same-address">
                                <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="save-info">
                                <label class="custom-control-label" for="save-info">Save this information for next time</label>
                            </div>
                            <hr class="mb-4">--%>
                            <div class="title"> <span>Payment</span> </div>
                            <div class="d-block my-3">
                              <%-- <div class="custom-control custom-radio">
                                   <asp:RadioButton ID="rbtPayment" runat="server" Text="Credit card" GroupName="PaymentMode"/>
                                    <asp:RadioButton ID="rbt" runat="server" Text="Credit card" GroupName="PaymentMode"/>
                                     <asp:RadioButton ID="RadioButton2" runat="server" Text="Credit card" GroupName="PaymentMode"/>
                                      <asp:RadioButton ID="RadioButton3" runat="server" Text="Credit card" GroupName="PaymentMode"/>
                                   
                                  
                                   
                                   
                                    <label class="custom-control-label" for="credit">Credit card</label>
                                </div>--%>



                                <%------------------------online payment----------------------------------%>
                                <div class="custom-control custom-radio">
                                    <%--<input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>--%>
                                    
                                    <label class="custom-control-label" for="credit">Credit card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" >
                                    <label class="custom-control-label" for="debit">Debit card</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" >
                                    <label class="custom-control-label" for="paypal">Paypal</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="cc-name">Name on card</label>
                                    <asp:TextBox ID="txtNameOnCard" runat="server" class="form-control" ></asp:TextBox><small class="text-muted">Full name as displayed on card</small>
                                    <%--<input type="text" class="form-control" id="cc-name" placeholder="" required> <small class="text-muted">Full name as displayed on card</small>--%>
                                    <div class="invalid-feedback"> Name on card is required </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="cc-number">Credit Card number</label>
                                     <asp:TextBox ID="txtCreDitCardNumber" runat="server" class="form-control" ></asp:TextBox>
                                   <%-- <input type="text" class="form-control" id="cc-number" placeholder="" required>--%>
                                    <div class="invalid-feedback"> Credit card number is required </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">Expiration</label>
                                    <asp:TextBox ID="txtExperyDate" runat="server" class="form-control" ></asp:TextBox>
                                    <%--<input type="text" class="form-control" id="cc-expiration" placeholder="" required>--%>
                                    <div class="invalid-feedback"> Expiration date required </div>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="cc-expiration">CVV</label>
                                    <asp:TextBox ID="txtCVV" runat="server" class="form-control" ></asp:TextBox>
                                   <%-- <input type="text" class="form-control" id="cc-cvv" placeholder="" required>--%>
                                    <div class="invalid-feedback"> Security code required </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="payment-icon">
                                        <ul>
                                            <li><img class="img-fluid" src="images/payment-icon/1.png" alt=""></li>
                                            <li><img class="img-fluid" src="images/payment-icon/2.png" alt=""></li>
                                            <li><img class="img-fluid" src="images/payment-icon/3.png" alt=""></li>
                                            <li><img class="img-fluid" src="images/payment-icon/5.png" alt=""></li>
                                            <li><img class="img-fluid" src="images/payment-icon/7.png" alt=""></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <hr class="mb-1"> 

                            <%------------------------------------------------------end-------------------------%>
                            <%--</form>--%>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                               <%-- <div class="title-left">
                                    <h3>Shipping Method</h3>
                                </div>
                                --%>
                               <%-- <div class="mb-4">
                                 
                                        <asp:RadioButton ID=rbtStandardDelivery class="custom-control-label " runat=server Text="Standard Delivery" value="1" GroupName ="shippingOption" />
                                        <asp:Label ID=lblstanddelcharge class="float-right font-weight-bold" runat="server" >FREE</asp:Label>
                                        
                                       
                                         <div class="ml-4 mb-2 small">(7-10 business days)</div>
                                   
                                    
                                         <asp:RadioButton ID=rbtExpressDel class="custom-control-label " runat=server Text="Express Delivery" value="2" GroupName ="shippingOption" />
                                        <asp:Label ID=lblExpDelvCharge class="float-right font-weight-bold" runat="server" >₹ 40</asp:Label>
                                   
                                    <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                    
                                        <asp:RadioButton ID=rbtNextDayDeli class="custom-control-label " runat=server Text="Next Business day" value="3" GroupName ="shippingOption" />
                                        <asp:Label ID=lblNextDayShpiingChar class="float-right font-weight-bold" runat="server" >₹ 80</asp:Label>
                                     
                                </div>
                            --%>

                              <%--  <div class="row">
                                 <div class="mb-2">
                                         <asp:RadioButtonList ID="rbtDelivertype" runat = "server" 
                                             class="custom-control-label"
                                             onselectedindexchanged="rbtDelivertype_SelectedIndexChanged" AutoPostBack="true">
                                         </asp:RadioButtonList>
                                       
                                </div>
                                 <div class="mb-2">
                                         
                                         
                                       
                                         <div style="padding:10px; margin-left:15px"> 
                                        
                                         <asp:Label ID=lblstanddelcharge class="float-right font-weight-bold" runat="server" ></asp:Label>
                                         </div>
                                         <div style="padding:20px; margin-left:350px ">
                                         
                                        
                                          <asp:Label ID=lblExpDelvCharge class="float-right font-weight-bold" runat="server" ></asp:Label>
                                          </div>
                                          <div style="padding:20px; margin-left:350px ">
                                         
                                        <asp:Label class="float-right font-weight-bold " ID=lblNextDayShpiingChar runat="server" ></asp:Label>
                                     </div>
                                </div>
                                </div>--%>


                               <%-- <div class="mb-4">
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
                                        <label class="custom-control-label" for="shippingOption1">Standard Delivery</label> <span class="float-right font-weight-bold">FREE</span> </div>
                                    <div class="ml-4 mb-2 small">(3-7 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption2">Express Delivery</label> <span class="float-right font-weight-bold">$10.00</span> </div>
                                    <div class="ml-4 mb-2 small">(2-4 business days)</div>
                                    <div class="custom-control custom-radio">
                                        <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
                                        <label class="custom-control-label" for="shippingOption3">Next Business day</label> <span class="float-right font-weight-bold">$20.00</span> </div>
                                </div>--%>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12" >
                            <div >
                                <div class="title-left">
                                    <h3>Shopping cart</h3>
                                </div>
                                <div class="rounded p-2 bg-light">
                                 <div class="media mb-2 border-bottom">
                                 <div CssClass="table table-bordered" >
                                     <asp:GridView ID="GvCardDtl" runat="server" 
                                    GridLines="None" AutoGenerateColumns="False">

                                    <Columns>
                                      <%--  <asp:TemplateField class="media-body" HeaderText="Sr.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                <asp:Label ID="lblCartId" runat="server" Visible="false" Text='<%# Bind("cartID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField >   
                                            <ItemTemplate>
                                                <asp:Image ID="Image1"  runat="server" Height="70px" Width="70px" ImageUrl='<%# Eval("Image") %>'  /> 
                                              
                                                <asp:Label ID="lblItemID"  runat="server" Visible="false" Text='<%# Eval("ItemId") %>'></asp:Label>

                                               
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField>   
                                            <ItemTemplate>
                                             
                                                <asp:Label ID="lblBrandName"  runat="server" Width="200px" Text='<%# Eval("BrandName") %>'></asp:Label>
                                             
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        <asp:TemplateField >
                                            <ItemTemplate>
                                            <span class="mx-1">| ₹</span>
                                            <asp:Label ID="lblMRP" runat="server" Text='<%# Eval("OfferRate") %>'></asp:Label>
                                                <span class="mx-1 ">| Qty:</span>
                                                
                                              </ItemTemplate>
                                            <ItemStyle Width="" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                       
                                       
                                        <asp:TemplateField >
                                            <ItemTemplate>
                                                  <div >
                                                  <asp:Label ID="txtQunatity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                                  <span class="mx-1 ">|</span>
                                                   <asp:Label ID="lblSize"  runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                                                   <asp:Label ID="lblGrocerId"  runat="server" Visible="false" Text='<%# Eval("GrocerId") %>'></asp:Label>
                                               
                                                    <%--  <asp:TextBox ID="txtQunatity"  runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>--%>
                                            </div>
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                            <ItemTemplate>
                                            
                                            <div CssClass="table table-bordered" ></div>
                                            
                                            </ItemTemplate>
                                            </asp:TemplateField>
                                    
                                    </Columns>
                                    
                                </asp:GridView>
                                </div>

                                </div>

                                   <%-- <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $80.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $80.00</div>
                                        </div>
                                    </div>
                                    <div class="media mb-2 border-bottom">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $60.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $60.00</div>
                                        </div>
                                    </div>
                                    <div class="media mb-2">
                                        <div class="media-body"> <a href="detail.html"> Lorem ipsum dolor sit amet</a>
                                            <div class="small text-muted">Price: $40.00 <span class="mx-2">|</span> Qty: 1 <span class="mx-2">|</span> Subtotal: $40.00</div>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="odr-box">
                                <div class="title-left">
                                    <h3>Your order</h3>
                                </div>
                               
                                <div class="d-flex">
                                   <%-- <h4 class="font-weight-bold">Sub Total</h4>--%>
                                    <div class="font-weight-bold">Sub Total</div>
                                    <div class="ml-auto font-weight-bold"><div class="ml-auto font-weight-bold"><asp:Label ID=lblSubTotal runat="server"></asp:Label></div> </div>
                                </div>
                                 <div class="d-flex">
                                    <div class="font-weight-bold">Quantity</div>
                                    <div class="ml-auto font-weight-bold"><asp:Label ID=lblQuantity runat="server"></asp:Label></div>
                                </div>
                               
                                <div class="d-flex">
                                   <%-- <h4>Shipping Cost</h4>--%>
                                    <div class="font-weight-bold">Shipping Cost</div>
                                    <div class="ml-auto font-weight-bold"> <asp:Label ID=lblShoppingCost runat="server"></asp:Label></div>
                                </div>
                                <hr>
                                <div class="d-flex gr-total">
                                    <h5>Grand Total</h5>
                                    <div class="ml-auto h5"><asp:Label ID=lblGrandTotal runat="server"></asp:Label> </div>
                                </div>
                                <hr>
                                </div>
                        </div>
                       <%-- <div class="col-12 d-flex shopping-box"> <a href="checkout.html" class="ml-auto btn hvr-hover">Place Order</a> </div>--%>
                         <div class="col-12 d-flex shopping-box">
                         <%--<asp:LinkButton ID="lbtnPlaceOrder" 
                                 class="ml-auto btn hvr-hover" runat="server" onclick="lbtnPlaceOrder_Click">Place Order</asp:LinkButton>--%>
                                 <asp:Button ID=btnPlaceOrder class="ml-auto btn hvr-hover"  ForeColor="White" runat="server"  ValidationGroup="Address" Font-Bold="true"
                                 Text="Place Order" onclick="btnPlaceOrder_Click" />
                         </div>
                    </div>
                </div>

            </div>

        </div>
   
    <!-- End Cart -->

    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-01.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-02.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-03.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-04.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-06.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-07.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-08.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-09.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Instagram Feed  -->
</asp:Content>

