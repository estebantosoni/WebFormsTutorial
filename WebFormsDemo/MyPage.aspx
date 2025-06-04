<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPage.aspx.cs" Inherits="WebFormsDemo.MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Repeater</h2>

    <div class="form-group">
        <label>Event name:</label>
        <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" />
    </div>

    <div class="form-group">
        <label>Event date:</label>
        <asp:Calendar id="calendarEvents" runat="server" />
    </div>

    <div class="form-group">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-lg" OnClick="btnSave_Click" />
    </div>

    <h3>Events Repeater</h3>
    <div>
        <asp:Repeater ID="rptEvents" runat="server">
            <ItemTemplate>
                <h3><%# DataBinder.Eval(Container.DataItem, "EventDate") %>
                    <small><%# DataBinder.Eval(Container.DataItem, "EventName") %></small></h3>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
