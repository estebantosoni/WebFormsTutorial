<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExceptionHandlingExample.aspx.cs" Inherits="WebFormsDemo.ExceptionHandlingExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1> Exception Handling Example</h1>
    <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="bg-warning" />
    <div class="form-group">
        <label>This should be a decimal: </label>
        <asp:TextBox ID="txtDecimal" runat="server" CssClass="form-control" />
    </div>
    <div class="form-group">
        <asp:Button ID="btnSubmit" CssClass="btn btn-success" Text="Submit" runat="server"
            OnClick="btnSubmit_Click"/>
    </div>
</asp:Content>
