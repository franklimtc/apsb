<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informativo_APSDF.aspx.cs" Inherits="Site.Fichas.Informativo_APSDF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <style>
        table {
            border-collapse: collapse;
        }

        td {
            width: 100px;
            height: 40px;
            border: 1px solid black;
            text-align: justify;
            text-justify: inter-word;
            padding-left: 5px;
        }

        .hidden td {
            border: 1px solid white;
        }

        footer, .text {
            width: 800px;
            text-align: justify;
            text-justify: inter-word;
        }

        footer {
            font-size: 12px;
            text-align: center;
        }

        .TextLeft {
            text-align: right;
            width: 800px;
        }

        h2 {
            text-align: center;
            max-width: 800px;
        }
    </style>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
            </Scripts>
        </asp:ScriptManager>
        <asp:Image ImageUrl="~/assets/img/APSDFLogo.png" runat="server" Width="800px" />
        <br />
        <br />
        <h2>INFORMATIVO</h2>
        <div class="text">
            <p>
                O compromisso da APSDF é de repassar os honorários ao profissional assim que receber os recursos, 
                <b>em até 48 hrs úteis, desde que</b>:
            </p>
            <p><b>- A Clinica/Hospital ou o associado, nos informe do repasse na conta da APSDF até às 13:00, após, considera-se dia útil o dia subsequente;</b></p>
            <p><b>- APSDF, precisa identificar no banco o referido repasse, validar valores e identificar o profissional para repasse.</b></p>
            <br />
            <p>
                Baseado no exposto acima <b>DECLARO ESTAR CIENTE</b> da natureza operacional da APSDF e de que a APSDF não pode ser 
                responsabilizada ao não depositar ou atrasar o depósito de meus honorários profissionais (repasse) QUANDO 
                A CLÍNICA/HOSPITAL, QUE É A FONTE PAGADORA NA QUAL REALIZO A PRESTAÇÃO DE SERVIÇO, NÃO DEPOSITAR MEUS RENDIMENTOS NA CONTA DA APSDF EM PRAZO HÁBIL e a validação das informações.
            </p>
            <p><b>OBS:</b> Problemas que dificultam a operação da APSDF, referente às clínicas/hospitais: costumam não informar quando realizam os repasses, depósitos em dinheiro não identificados, TEDs na conta da APSDF disponíveis às 16:00, informam que depositaram mas não realizaram o repasse, realizam repasses sem informar para quais associados refere-se o repasse entre outros.</p>
            <div class="TextLeft">
                <asp:Label ID="lbData" runat="server" />
            </div>
            <br />
            <br />
            <br />
            <table style="text-align: center;">
                <tr>
                    <td style="width: 200px; border: hidden; text-align: center"></td>
                    <td style="width: 400px; border: hidden; text-align: center">
                        <hr />
                        <asp:Label ID="lbNomeAss" runat="server" /><br />
                        CPF:
                    <asp:Label ID="lbCPF" runat="server" CssClass="cpf" />
                    </td>
                    <td style="width: 200px; border: hidden; text-align: center"></td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <footer>
            <hr />
            ASSOCIAÇÃO DOS PROFISSIONAIS DE SAÚDE DO DISTRITO FEDERAL - APSDF. Quadra CSF 03 AE Micromercado lote 01 sala 102 – Taguatinga – DF, CEP: 72.025-535 - Telefone: 3351 5008 - E-mail: comercial@apsdf.com.br
        </footer>
    </form>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
    <script>
        window.addEventListener("load", function () {
            window.print();
        });
    </script>
</body>
</html>
