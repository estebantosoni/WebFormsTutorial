<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectCalculation.aspx.cs" Inherits="WebFormsDemo.ProjectCalculation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1> Get a Quote for your custom project</h1>
    <p class="lead">Base price: <asp:Literal ID="ltBase" runat="server" /></p>

    <div class="form-group">
        <label>State</label>
        <!-- Enabling autopostback means that we will return a result automatically -->
        <asp:DropDownList   ID="ddlStates" 
                            runat="server" 
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlStates_SelectedIndexChanged" 
                            CssClass="form-control">
            <asp:ListItem Text="Choose a State" Value="" />
            <asp:ListItem Text="Alabama" Value="AL" />
            <asp:ListItem Text="Alaska" Value="AK" />
            <asp:ListItem Text="Arizona" Value="AZ" />
            <asp:ListItem Text="Arkansas" Value="AR" />
            <asp:ListItem Text="California" Value="CA" />
            <asp:ListItem Text="Colorado" Value="CO" />
        </asp:DropDownList>
    </div>

    <div class="jumbotron">
        <h3>Your custom price: 
            <asp:Literal ID="ltCustomPrice" runat="server" Text="(select your state to get price)" />
        </h3>
    </div>

</asp:Content>
