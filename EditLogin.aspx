<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditLogin.aspx.cs" Inherits="OnlineClothing.EditLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="about-box-main">
<div class="container col-sm-6 col-lg-4 mb-3">
<div class="row">

 
 <%--<div class="col-md-1">
 <img src="images/login.jpg" alt="" />
 </div>--%>
        <div class="checkout-address card-footer">
                    <div class="title-left">
                        <h3>Account Login</h3>
                    </div>

                   <%-- <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Click here to Login</a></h5>--%>
                 
                    <%--<h5><asp:LinkButton ID="LinkButton2" href="#formLogin" runat="server" data-toggle="collapse" aria-expanded="false">Click here to Login</asp:LinkButton></h5>--%>
                   
                    <form class="mt-3 collapse review-form-box" id="formLogin">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">User Name</label>
                                <%--<input type="email" class="form-control" id="InputEmail" placeholder="Enter Email"> </div>--%>
                                <asp:TextBox ID=txtLoginUserName class="form-control" runat="server"></asp:TextBox> 
                                </div>
                          
                            <div class="form-group col-md-6">
                                <label for="InputPassword" class="mb-0">Password</label>
                                <%--<input type="password" class="form-control" id="InputPassword" placeholder="Password">--%> 
                                 <asp:TextBox ID=txtLoginPassword class="form-control" runat="server" TextMode="Password"></asp:TextBox> 
                                </div>
                        </div>
                       <%-- <button type="submit" class="btn hvr-hover">Login</button>--%>
                        <asp:Button Id="btnLogin" runat="server" class="btn hvr-hover" ForeColor="White" Text="Update" onclick="btnLogin_Click"/>
                         
                </div>
   </div>
 </div>

  </div>
</asp:Content>
