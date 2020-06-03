<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Site.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        img {
            max-width: 65px;
        }
        .svgMini {
            width:20px;
        }
    </style>
    <br />
    <h2>Dashboard</h2>
    <hr />
    <br />
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">Receitas efetivadas</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <asp:Image ImageUrl="~/Content/Icons/preco.svg" runat="server" />
                        </div>
                        <div class="col">
                            <h1 class="text-success">150k</h1>
                        </div>
                    </div>

                </div>
                <div class="card-footer">
                    <asp:Image ImageUrl="~/Content/Icons/time-outline.svg" runat="server" CssClass="svgMini" />&nbsp<span>Atualizado em 10:20</span>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">Receitas pendentes</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <asp:Image ImageUrl="~/Content/Icons/preco.svg" runat="server" />
                        </div>
                        <div class="col">
                            <h1 class="text-warning">35k</h1>
                        </div>
                    </div>

                </div>
                <div class="card-footer">
                    <asp:Image ImageUrl="~/Content/Icons/time-outline.svg" runat="server" CssClass="svgMini" />&nbsp<span>Atualizado em 10:20</span>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">Despesas</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <asp:Image ImageUrl="~/Content/Icons/preco.svg" runat="server" />
                        </div>
                        <div class="col">
                            <h1 class="text-danger">150k</h1>
                        </div>
                    </div>

                </div>
                <div class="card-footer">
                    <asp:Image ImageUrl="~/Content/Icons/time-outline.svg" runat="server" CssClass="svgMini" />&nbsp<span>Atualizado em 10:20</span>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h6 class="card-title">Repasses pendentes</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <asp:Image ImageUrl="~/Content/Icons/preco.svg" runat="server" />
                        </div>
                        <div class="col">
                            <h1 class="text-warning">150k</h1>
                        </div>
                    </div>

                </div>
                <div class="card-footer">
                    <asp:Image ImageUrl="~/Content/Icons/time-outline.svg" runat="server" CssClass="svgMini" />&nbsp<span>Atualizado em 10:20</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
