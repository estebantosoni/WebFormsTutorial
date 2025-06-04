<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebFormsDemo.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <div class="message">
            <!-- Works like a placeholder -->
            <asp:Literal runat="server" id="ltMessage" />
        </div>
        <address>
            One Microsoft Way<br />
            Redmond, WA 98052-6399<br />
            <abbr title="Phone">P:</abbr>
            425.555.0100
        </address>
        <div>
            <label>Name</label>
            <!-- I can add a css class with cssClass attribute -->
            <asp:TextBox ID="txtName" CssClass="text-box" runat="server" class="mb-2"/>
            <asp:RequiredFieldValidator runat="server" ID="rfvName" ControlToValidate="txtName" ErrorMessage="*" /><br />
        </div>
        <div>
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" class="mb-2" />
            <!-- IMPORTANT: the line could throw a warning because the ID has an incorrect format -->
            <!-- ERROR: rfvEmail | OK: revEmail -->
            <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ErrorMessage="Email required" ValidationExpression=""/><br />
        </div>
        <div>    
            <label>Age</label>
            <asp:TextBox ID="txtAge" runat="server" class="mb-2"/>
            <asp:RequiredFieldValidator runat="server" ID="rfvAge" ControlToValidate="txtAge" ErrorMessage="*" /><br />
        </div>
        <div class="mb-2">
            <label>Favorite color:</label>
            <asp:DropDownList ID="ddlColor" runat="server">
                <asp:ListItem Text="Choose a Color" Value="" />
                <asp:ListItem Text="Red" Value="Red" />
                <asp:ListItem Text="Green" Value="Green" />
                <asp:ListItem Text="Blue" Value="Blue" />
                <asp:ListItem Text="Yellow" Value="Yellow" />
                <asp:ListItem Text="Black" Value="Black" />
            </asp:DropDownList>
        </div>
        <asp:RequiredFieldValidator runat="server" ID="rfvColor" ControlToValidate="ddlColor" ErrorMessage="*"/><br />
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Info" OnClick="BtnSubmit_Click" />
        </div>
        <address>
            <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
        </address>
    </main>
</asp:Content>
