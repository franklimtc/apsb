<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Datatables.aspx.cs" Inherits="Site.Datatables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <%--  <table id="table_id" class="display">
        <thead>
            <tr>
                <th>Column 1</th>
                <th>Column 2</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Row 1 Data 1</td>
                <td>Row 1 Data 2</td>
            </tr>
            <tr>
                <td>Row 2 Data 1</td>
                <td>Row 2 Data 2</td>
            </tr>
        </tbody>
    </table>--%>

    <asp:Table runat="server" ID="gvTeste" CssClass="display">
        <asp:TableHeaderRow>
            <asp:TableCell>ID1</asp:TableCell>
            <asp:TableCell>ID2</asp:TableCell>
            <asp:TableCell>ID3</asp:TableCell>
        </asp:TableHeaderRow>
        <asp:TableRow>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
            <asp:TableCell>Teste</asp:TableCell>
        </asp:TableRow>
    </asp:Table>
   
    <script type="text/javascript" src="../Scripts/DataTables/media/js/jquery.dataTables.js"></script>
     <script>
         $(document).ready(function () {
             $('#table_id').DataTable();
         });
         $(document).ready(function () {
             $('#MainContent_gvTeste').DataTable();
         });
     </script>
</asp:Content>
