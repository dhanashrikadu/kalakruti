<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="OnlineClothing.Grocer.OrderList" %>
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
            <table class ="table table-bordered table-hover">
            <asp:Panel ID="serchbar" runat="server">
  
           <tr>
                    <td bgcolor="#f2f2f2">
                        <div class="col-lg-6" align="left">
                            <asp:Label ID="Label3" runat="server" Text="Order List :" Font-Bold="true"
                                Font-Size="Large"> </asp:Label>
                        </div>
                    </td>
                </tr>
  
          </asp:Panel> 


               <tr>
            <td>
                <div class="col-lg-16" align="center">
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" >
                        <asp:GridView ID="gvorders" runat="server" CssClass="table table-bordered"
                            AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#CC9966"
                            BorderStyle="None" BorderWidth="1px" CellPadding="10">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                       <%-- <asp:Label ID="lblGrocerId" runat="server" Visible="false" Text='<%# Bind("GrocerId") %>'></asp:Label>--%>
                                        <asp:Label ID="lblCustID" runat="server" Visible="false" Text='<%# Bind("CustId") %>'></asp:Label>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Confirm Order Id">
                                    <ItemTemplate>
                                      <%--  <asp:Label ID="lblCustOdrID" runat="server" Text='<%# Bind("ConfirmOdrID") %>'></asp:Label>--%>
                                        <asp:Label ID="lblConfirmorderId" runat="server" Text='<%# Bind("ConfirmOdrID")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                        <%--<asp:Label ID="lblcustnm" runat="server" Text='<%# Bind("CustFullName") %>'></asp:Label>--%>
                                        <asp:Label ID="lblcustnm" runat="server" Text='<%# Bind("name")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddr" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Mobile No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lblmob" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Email-ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEm" runat="server" Text='<%# Bind("EmailId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="" HorizontalAlign="Center" />
                                </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="Order Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDeliDt" runat="server" Text='<%# Bind("Delivery_Date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Total Price">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTprice" runat="server" Text='<%# Bind("Toatal_price") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                     <%--<asp:Button ID="btnAccept" runat="server" Text="Accept" Height="28px" Width="60px" CssClass="btn1 btn-success" OnClick="btnAccept_click"/>--%>
                                        <asp:Button ID="btnShowDetail" runat="server" Text="Show Detail" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnShowDetail_click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                              
                            </Columns>
                             <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                        </asp:GridView>
                        <asp:Label ID="lblStatus" runat="server" Text="Completed" Visible="false" ></asp:Label>
                    </asp:Panel>
                </div>
            </td>
        </tr>
        <tr>
        <td>
        
                     <div class ="col-lg-16" align="center">
                  <asp:Panel ID="PanelDetail" runat="server" ScrollBars="Both" Visible="false" >
                       <div class="table-responsive">         
                        <asp:GridView ID="gvDetail" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" 
                          Width="100%" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                          CellPadding="10">
                          <Columns>
                                        <%-- <asp:TemplateField>
                                              <HeaderTemplate>
                                            Select All
                                            <asp:CheckBox ID="Chk1" runat="server"   onclick="CheckAllStud2(this)"   />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                               <asp:CheckBox ID="Check" runat="server"   />
                                             </ItemTemplate>
                                              <ItemStyle Width="10%" />
                                            </asp:TemplateField>--%>

                                      <asp:TemplateField HeaderText="Sr.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                   <%-- <asp:Label ID="lblGrocerId" runat="server" Visible="false" Text='<%# Bind("GrocerId") %>'></asp:Label>--%>
                                                    <asp:Label ID="lblCustID" runat="server" Visible="false" Text='<%# Bind("CustomerId") %>'></asp:Label>
                                                     <asp:Label ID="lblcartId" runat="server" Visible="false" Text='<%# Bind("cartID") %>'></asp:Label>
                                                      <asp:Label ID="lblItemId" runat="server" Visible="false" Text='<%# Bind("ItemId") %>'></asp:Label>
                                       
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Confirm Order Id">
                                                <ItemTemplate>
                                     
                                                    <asp:Label ID="lblConfirmorderId" runat="server" Text='<%# Bind("CustmerOdrId")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                       
                                                    <asp:Image ID="Image1" runat="server" Height="50px" Width="50px" ImageUrl='<%# Eval("Image") %>'  />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BrandName">
                                                <ItemTemplate>
                                      
                                                    <asp:Label ID="lblcustnm" runat="server" Text='<%# Bind("BrandName")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGrocerRate" runat="server" Text='<%# Bind("GrocerRateID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmob" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Size">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEm" runat="server" Text='<%# Bind("Size") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                           
                        
                          </Columns>
                           <HeaderStyle CssClass="bg-red bg-darken-2 " ForeColor="White" HorizontalAlign="Center" />


                      </asp:GridView>
                      </div> 


                       <div class="col-lg-16  pull-right" style="text-align:right;">
                             <asp:Button ID="btnBack" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"  runat="server" Text="Back" OnClick="btnBack_Click" />
                             <%-- <asp:Button ID="btnDone" runat="server" Text="Done"
                             CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="btnDone_click" />--%>
                      </div>
        
                  </asp:Panel>
     

              </div></td>
        </tr>
        </table>
          </div>
         </div>
         </div>
         </div>

</asp:Content>
