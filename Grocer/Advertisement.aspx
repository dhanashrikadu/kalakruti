<%@ Page Title="" Language="C#" MasterPageFile="~/Grocer/MasterGrocer.Master" AutoEventWireup="true" CodeBehind="Advertisement.aspx.cs" Inherits="OnlineClothing.Grocer.Advertisement" %>
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
             <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
            <table class="table table-bordered table-hover">
                <tr>
                    <td colspan="2" bgcolor="#FFF">
                        <asp:Label ID="Label1" runat="server" Text="Add Advertisement :" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
              
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                            Select Advertisement Category :
                        </div>
                        <div class="col-lg-16">
                            <asp:DropDownList ID="ddlcat" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Category Adds" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Sub-Category Adds" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Products Adds" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                            Add Advertisement Image :
                        </div>
                        <div class="col-lg-16">
                            <asp:FileUpload ID="FileUpload1" runat="server" placeholder="Select" />
                        </div>
                    </td>
                </tr>
                <tr align="right">
                    <td colspan="2">
                        <div class="col-lg-16">
                            <asp:Button ID="btnAddCat" runat="server" Text="Add Advertisement" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                ToolTip="Continue"  PostBackUrl="" OnClick="AddImg_click"/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <%--=================================================================================--%>
         <asp:Panel ID="pnlAdds" runat="server">
        <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td bgcolor="#FFF">
                        <asp:Label ID="Label2" runat="server" Text="Advertisement Lists :" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-lg-16" style="padding-left: 20px; padding-right: 19px;">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Width="100%" >
                <asp:GridView ID="GvAdds" runat="server" AutoGenerateColumns="false"  Width="100%"  CssClass="table-bordered">
                   <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle Height="40px" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                <%--<asp:label id="lblitemid" runat="server" visible="false" text='<%# bind("itemqtyid") %>'></asp:label>--%>
                            </ItemTemplate>
                            <ItemStyle Width="10px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgcat" runat="server" ImageUrl='<%# Bind("imgurl") %>' Height="50px"
                                    Width="50px" />
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnCancle" runat="server" Text="Delete" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"  />
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
