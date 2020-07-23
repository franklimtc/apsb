<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Site.Fichas.Cadastro" %>

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
            width: 850px;
            text-align: justify;
            text-justify: inter-word;
        }

        footer {
            font-size: 12px;
            text-align: center;
        }

        .TextLeft {
            text-align: right;
            width: 850px;
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
        <table>
            <thead>
                <tr>
                    <th colspan="8">TERMO DE ADESÃO DO ASSOCIADO
                    </th>
                </tr>
                <tr>
                    <th colspan="8">DADOS PESSOAIS DO TITULAR
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="7">Nome:
                        <asp:Label ID="lbNome" runat="server" /></td>
                    <td>Sexo:
                        <asp:Label ID="lbSexo" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">D. Nasc.:<asp:Label ID="lbDtNascimento" runat="server" />
                    </td>
                    <td colspan="2">CPF:<asp:Label ID="lbCPF" runat="server" CssClass="cpf" /></td>
                    <td colspan="2">RG:<asp:Label ID="lbRG" runat="server" /></td>
                    <td colspan="2">Org. Exp.:
                        <asp:Label ID="lbOrgExp" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="4">Nº Insc.Conselho Regional:
                        <asp:Label ID="lbNumInscr" runat="server" /></td>
                    <td colspan="4">Conselho Regional (Sigla/UF):
                        <asp:Label ID="lbConselho" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="4">Especialidade(s):
                        <asp:Label ID="lbEspecialidade" runat="server" /></td>
                    <td colspan="4">PIS:
                        <asp:Label ID="lbPis" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="6">Endereço:
                        <asp:Label ID="lbEndereco" runat="server" /></td>
                    <td colspan="2">CEP: <asp:Label ID="lbCEP" runat="server" CssClass="cep" /></td>
                </tr>
                <tr>
                    <td colspan="4">Bairro:
                        <asp:Label ID="lbBairro" runat="server" /></td>
                    <td colspan="4">Cidade/UF:
                        <asp:Label ID="lbCidade" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">Celular:
                        <asp:Label ID="lbCelular" runat="server" CssClass="phone_with_ddd" /></td>
                    <td colspan="6">E-mail:
                        <asp:Label ID="lbEmail" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="4">Título Eleitor:
                        <asp:Label ID="lbTitulo" runat="server" /></td>
                    <td colspan="4">CNH:
                        <asp:Label ID="lbCNH" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="4">Reservista:
                        <asp:Label ID="lbReservista" runat="server" /></td>
                    <td colspan="4">C. Trabalho:
                        <asp:Label ID="lbCTPS" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="3">Banco:
                        <asp:Label ID="lbBanco" runat="server" /></td>
                    <td colspan="2">Agência:
                        <asp:Label ID="lbAgencia" runat="server" /></td>
                    <td colspan="3">Conta:
                        <asp:Label ID="lbConta" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="8">OBSERVAÇÕES: o associado deverá entregar para a APSB no momento da adesão 3 (três) cópias autenticadas da sua carteira do conselho e comprovante de residência. Demais informações, deverão ser preenchidas em sua totalidade, necessárias para a efetivação da adesão, além de documentação adicional posteriormente solicitada quando necessária, inclusive para cadastro no E-SOCIAL. FAVOR PREENCHER DE FORMA LEGÍVEL. Temos prazo de 48 horas para analisar e cadastrar a documentação e posterior formalização com a clínica/hospital.</td>
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
            </tbody>
        </table>
        <div class="text">
            <p>TERMO DE ADESÃO DO ASSOCIADO: neste ato, resolvo aderir de livre e espontânea vontade ao Estatuto Social da Associação dos Profissionais de Saúde de Brasília – APSB, inscrita no CNPJ 21.975.267/0001-74, com sede na Quadra 708/709 Norte, Bloco “A”, Ed. Celebrate, ”, Entrada 13, 2º Andar, sala 201Brasília-DF, CEP: 70.741-610, doravante passando a figurar como membro estatutário, estando ciente que a aprovação definitiva ocorrerá após decisão da Assembleia Geral de Associados, da qual estarei autorizado a participar. Declaro ter ciência da taxa de R$ 60,00 para filiação. Declaro serem verdadeiras as informações declaradas no formulário Dados Pessoais do Titular acima.</p>
        </div>

        <div class="TextLeft">
            Brasília,
            <asp:Label ID="lbData" runat="server" />.
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="text-align: center;">
            <tr>
                <td style="width: 400px; border: hidden; text-align: center">
                    <hr />
                    <asp:Label ID="lbNomeAss" runat="server" /></td>
                <td style="width: 50px; border: hidden; text-align: center"></td>
                <td style="width: 400px; border: hidden; text-align: center">
                    <hr />
                    APSB</td>
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
</body>
</html>

