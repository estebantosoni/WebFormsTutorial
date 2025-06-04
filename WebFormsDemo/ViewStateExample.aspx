<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewStateExample.aspx.cs" Inherits="WebFormsDemo.ViewStateExample" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Puedo deshabilitar view state agregando en la primera linea (@ Page): ViewStateMode="disabled" -->

    <h1>View State Example</h1>

    <div class="lead"><asp:Literal ID="ltPostBack" runat="server" /></div>

    <div class="form-group">
        <label>Nick name</label>
        <asp:TextBox ID="txtNickName" runat="server" CssClass="form-control" />
    </div>
    <div class="form-group">
        <label>Name</label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
    </div>
    <div class="form-group">
        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
    </div>
    <div class="form-group">
        <label>Phone</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
    </div>
    <!-- Tambien puedo deshabilitar view state en algun input -->
    <div class="form-group">
        <label>City</label>
        <asp:TextBox ID="txtCity" runat="server" ViewStateMode="Disabled" CssClass="form-control" />
    </div>

    <div class="form-group">
        <label>State</label>
        <asp:DropDownList ID="ddlStates" runat="server" CssClass="form-control">
            <asp:ListItem Text="Choose a State" Value="" />
            <asp:ListItem Text="Alabama" Value="AL" />
            <asp:ListItem Text="Alaska" Value="AK" />
            <asp:ListItem Text="Arizona" Value="AZ" />
            <asp:ListItem Text="Arkansas" Value="AR" />
            <asp:ListItem Text="California" Value="CA" />
            <asp:ListItem Text="Colorado" Value="CO" />
        </asp:DropDownList>
    </div>

    <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Save" 
            CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
    </div>

</asp:Content>
