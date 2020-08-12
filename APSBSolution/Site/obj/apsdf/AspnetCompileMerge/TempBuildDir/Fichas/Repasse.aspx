<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repasse.aspx.cs" Inherits="Site.Fichas.Repasse" %>

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
        <asp:Image ImageUrl="~/assets/img/apsbLogo2.jpg" runat="server" Width="800px" />
        <br />
        <br />
        <h2>AUTORIZAÇÃO DE REPASSE</h2>
        <table>
            <tr>
                <th colspan="8"  style="height: 50px">DADOS DA EMPRESA PRESTADORA DE SERVIÇOS DE SAÚDE (CLÍNICA OU HOSPITAL)</th>
            </tr>
            <tr>
                <td colspan="2">NOME FANTASIA:</td>
                <td colspan="6"><asp:Label ID="lbClinicaFantasia" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">CNPJ:</td>
                 <td colspan="6"><asp:Label ID="lbClinicaCNPJ" runat="server" CssClass="cnpj" /></td>
            </tr>
            <tr>
                <th colspan="8" style="height: 50px">DADOS DO PROFISSIONAL ASSOCIADO DA APSB <br />
                </th>
            </tr>
            <tr>
                <td colspan="2">NOME:</td>
                <td colspan="6"><asp:Label ID="lbNomeProfissional" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="2">CPF:</td>
                <td colspan="6"><asp:Label ID="lbProfissionalCPF" runat="server" CssClass="cpf" /></td>
            </tr>

            <tr class="hidden">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <div class="text">
            <p>&nbsp&nbsp&nbsp Autorizo a empresa supracitada a efetuar o pagamento de meus honorários profissionais, decorrentes dos meus atendimentos realizados em suas dependências e em nome da empresa, por meio de repasse para a APSB, da qual sou associado.</p>
            <p>&nbsp&nbsp&nbsp Estou ciente de que, em decorrência do referido repasse, não se estabelece nenhum vínculo empregatício, previdenciário ou tributário entre a APSB e a empresa supracitada nesta autorização, e nem entre a referida empresa e o profissional associado da APSB que prestará atendimento em suas dependências, correndo por conta exclusiva da APSB a relação de associação dos profissionais baseada nas leis associativas vigentes e no estatuto da Associação.</p>
            <p>&nbsp&nbsp&nbsp Estou de acordo que as minhas eventuais produtividades profissionais, geradas em nome da empresa supracitada, serão pagas com base nos relatórios gerados por esta empresa, e quando necessário, confirmadas por mim. Estou de acordo que APSB não se responsabiliza por atraso ou não repasses de honorários pela clinica ou hospital.</p>
            <p>&nbsp&nbsp&nbsp Estou ciente de que o referido repasse será realizado por meio de depósito na conta da APSB, em função da emissão de NF entregue pela Associação, e que a partir do referido depósito a responsabilidade pelo pagamento passa a ser integralmente da APSB e aguardarei 2(dois) dias útéis para validação e repasse. A taxa administrativa cobrada pela APSB será de _10_% dos honorários repassados, podendo vir a ser renegociada futuramente.</p>
        </div>
        <div class="TextLeft">
            <asp:Label ID="lbData" runat="server" />
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="text-align: center;">
            <tr>
                <td style="width: 350px; border: hidden; text-align: center">
                    <hr />
                    <asp:Label ID="lbNomeAss" runat="server" /><br />
                    CPF:
                    <asp:Label ID="lbCPF" runat="server" CssClass="cpf" />
                </td>
                <td style="width: 100px; border: hidden"></td>
                <td style="width: 350px; border: hidden; text-align: center">
                    <hr />
                    <br />
                    APSB
                    <br />
                </td>
            </tr>
        </table>
    </form>
    <br />
    <br />
    <br />
    <footer>
        <hr />
        Associação dos Profissionais de Saúde de Brasília – APSB. Site: www.apsb.com.br Quadra 708/709 Norte, Bloco “A”, Entrada 13, 2º Andar, sala 201,
                    <br />
        Brasília-DF. CEP: 70.741-610 Telefones 3962-3022 E-mail: comercial@apsb.com.br
    </footer>
    <script type="text/javascript" src="../Scripts/jquery.mask.js"></script>
    <script type="text/javascript" src="../Scripts/Site.js"></script>
    <script>
        window.addEventListener("load", function () {
            window.print();
        });
    </script>
</body>
</html>
