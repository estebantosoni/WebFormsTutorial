<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ValidationExample.aspx.cs" Inherits="WebFormsDemo.ValidationExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Validation Example</h1>

    <div class="form-group">
        <div class="form-text">
           *Fields marked with an asterisk are required.
        </div>
    </div>
    <p class="bg-primary">
        <asp:Literal ID="ltMessage" runat="server" />
        <asp:ValidationSummary
            ID="valSummaryForm"
            runat="server"
            CssClass="bg-warning"
            ValidationGroup="valForm"
            DisplayMode="BulletList"
            HeaderText="Please correct the following errors:"
            Visible="false"/>
    </p>
    <div class="form-group">
        <label>*Full name:</label>
        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator
            ID="rqFullName"
            runat="server"
            ControlToValidate="txtFullName"
            CssClass="bg-warning"
            ValidationGroup="valForm"
            ErrorMessage="Full name is required."
            Display="Dynamic"/>
    </div>
    <div class="form-group">
        <label>Nickname:</label>
        <asp:TextBox ID="txtNickName" CssClass="form-control" runat="server" />
    </div>
     <div class="form-group">
         <label>Age:</label>
         <asp:TextBox ID="txtAge" CssClass="form-control" runat="server" />
         <asp:RequiredFieldValidator
             ID="rqAge"
             runat="server"
             CssClass="bg-warning"
             ControlToValidate="txtAge"
             ValidationGroup="valForm"
             ErrorMessage="Age is required."
             Display="Dynamic"/>
         <!-- Important to add a validation group for each control to avoid problems with multiple forms -->
         <asp:RangeValidator ID="rvAge" 
             runat="server" 
             ControlToValidate="txtAge"
             ValidationGroup="valForm"
             Type="Integer"
             MinimumValue="4"
             MaximumValue="120"
             CssClass="bg-warning"
             ErrorMessage="*I find it hard to believe that is your age. Please enter your real age."
             Display="Dynamic"/>
     </div>
     <div class="form-group">
         <label>Email address: </label>
         <asp:TextBox ID="txtEmailAddress" CssClass="form-control" runat="server" />
         <asp:RequiredFieldValidator
             ID="rqEmailAddress"
             runat="server"
             CssClass="bg-warning"
             ControlToValidate="txtEmailAddress"
             ValidationGroup="valForm"
             ErrorMessage="Email is required."
             Display="Dynamic"/>
     </div>
    <div class="form-group">
        <label>*Name a price (in USD): </label>
        <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" />
        <asp:RequiredFieldValidator
            ID="rqPrice"
            runat="server"
            CssClass="bg-warning"
            ControlToValidate="txtPrice"
            ValidationGroup="valForm"
            ErrorMessage="Price is required."
            Display="Dynamic"/>
        <asp:CompareValidator ID="cvPrice" runat="server" ControlToValidate="txtPrice"
            Type="Currency"
            Operator="DataTypeCheck"
            CssClass="bg-warning"
            ValidationGroup="valForm"
            ErrorMessage="Please enter a valid price"
            Display="Dynamic"/>
    </div>
    <div class="form-group">
        <asp:Button ID="btnSubmit"
            runat="server"
            Text="Submit"
            OnClick="btnSubmit_Click"
            CssClass="btn btn-success"
            ValidationGroup="valForm"
            CausesValidation="true" />
    </div>
</asp:Content>
