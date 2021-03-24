<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="AddHomeDeliveryChrg.aspx.cs" Inherits="OnlineClothing.Grocer.AddHomeDeliveryChrg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <div class="app-content content container-fluid">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
         <div class="content-body"><!-- stats -->
         <div class="row">
         <asp:Panel ID="pnlItemRate" runat="server">
        <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
         <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
            <table class="table table-bordered table-hover">
                <tr>
                    <td bgcolor="#fff">
                        <div class="col-lg-6" align="left">
                            <asp:Label ID="Label1" runat="server" Text="Add Home Delivery Charges:" Font-Bold="true"
                                Font-Size="15px"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#fff">
                   <asp:TextBox ID="txtHomedelChrg" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                <tr>
                <td bgcolor="#fff" align="right" >
                    <asp:Button ID="btnHomeDelivery" runat="server" Text="Add HomeDelivery Charges" CssClass="btn btn-red btn-darken-2 right" ForeColor="White" Font-Bold="true"
                                ToolTip="Continue"  OnClick="btnHomeDelivery_click"  />
                        </td>
                    </tr>
            </table>
            </div>
            </asp:Panel>

          <asp:Panel ID="PnlShowGrid" runat="server">
        <div class="col-md-16" style="padding-left: 20px; padding-right: 20px;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td bgcolor="#fff">
                        <asp:Label ID="Label4" runat="server" Text="Save List:" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16" align="center">
                            <asp:Panel ID="PnlShowGridHomeDel" runat="server" ScrollBars="Both" >
                                <div class="col-md-16">
                                    <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <div class="col-lg-16" align="center">
                                        <asp:GridView ID="gvHomeDel" runat="server" CssClass="table table-bordered" ForeColor="Black"
                                            GridLines="None" AutoGenerateColumns="False">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk" runat="server" Checked="true"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sr.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                        <asp:Label ID="lblHomeDelID" runat="server" Visible="false" Text='<%# Bind("Id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Current Delivery Charge">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("HomeDelCrhg") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <%--<div class="col-lg-16">
                    <asp:Button ID="btnItemsSave" runat="server" Text="Save Items" Width="100px" Height="40px"
                        ToolTip="Continue" CssClass="btn btn-primary pull-right" OnClick="btnSave_click" />
                </div>--%>
                                    </div>
                            </asp:Panel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16">
                           <%-- <asp:Button ID="btnUpdateRates" runat="server" Text="Save Items" Width="250px" Height="32px"
                                ToolTip="Continue" CssClass="btn1 btn-primary pull-right" OnClick="btnSave_click" />--%>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
        </div>
         </div>
         </div>
         </div>
</asp:Content>
