<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditAddress.aspx.cs" Inherits="OnlineClothing.EditAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="cart-box-main">
        <div class="container col-lg-4">
        <div class="row">
         <%--<div class="col-sm-6 col-lg-6 mb-3">--%>
                   
                    <div class="checkout-address card-footer">
                        <div class="title-left">
                            <h3>Billing address</h3>
                        </div>
                        <form class="needs-validation" style="text-align:center;" novalidate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="firstName">First name *</label>
                                    <asp:TextBox ID=txtFName class="form-control" runat="server"></asp:TextBox> 
                                    <div class="invalid-feedback"> Valid first name is required. </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName">Last name *</label>
                                    <asp:TextBox ID=txtLName class="form-control" runat="server"></asp:TextBox> 
                                    <div class="invalid-feedback"> Valid last name is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="username">Mobile Number *</label>
                                <div class="input-group">
                                   <asp:TextBox ID=txtMobileNo class="form-control" runat="server"></asp:TextBox> 
                                    <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="address2">Alternate Mobile Number *</label>
                                <asp:TextBox ID=txtALTMobile class="form-control" runat="server"></asp:TextBox> 
                                </div>
                            <div class="mb-3">
                                <label for="email">Email Address *</label>
                                <asp:TextBox ID=txtEMail class="form-control" runat="server"></asp:TextBox> 
                                <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                            </div>
                            <div class="mb-3">
                                <label for="address">Address *</label>
                                <asp:TextBox ID=txtAddress class="form-control" runat="server"></asp:TextBox> 
                                <div class="invalid-feedback"> Please enter your shipping address. </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="state">State *</label>
                                    <%-- <asp:DropDownList ID="ddlState" class="form-control" runat="server" 
                                        onselectedindexchanged="ddlState_SelectedIndexChanged1" AutoPostBack="true"></asp:DropDownList>--%>
                                        <asp:DropDownList ID="ddlState" class="form-control" runat="server" 
                                        AutoPostBack="true" onselectedindexchanged="ddlState_SelectedIndexChanged1"
                                       ></asp:DropDownList><%-- AutoPostBack="true"--%> 
                                        <%-- AutoPostBack="true"--%>
                                    <div class="invalid-feedback"> Please provide a valid state. </div>
                                </div>
                                <div class="col-md-5 mb-3">
                                    <label for="country">City *</label>
                                    <asp:DropDownList ID="ddlCity" class="form-control" runat="server"></asp:DropDownList>
                                    <div class="invalid-feedback"> Please select a valid City. </div>
                                </div>
                                
                                <div class="col-md-3 mb-3">
                                    <label for="zip">Zip *</label>
                                     <asp:TextBox ID=txtZip class="form-control" runat="server"></asp:TextBox> 
                                    <div class="invalid-feedback"> Zip code required. </div>
                                </div>
                            </div>
                           
                           <div >
                           <%--<asp:Button ID="btnUpdateAddress" class="btn hvr-hover" runat="server" 
                                 Text="Update Address" onclick="btnUpdateAddress_Click"
                                 />--%>

                                 <asp:LinkButton ID="lbtnUpdateAddress" class="btn hvr-hover" runat="server" 
                                   onclick="lbtnUpdateAddress_Click">Update Address</asp:LinkButton>
                           </div>
                            
                                 



                            </form>
                    </div>
              <%--  </div>--%>
        
        </div>
        </div>
        </div>
</asp:Content>
