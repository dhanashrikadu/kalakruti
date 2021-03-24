<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="OnlineClothing.Registration" %>
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
                        <h3>Create New Account</h3>
                    </div>

                   <%-- <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Click here to Login</a></h5>--%>
                 
                   <%-- <h5><asp:LinkButton ID="LinkButton2" href="#formLogin" runat="server" data-toggle="collapse" aria-expanded="false">Click here to Login</asp:LinkButton></h5>--%>
                   
                    <asp:Panel runat = "server" ID ="PanelSAmple">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputName" class="mb-0">First Name</label>
                                <%--<input type="text" class="form-control" id="InputName" placeholder="First Name"> --%>
                                <asp:TextBox ID="txtRegFName" class="form-control" runat="server"></asp:TextBox> 
                                 <asp:RequiredFieldValidator ID="requiredfieldvalidator1" runat="server" ControlToValidate="txtRegFName"  ForeColor="Red" 
                                  ValidationGroup="Registr" SetFocusOnError="True" ErrorMessage="Please Enter First Name."></asp:RequiredFieldValidator>
                                
                                </div>
                            <div class="form-group col-md-6">
                                <label for="InputLastname" class="mb-0">Last Name</label>
                                <%--<input type="text" class="form-control" id="InputLastname" placeholder="Last Name">--%>
                                <asp:TextBox ID="txtRegLName" class="form-control" runat="server"></asp:TextBox> 
                                 <asp:RequiredFieldValidator ID="requiredfieldvalidator2" runat="server" ControlToValidate="txtRegLName"  ForeColor="Red"
                                                       ValidationGroup="Registr" SetFocusOnError="True" ErrorMessage="Please Enter Last Name."></asp:RequiredFieldValidator>
                                 </div>
                            <div class="form-group col-md-6">
                                <label for="InputEmail1" class="mb-0">Mobile Number</label>
                               <%-- <input type="email" class="form-control" id="InputEmail1" placeholder="Enter Email">--%>
                                <asp:TextBox ID="txtRegUserName" class="form-control" runat="server"></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator3" runat="server" ControlToValidate="txtRegUserName"  ForeColor="Red"
                                                       ValidationGroup="Registr" SetFocusOnError="True" ErrorMessage="Please Enter User Name."></asp:RequiredFieldValidator>
                                 </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword1" class="mb-0">Password</label>
                              <%--  <input type="password" class="form-control" id="InputPassword1" placeholder="Password">--%>
                                <asp:TextBox ID="txtRegPassword" TextMode="Password" class="form-control"  runat="server"></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="requiredfieldvalidator4" runat="server" ControlToValidate="txtRegPassword"  ForeColor="Red"
                                                       ValidationGroup="Registr" SetFocusOnError="True" ErrorMessage="Please Enter Password."></asp:RequiredFieldValidator>
                                 </div>
                        </div>
                      
                             <%--class="btn hvr-hover"--%>
                         


                           <asp:LinkButton ID="lbtnRegisterNew" runat = "server"  Text="Register" class="btn hvr-hover" ForeColor="White" ValidationGroup="Registr"
                             OnClick ="lbtnRegisterNew_Click"></asp:LinkButton>

                            

                               
                    <%--</form>--%>
                    </asp:Panel>
                            
                         
                </div>
                
   </div>
   </div>


    </div>
</asp:Content>
