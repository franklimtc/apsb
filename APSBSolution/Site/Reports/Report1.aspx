<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report1.aspx.cs" Inherits="Site.Reports.Report1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
        <div class="col">
            <h2>Relatório 1</h2>
        </div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <asp:Button ID="btExportar" Text="Exportar" runat="server" CssClass="btn btn-Secondary" OnClick="btExportar_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col">
            <asp:Table runat="server" CssClass="table">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Col1</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Col2</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Col3</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Col4</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Col5</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Col6</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Col7</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>Item1</asp:TableCell>
                    <asp:TableCell>Item2</asp:TableCell>
                    <asp:TableCell>Item3</asp:TableCell>
                    <asp:TableCell>Item4</asp:TableCell>
                    <asp:TableCell>Item5</asp:TableCell>
                    <asp:TableCell>Item6</asp:TableCell>
                    <asp:TableCell>Item7</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Item1</asp:TableCell>
                    <asp:TableCell>Item2</asp:TableCell>
                    <asp:TableCell>Item3</asp:TableCell>
                    <asp:TableCell>Item4</asp:TableCell>
                    <asp:TableCell>Item5</asp:TableCell>
                    <asp:TableCell>Item6</asp:TableCell>
                    <asp:TableCell>Item7</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Item1</asp:TableCell>
                    <asp:TableCell>Item2</asp:TableCell>
                    <asp:TableCell>Item3</asp:TableCell>
                    <asp:TableCell>Item4</asp:TableCell>
                    <asp:TableCell>Item5</asp:TableCell>
                    <asp:TableCell>Item6</asp:TableCell>
                    <asp:TableCell>Item7</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Item1</asp:TableCell>
                    <asp:TableCell>Item2</asp:TableCell>
                    <asp:TableCell>Item3</asp:TableCell>
                    <asp:TableCell>Item4</asp:TableCell>
                    <asp:TableCell>Item5</asp:TableCell>
                    <asp:TableCell>Item6</asp:TableCell>
                    <asp:TableCell>Item7</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Item1</asp:TableCell>
                    <asp:TableCell>Item2</asp:TableCell>
                    <asp:TableCell>Item3</asp:TableCell>
                    <asp:TableCell>Item4</asp:TableCell>
                    <asp:TableCell>Item5</asp:TableCell>
                    <asp:TableCell>Item6</asp:TableCell>
                    <asp:TableCell>Item7</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </div>
</asp:Content>
