<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="AcceptOrder.aspx.cs" Inherits="OnlineClothing.Grocer.AcceptOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <div class="app-content content container-fluid">
  <div class="content-wrapper">
   <div class="content-header row">
   </div>
   <div class="content-body"><!-- stats -->
     <div class="row">
      <table class="table table-bordered table-hover">
       <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
      <asp:Panel ID="serchbar" runat="server">
  <tr>
  <td bgcolor ="#f2f2f2">

   <div class="col-lg-6" align="left" >
                    <asp:Label ID="Label3" runat="server" Text="order Item List :" Font-Bold="true"
                        Font-Size="Large"> </asp:Label>
                </div>
  </td>
  
  </tr>
  <tr>
  <td>
  <div class ="col-lg-16" align="center">
  
  <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Width="100%">
                        <asp:GridView ID="gvAcceptordersList" runat="server" CssClass="table table-bordered" Font-Size="Medium"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966"
                            BorderStyle="None" BorderWidth="1px" CellPadding="10">
                            <Columns>

                                 <asp:TemplateField>
                                  <HeaderTemplate>
                                Select All
                                <asp:CheckBox ID="Chk1" runat="server"   onclick="CheckAllStud2(this)"   />
                                </HeaderTemplate>
                                <ItemTemplate>
                                   <asp:CheckBox ID="Check" runat="server"   />
                                 </ItemTemplate>
                                  <ItemStyle Width="10%" />
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                        <asp:Label ID="lblGrocerId" runat="server" Visible="false" Text='<%# Bind("GrocerId") %>'></asp:Label>
                                        <asp:Label ID="lblCustID" runat="server" Visible="false" Text='<%# Bind("CustId") %>'></asp:Label>
                                     <%--   <asp:Label ID="lblcartID" runat="server" Visible="false" Text='<%# Bind("CustId") %>'></asp:Label>--%>
                                       
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
                            
                            </Columns>
                            <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                        </asp:GridView>
                        <asp:Label ID="lblStatus" runat="server" Text="Completed" Visible="false" ></asp:Label>
                          <div class="pull-right" align="right"  > 
          <asp:Button ID="btnDone" runat="server" Text="Done"  OnClientClick="return confirmation();" 
                 CssClass="btn btn-red btn-darken-2 " ForeColor="White" Font-Bold="true" onclick="btnDone_Click" />
          </div>
           
                    </asp:Panel>

  
           </div>
  
  
  </td>
  
  </tr>
  
  </asp:Panel> 
       </table>

 <%-- <div class="col-md-16" style="padding:5px"></div>--%>
         <div class="col-lg-16"  >
        <%-- <div class="col-md-12"></div>--%>
         <%-- <div class="col-md-2 pull-right" align="right">
          <asp:Button ID="btnBack" runat="server" Text="Back" Width="100%" CssClass=" btn btn-primary" 
                   onclick="btnBack_Click" />
          </div>--%>
       
          
         </div>
         </div>
         </div>
         </div>
         </div>
        
        
               <script type="text/javascript" language="javascript">

           function CheckAllStud2(Checkbox) {
               var GridVwHeaderChckbox = document.getElementById("<%=gvAcceptordersList.ClientID %>");
               for (i = 1; i < GridVwHeaderChckbox.rows.length; i++) {
                   GridVwHeaderChckbox.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
               }
           }
        </script>
</asp:Content>
