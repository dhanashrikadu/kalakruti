<%@ Page Title="" Language="C#" MasterPageFile="~/deliveryForms/masterDeliveryBoy.Master" AutoEventWireup="true" CodeBehind="DeliBoyMyPayment.aspx.cs" Inherits="OnlineClothing.deliveryForms.DeliBoyMyPayment" %>
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
                           <asp:GridView ID="gvPendingorders" runat="server" CssClass="table table-bordered" Font-Size="Medium"
                            AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966"
                            BorderStyle="None" BorderWidth="1px" CellPadding="10">
                            <Columns>

                                <asp:TemplateField HeaderText="Sr.No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                 
                                        <%--asp:Label ID="lblDeli_ID" runat="server" Visible="false" Text='<%# Bind("Deli_BoyID") %>'></asp:Label> --%>
                                  
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Confirm Order Id">
                                    <ItemTemplate>
                                     
                                        <asp:Label ID="lblConfirmorderId" runat="server" Text='<%# Bind("OrderId")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               <%-- <asp:TemplateField HeaderText="Customer Name">
                                    <ItemTemplate>
                                       
                                        <asp:Label ID="lblcustnm" runat="server" Text='<%# Bind("Cust_Name")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                              
                              
                                <asp:TemplateField HeaderText="Total Price">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTprice" runat="server" Text='<%# Bind("drDeliCharges") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                              
                            
                            </Columns>
                            <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                        </asp:GridView>
                        <div class="" style="text-align:right;">
                        <asp:Label ID="lblT" runat="server" Text="Total = ₹"  ></asp:Label>
                         <asp:Label ID="lblTotal" runat="server"></asp:Label>
                        </div>
                        
           
                    </asp:Panel>

  
           </div>
  
  
  </td>
  
  </tr>
  
  </asp:Panel> 
       </table>

 
         </div>
         </div>
         </div>
         </div>
</asp:Content>
