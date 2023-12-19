<%@ Page Title="" Language="C#" MasterPageFile="~/Examen3.Master" AutoEventWireup="true" CodeBehind="ReporteEncuestas.aspx.cs" Inherits="Examen3_EstebanVallejos.ReporteEncuestas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <h1>Reporte de Encuestas</h1>
        <asp:GridView ID="EncuestasGrid" runat="server" AutoGenerateColumns="True" CssClass="mydatagrid">
        </asp:GridView>
    </div>
</asp:Content>