<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin1.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="OnlineClothing.Admin.AddSubCategory" %>
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
        <div class="col-lg-16" style="padding-left: 11PX; padding-right: 12PX;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td colspan="2" bgcolor="#FFF">
                        <asp:Label ID="Label3" runat="server" Text="Add Sub-Category :" Font-Bold="true"
                            Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16">
                            Select Category :
                        </div>
                        <div class="col-lg-16">
                            <asp:DropDownList ID="ddlCate" runat="server" class="form-control" AutoPostBack="True"
                                OnSelectedIndexChanged="ddlCate_SelectedIndexChanged">
                            </asp:DropDownList>
                            <%--OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"--%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="col-lg-16">
                            Add Sub Category :
                        </div>
                        <div class="col-lg-16">
                            <asp:TextBox ID="txtSubcate" runat="server" CssClass="form-control" placeholder="Add Sub-Category"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                            Add Sub-Category Image :
                        </div>
                        <div class="col-lg-16">
                            <asp:FileUpload ID="FileUploadSubcat" runat="server" placeholder="Select" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                            <asp:CheckBox ID="chkRegular" runat="server" />
                         Is Regular Item :
                        </td>
                </tr>
                                <tr>
                    <td colspan="2">
                        <div class="col-lg-16">
                            <asp:Button ID="btnAddSubcat" runat="server" Text="Add SubCategory" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                 ToolTip="Continue" OnClick="btnAddSubcat_Click"
                                PostBackUrl="" /></div>
                        <%--OnClick="showItemGrid" --%>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlsubCategory" runat="server">
        <div class="col-lg-16" style="padding-left: 20px; padding-right: 20px;">
            <table class="table table-bordered table-hover">
                <tr>
                    <td bgcolor="#FFF">
                        <asp:Label ID="LblSubcat" runat="server" Text="Sub-Category Lists :" Font-Bold="true"
                            Font-Size="Large"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-16" style="padding-left: 20px; padding-right: 19px;">
        <asp:Label ID="lblnorecordfound" runat="server" Font-Bold="true" Visible="false" ForeColor="Red">No Record Found</asp:Label>
            <asp:Panel ID="pnlgrid" runat="server" ScrollBars="Both" Width="100%" >
                <asp:GridView ID="Gvsubcategory" runat="server" AutoGenerateColumns="false" CssClass="table-bordered"
                    Width="100%">
                    <HeaderStyle CssClass="bg-red bg-darken-2" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle Height="40px" />
                    <Columns>
                        <asp:TemplateField HeaderText="Sr.No">
                            <ItemTemplate>
                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                <%--<asp:label id="lblitemid" runat="server" visible="false" text='<%# bind("itemqtyid") %>'></asp:label>--%>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SubCatId">
                            <ItemTemplate>
                                <asp:Label ID="lblcatId" runat="server" Text='<%# Bind("SubCatId") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <asp:Image ID="imgcat" runat="server" ImageUrl='<%# Bind("Image") %>' Height="50px" Width="50px" />
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCatName" runat="server" Text='<%# Bind("SubCatName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="" HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnCancle" runat="server" Text="Delete" CssClass="btn btn-red btn-darken-2" ForeColor="White" Font-Bold="true"
                                    OnClick="DeletrSubcat_Click" />
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
