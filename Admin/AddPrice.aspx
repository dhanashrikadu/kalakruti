<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin1.Master" AutoEventWireup="true" CodeBehind="AddPrice.aspx.cs" Inherits="OnlineClothing.Admin.AddPrice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="app-content content container-fluid">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
                <div class="content-body"><!-- stats -->
        <div class="row">

           <asp:Panel runat="server" ID="PnlAddSubcat" CssClass="page-content">

         <div id="Div1" class="right-panel">
            <!-- Animated -->
                <!--  Traffic  -->
                 <table class="table table-bordered table-hover">
                <tr>
                    <td colspan="2" bgcolor="#FFF">
                        <asp:Label ID="Label3" runat="server" Text="Add Price : " Font-Bold="true"
                            Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16">
                            Select Category :
                        </div>
                        <div class="col-lg-16">
                          <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16">
                            Select Sub Category :
                        </div>
                        <div class="col-lg-16">
                          <asp:DropDownList ID="ddlSubCategory" runat="server" class="form-control" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                          Select Product :
                        </div>
                        <div class="col-lg-16">
                           <asp:DropDownList ID="ddlProduct" runat="server" class="form-control" OnSelectedIndexChanged="ddlproducts_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                          
                        </div>
                    </td>
                </tr>
              
                </table>
               


                  <div class="orders">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                             <div class="col-lg-16">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <td bgcolor="#FFF">
                                            <asp:Label ID="LblSubcat" runat="server" Text="Item List : " Font-Bold="true"
                                                Font-Size="Large"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                               
                                <div class="card-body--">
                                   
                                     <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" >
                                     <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
                                <asp:GridView ID="gvItemRate" runat="server" CssClass="table table-bordered" ForeColor="Black"
                                    GridLines="None" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                            <span>Select All</span>
                                                <asp:CheckBox ID="chkAll" runat="server"  AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged"/>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="ChkChild" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sr.No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                <asp:Label ID="lblItemId" runat="server" Visible="false" Text='<%# Bind("ItemId") %>'></asp:Label>
                                                 <asp:Label ID="lbllblItemId" runat="server" Visible="false" Text='<%# Bind("ProductId") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:TemplateField HeaderText="Image">
                                            <ItemTemplate>
                                                <asp:Image ID="imgcat" runat="server" ImageUrl='<%# Bind("Image") %>' Height="50px"
                                                    Width="50px" />
                                            </ItemTemplate>
                                            <ItemStyle Width="" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ItemName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblIname" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                            </ItemTemplate>
                                            
                                        </asp:TemplateField>
                                 <%--       <asp:TemplateField HeaderText="Details">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDtl" runat="server" Enabled="false" Text='<%# Bind("Details") %>'></asp:Label>
                                            </ItemTemplate>
                                           
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtOty" runat="server" placeholder="Quantity"></asp:TextBox>
                                            </ItemTemplate>
                                            
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlunit" runat="server" >
                                                <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                <asp:ListItem Value="GM" Text="GM"></asp:ListItem>
                                                <asp:ListItem Value="KG" Text="KG"></asp:ListItem>
                                                <asp:ListItem Value="Li" Text="Ltr"></asp:ListItem>
                                                <asp:ListItem Value="ML" Text="ML"></asp:ListItem>
                                                <asp:ListItem Value="Piece" Text="Piece"></asp:ListItem>
                                                <asp:ListItem Value="Pack" Text="Pack"></asp:ListItem>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="MRP">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtMRP" runat="server" placeholder="MRP" ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                                </asp:GridView>
                            </asp:Panel>
                                </div>
                            </div> <!-- /.card -->
                        </div>  <!-- /.col-lg-8 -->
                    </div>
                </div>

                  <div class="col-lg-12">
                                    <div class="card-body" style="text-align:right;">
                        <asp:Button ID="btnUpdateRates" runat="server" Text="Add Items Rates" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                 ToolTip="Continue"  OnClick="btnUpdateRates_click" />        </div>
                                </div>
                        </div>
                      
                        </asp:Panel>
                       </div>
                       </div>
    </div>
    </div>
     
                        
</asp:Content>
