<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin1.Master" AutoEventWireup="true" CodeBehind="AddBanner.aspx.cs" Inherits="OnlineClothing.Admin.AddBanner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="app-content content container-fluid">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
                <div class="content-body"><!-- stats -->
        <div class="row">
         <asp:Panel runat="server" ID="PnlAddCat" CssClass="page-content">
                <div class="col-lg-16" style="padding-left: 11PX; padding-right: 12PX;">
                 
            <table class="table table-bordered table-hover">
                <tr>
                    <td colspan="2" bgcolor="#FFF">
                        <asp:Label ID="Label1" runat="server" Text="Header Image:" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
               
             <%--   <tr>
                    <td colspan="2" bgcolor="Black">
                        <asp:Label ID="Label1" runat="server" Text="Header Image:" ForeColor="White" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>--%>
               
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                            Add Header Image :
                        </div>
                        <div class="col-lg-16">
                            <asp:FileUpload ID="FileUploadCat" runat="server" placeholder="Select" />
                        </div>
                    </td>
                </tr>
                <tr align="right">
                    <td colspan="2">
                        <div class="col-lg-16">
                            <asp:Button ID="btnAddCat" runat="server" Text="Add Header Image" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                ToolTip="Continue" OnClick="btnAddcat_Click"
                                PostBackUrl="" />
                            
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
      <asp:Panel ID="pnlCategory" runat="server">
        <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td bgcolor="#FFF">
                        <asp:Label ID="Label2" runat="server" Text="Category Lists :" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
     <%--   <div class="col-md-16" style="padding-left: 20px; padding-right: 19px;">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Both">
                <asp:GridView ID="Gvcategory" runat="server" CellPadding="5" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                    Height="350px" HorizontalAlign="Center" Width="1140px" 
                   >--%>
        <div class="col-md-16" style="padding-left: 20px; padding-right: 19px;">
        <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Width="100%">
                <asp:GridView ID="Gvcategory" runat="server" AutoGenerateColumns="false"  CssClass="table-bordered" 
                    Width="100%">
                   <%-- <HeaderStyle BackColor="#b40000" ForeColor="White" Height="30px" />--%>
                   <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle Height="40px" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                  <asp:Label ID="lblhederid" runat="server" Visible="false" Text='<%# Bind("HeaderId") %>'></asp:Label>
                                <%--<asp:label id="lblitemid" runat="server" visible="false" text='<%# bind("itemqtyid") %>'></asp:label>--%>
                            </ItemTemplate>
                            <ItemStyle Width="10px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <asp:Image ID="imgheader" runat="server" ImageUrl='<%# Bind("HeaderImage") %>' Height="50px" Width="50px" />
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                         <%--<asp:TemplateField HeaderText="Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCatName" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Marathi Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblMarathiCatName" runat="server" Text='<%# Bind("MarathiCatagory") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnCancle" runat="server" Text="Delete" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" OnClick="Deletecat_Click" />
                                 <%--   <asp:Button ID="btnCancle" runat="server" Text="Delete" CssClass="btn btn-red btn-accent-4" Font-Bold="true"
                                     OnClick="Deletecat_Click" />--%>
                            </ItemTemplate>
                             <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
       </div>
        
    </asp:Panel>
    </div>
    </div>
    </div>
    </div>
</asp:Content>
