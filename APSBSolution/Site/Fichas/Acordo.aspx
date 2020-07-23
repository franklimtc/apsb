<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acordo.aspx.cs" Inherits="Site.Fichas.Acordo" %>

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
        <h2>ACORDO</h2>
        <div class="text">
            <p>&nbsp&nbsp&nbsp A Associação de Profissionais de Saúde de Brasília – APSB, CNPJ 21.975.267/0001-74, é uma SOCIEDADE SEM FINS LUCRATIVOS cuja missão é contribuir para a integração do mercado de saúde do Distrito Federal, proporcionando o relacionamento e a cooperação entre profissionais e empresas.</p>
            <p>&nbsp&nbsp&nbsp A APSB faz a intermediação com clínicas e hospitais para recebimento de honorários por meio de emissão de NF em favor do associado, e consequente entrega de comprovante de rendimentos anuais do profissional para a declaração no imposto de renda.</p>
            <p>&nbsp&nbsp&nbsp A APSB declara a seus Associados que, ainda que prevista essa possibilidade em seu Estatuto, não faz cobrança de recolhimento de mensalidade dos Associados, e que não haverá nenhuma outra cobrança de valores nem mesmo no momento do desligamento do Associado, seja o desligamento por iniciativa da APSB ou por iniciativa do Associado, caso ocorra. A APSB fará apenas o desconto nos repasses, acordado individualmente com cada Associado e R$ 60,00 para abertura de cadastro de filiação.</p>
            <p>&nbsp&nbsp&nbsp A APSB declara ainda que se por ventura futuramente vier a cobrar alguma taxa ou mensalidade que esta será feita a partir da data em que tal cobrança foi determinada e, portanto, valerá para os novos Associados e não afetará os Associados já existentes.</p>
            <p>&nbsp&nbsp&nbsp A APSB não constitui a fonte pagadora dos honorários profissionais, e desta forma fica vinculado o depósito da empresa onde o profissional trabalha para que seja possível fazer o referido repasse. O compromisso da APSB é de repassar os honorários ao profissional assim que receber os recursos, transferindo o devido valor para a conta indicada pelo associado com o desconto da taxa administrativa acordada, além de aguardar 2(dois) dias útéis para validação e repasse para a conta do profissional.</p>
            <p>&nbsp&nbsp&nbsp Baseado no exposto acima <b>DECLARO ESTAR CIENTE</b> da natureza operacional da APSB e de que a APSB não pode ser responsabilizada ao não depositar ou atrasar o depósito de meus honorários profissionais (repasse) QUANDO A CLÍNICA/HOSPITAL, QUE É A FONTE PAGADORA NA QUAL REALIZO A PRESTAÇÃO DE SERVIÇO, NÃO DEPOSITAR MEUS RENDIMENTOS NA CONTA DA APSB EM PRAZO HÁBIL e a validação das informações.</p>

        </div>
        <br />
        <br />
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
    </form>
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
