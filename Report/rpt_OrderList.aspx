<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rpt_OrderList.aspx.cs" Inherits="OnlineClothing.Report.rpt_OrderList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Ki, Pune</title>
    <script language="javascript1.2" type="text/javascript">
        function printthis(which) {
            var tds = document.getElementsByTagName("div");
            for (i = 0; i < tds.length; i++)
                tds.item(i).style.display = "none";
            document.getElementById(which).style.display = "block";
            window.print();
            for (i = 0; i < tds.length; i++)
                tds.item(i).style.display = "block";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div id="studlist">
         <asp:Panel ID="Panel2" runat="server">
        <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <div align="left">
                        <img src="../../Images/Icons/kitchen_basket_inner_use.png" height="25px" width="300px"  />
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        
                        <tr>
                            <td width="20%" style="font-family: Arial Unicode MS;">
                                Full Name:
                            </td>
                           <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-bottom: 0px">
                                    <tr>
                                        <td width="20%" Style="font-family:Arial Unicode MS;">
                                            <asp:Label ID="lblFullName"  Style="font-family:Arial Unicode MS; font-weight:bold;"  runat="server"></asp:Label>
                                        </td>
                                           <td width="20%" style="font-family: Arial Unicode MS;">
                                Date:
                                           <td width="20%" Style="font-family:Arial Unicode MS;">
                                            <asp:Label ID="lbldate"  Style="font-family:Arial Unicode MS; font-weight:bold;"  runat="server"></asp:Label>
                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td width="20%" style="font-family: Arial Unicode MS;">
                                Address:
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="20%" Style="font-family:Arial Unicode MS;">
                                             <asp:Label ID="lblAddress"  Style="font-family:Arial Unicode MS; font-weight:bold;"  runat="server"></asp:Label>
                                        </td>
                                              <td width="20%" style="font-family: Arial Unicode MS;">
                                Consumer No:
                                          <td width="20%" Style="font-family:Arial Unicode MS;">
                                            <asp:Label ID="lblConsumerNo"  Style="font-family:Arial Unicode MS; font-weight:bold;"  runat="server"></asp:Label>
                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%" style="font-family: Arial Unicode MS;">
                                Mobile No:
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="20%" Style="font-family:Arial Unicode MS;">
                                            <asp:Label ID="lblMobileNo"  Style="font-family:Arial Unicode MS; font-weight:bold;"  runat="server"></asp:Label>
                                        </td>
                                           <td width="20%" style="font-family: Arial Unicode MS;">
                                Order No:
                                          <td width="20%" Style="font-family:Arial Unicode MS;">
                                            <asp:Label ID="lblorder"  Style="font-family:Arial Unicode MS; font-weight:bold;"  runat="server"></asp:Label>
                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                            <tr>
                            <td width="20%" style="font-family: Arial Unicode MS;">
                               Email:
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="20%" Style="font-family:Arial Unicode MS;">
                                            <asp:Label ID="lblEmail"  Style="font-family:Arial Unicode MS; font-weight:bold;"  runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
             <hr style="color:red;width:2px;" />
             </asp:Panel>
          
            <asp:Panel ID="pnlgrid" runat="server"  Width="100%" Height="320px" >
                <asp:GridView ID="GVItemDtl" runat="server" AutoGenerateColumns="false" CssClass="table-bordered"
                    Width="100%">
                    <HeaderStyle BackColor="#b40000" ForeColor="White" Height="30px" />
                    <RowStyle Height="40px" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                <%--<asp:label id="lblitemid" runat="server" visible="false" text='<%# bind("itemqtyid") %>'></asp:label>--%>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item Name">
                            <ItemTemplate>
                                <asp:Label ID="lblItemname" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="left" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                               <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MRP(RS.)">
                            <ItemTemplate>
                                <asp:Label ID="lblMRP" runat="server" Text='<%# Bind("MRP") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OfferRate(RS.)">
                            <ItemTemplate>
                                <asp:Label ID="lblOfferRate" runat="server" Text='<%# Bind("OfferRate") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Total(RS.)">
                            <ItemTemplate>
                                <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div class="col-md-16" style="padding-left: 20px; padding-bottom:20px; padding-top:20px"></div>
            <div class="col-md-16" style="padding-left: 20px; padding-right: 19px;">
            <asp:Panel ID="Panel1" runat="server"  Width="100%" Height="320px">
                <a href="JavaScript:printthis('studlist');" style="padding-left:1200px">Print</a>
                |&nbsp;&nbsp<a href="CustPendingOdr.aspx">Back</a>&nbsp;&nbsp|
                </asp:Panel>
            </div>
            </asp:Panel>
        </div>      
        </div>
    </form>
</body>
</html>
