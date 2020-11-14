<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report2.aspx.cs" Inherits="Site.Reports.Report21" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <rsweb:ReportViewer ID="viewer" runat="server" Width="100%" Height="800px" ShowPrintButton="false"></rsweb:ReportViewer>

    </form>
</body>
</html>
