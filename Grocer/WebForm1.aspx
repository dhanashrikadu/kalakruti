<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="OnlineClothing.Grocer.WebForm1" %>
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
               
               <%-- <tr cs>
                    <td colspan="2" bgcolor="bg-red bg-accent-4">
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
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                          <%--  <asp:Button ID="btnAddCat" runat="server" Text="Add Header Image" Width="250px" Height="30px" 
                                ToolTip="Continue" CssClass="btn1 btn-primary pull-right" OnClick="btnAddcat_Click"
                                PostBackUrl="" />--%>
                                 <asp:Button ID="btnAddCat" runat="server" Text="Add Header Image" Width="250px" Font-Bold="true"
                                ToolTip="Continue" CssClass="btn btn-red btn-accent-4" 
                                PostBackUrl="" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
  <asp:Panel ID="PnlShowGridHomeDel" runat="server" ScrollBars="Both" >
                                <div class="col-md-16">
                                    <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    <div class="col-lg-16" align="center">
                                      <asp:GridView ID="GridView4" runat="server" CssClass="table table-bordered" ForeColor="Black"
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
                                                <asp:TemplateField>
                                                <ItemTemplate>
                                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true" Text="Sample"  />

                                                 <asp:Button ID="Button1" runat="server" CssClass="btn" BackColor="#d33b33" ForeColor="White" Font-Bold="true" Text="Sample"  />
                                                </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            

                                            CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                            
                                            <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />







                                            </asp:GridView>
                 <%--
                                          <asp:GridView ID="GridView5" runat="server" CssClass="table table-bordered" ForeColor="Black"
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
                                                <asp:TemplateField>
                                                <ItemTemplate>
                                               <asp:Button ID="Button1" runat="server" CssClass="btn-pink btn-darken-3" ForeColor="White" Text="Sample" Font-Bold="true" />
                                                </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            
                                            <HeaderStyle CssClass="bg-pink bg-darken-3" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                           
                                            
                                        </asp:GridView>
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
                                                <asp:TemplateField>
                                                <ItemTemplate>
                                               <asp:Button ID="Button4" runat="server" CssClass="btn-danger  btn-darken-4"  Text="Sample" Font-Bold="true" />
                                                </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            
                                            <HeaderStyle CssClass="bg-danger bg-darken-4" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                           
                                            
                                        </asp:GridView>
                                        

                                         <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" ForeColor="Black"
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
                                                <asp:TemplateField>
                                                <ItemTemplate>
                                                 <asp:Button runat="server" CssClass="btn-pink btn-accent-4" ForeColor="White" Text="Sample" Font-Bold="true" />
                                                </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            
                                           
                                            <HeaderStyle CssClass="bg-pink bg-accent-4" ForeColor="White" HorizontalAlign="Center" />
                                            </asp:GridView>

                                             <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered" ForeColor="Black"
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
                                                <asp:TemplateField>
                                                <ItemTemplate>
                                                <asp:Button ID="Button2" runat="server" CssClass="btn-pink" ForeColor="White" Text="Sample" Font-Bold="true" />
                                                </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            
                                            
                                            <HeaderStyle CssClass="bg-pink" ForeColor="White" HorizontalAlign="Center" />
                                            </asp:GridView>
                 

                                        <asp:GridView ID="GridView3" runat="server" CssClass="table table-bordered" ForeColor="Black"
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
                                                <asp:TemplateField>
                                                <ItemTemplate>
                                                <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary" ForeColor="White" Text="Sample" Font-Bold="true" />
                                                </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            
                                         
                                            <HeaderStyle CssClass="bg bg-primary" ForeColor="White" HorizontalAlign="Center" />
                                            </asp:GridView>--%>

                                            
                 
                 
                                    </div>
                                  
                            </asp:Panel>

</asp:Content>
