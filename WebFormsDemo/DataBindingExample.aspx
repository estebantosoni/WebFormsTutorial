<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataBindingExample.aspx.cs" Inherits="WebFormsDemo.DataBindingExample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Data binding example</h1>

    <h4>
        <asp:Literal ID="ltError" runat="server" />
    </h4>
    
    <!-- ID is hidden -->
    <!-- Bound Fields autogenerate controls for the fields (create an input on the fields when i click to edit) -->
    <!-- Template Field are useful in this case to display a color swatch based on the hex value -->
    <!-- CommandField are buttons -->

    <!-- NOTE: Color swatch doesnt display because 
        the tutorial doesnt show the color-swatch content, so, i added styles in the same line-->

    <asp:GridView ID="gvColors" 
        CssClass="table table-striped color-table"
        runat="server"
        AutoGenerateColumns="false"
        OnRowDeleting="gvColors_RowDeleting"
        OnRowEditing="gvColors_RowEditing"
        OnRowUpdating="gvColors_RowUpdating"
        OnRowCancelingEdit="gvColors_RowCancelingEdit"
        >
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HiddenField ID="hdnId" 
                        runat="server" 
                        Value='<%# DataBinder.Eval(Container.DataItem, "Id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="hex" HeaderText="Hex" />
            <asp:TemplateField HeaderText="Color Swatch">
                <ItemTemplate>
                    <div class="color-swatch">
                        <div class="color-swatch" style='<%# "background-color:#" + Eval("Hex") + "; width:110px; height:30px; border:1px solid #000;" %>'>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>

    <div class="row color-table">
        <asp:Button ID="btnAddRow"
            runat="server"
            Text="Add New Row"
            CssClass="btn btn-primary"
            OnClick="btnAddRow_Click" />
    </div>

</asp:Content>
