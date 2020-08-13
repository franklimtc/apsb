<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastroCristalina.aspx.cs" Inherits="Site.Fichas.CadastroCristalina" %>

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
            height: 30px;
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

        .header {
            width: 800px;
            text-align: center;
        }

        .barCris {
            width: 800px;
            height: 30px;
            border-color: rgb(252, 192, 38);
            background-color: rgb(252, 192, 38);
        }
    </style>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
            </Scripts>
        </asp:ScriptManager>
        <div class="header">
            <asp:Image ImageUrl="~/assets/img/cristalina-logo.jpg" runat="server" Width="300px" />
            <asp:Image ImageUrl="~/assets/img/yBar.jpg" runat="server" Width="850px"/>
            <br />
            <h3>FICHA CADASTRAL/ CADASTRO DE PROFISSIONAIS DE SAÚDE</h3>
        </div>
        <table>
            <tr>
                <td colspan="7">Nome: <asp:Label  ID="tbNome" runat="server" /></td>
                <td colspan="1">Sexo: <asp:Label  ID="tbSexo" runat="server" /></td>
            </tr>
             <tr>
                <td colspan="6">Endereço: <asp:Label  ID="tbEndereco" runat="server" /></td>
                <td colspan="2">CEP: <asp:Label  ID="tbCEP" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="6">Bairro:<asp:Label  ID="tbBairro" runat="server" /></td>  
                <td colspan="2">Fone:<asp:Label  ID="tbFone" runat="server" /></td>  
            </tr>
            <tr>
                <td colspan="5">Cidade:<asp:Label  ID="tbCidade" runat="server" /></td>  
                <td colspan="1">UF:<asp:Label  ID="tbUF" runat="server" /></td>  
                <td colspan="2">Cel:<asp:Label  ID="tbCelular" runat="server" /></td>  
            </tr>
            <tr>
                <td colspan="8">Email:<asp:Label  ID="tbEmail" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4">Naturalidade:<asp:Label  ID="tbNaturalidade" runat="server" /></td>
                <td colspan="2">UF: <asp:Label  ID="tbUFNaturalidade" runat="server" /></td>
                <td colspan="2">DN:<asp:Label  ID="tbDataNascimento" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4">RG:<asp:Label  ID="tbRG" runat="server" /></td>
                <td colspan="2">Data Exp.:<asp:Label  ID="tbDataExp" runat="server" /></td>
                <td colspan="2">Org. Exp.:<asp:Label  ID="tbOrgExp" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4">CPF:<asp:Label  ID="tbCPF" runat="server" /></td>
                <td colspan="4">PIS/PASEP/NIT:<asp:Label  ID="tbPIS" runat="server" /></td>
            </tr>
             <tr>
                <td colspan="4">Registro no Conselho:<asp:Label  ID="tbConselho" runat="server" /></td>
                <td colspan="4">Estado Civil:<asp:Label  ID="tbEstCivil" runat="server" /></td>
            </tr>
             <tr>
                <td colspan="4">Título Eleitor:<asp:Label  ID="tbTitulo" runat="server" /></td>
                <td colspan="2">Zona:<asp:Label  ID="tbZona" runat="server" /></td>
                <td colspan="2">Seção:<asp:Label  ID="tbSecao" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="8">Nome da mãe:<asp:Label  ID="tbMae" runat="server" /></td>
            </tr>
             <tr>
                <td colspan="8">Nome do pai:<asp:Label  ID="tbPai" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="8">Nome do cônjuge:<asp:Label  ID="tbConjuge" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="8">Formação:<asp:Label  ID="tbFormacao" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="8">Especialidade:<asp:Label  ID="tbEspecialidade" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="8">Pós-Graduação:<asp:Label  ID="tbPosGraduacao" runat="server" /></td>
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
            <tr class="hidden">
                <th colspan="8">
                    DADOS PROFISSIONAIS (PREENCHIMENTO PELA SECRETARIA DE SAÚDE)
                </th>
            </tr>
            <tr>
                <td colspan="8">Lotação:</td>
            </tr>
            <tr>
                <td colspan="8">Setor de Lotação:</td>
            </tr>
            <tr>
                <td colspan="4">Função:</td>
                <td colspan="4">Credenciamento:</td>
            </tr>
             <tr>
                <td colspan="4">Cargo:</td>
                <td colspan="4">Início:</td>
            </tr>
            <tr>
                <td colspan="4">Carga horária:</td>
                <td colspan="4">Término:</td>
            </tr>
            <tr>
                <td colspan="4">Valor por plantão:</td>
                <td colspan="4">Ficha Orçamentária:</td>
            </tr>
            <tr>
                <td colspan="8">Adicional:</td>
            </tr>
            <tr>
                <td colspan="4">Valor do Adicional:</td>
                <td colspan="4">Valor Global:</td>
            </tr>
        </table>
        <div class="TextLeft">
            <br />
            <label>Cristalina-GO, _______ de ______________________ de 20_____.</label>
        </div>
    </form>
    <br />
    <br />
    <br />
    <br />
    <asp:Image ImageUrl="~/assets/img/cristalina-footer.jpg" runat="server" Height="100px"/>
</body>
</html>
