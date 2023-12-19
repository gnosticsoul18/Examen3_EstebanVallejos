<%@ Page Title="" Language="C#" MasterPageFile="~/Examen3.Master" AutoEventWireup="true" CodeBehind="AgregarEncuesta.aspx.cs" Inherits="Examen3_EstebanVallejos.AgregarEncuestaPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formulario-container">
     
        <h2>Agregar Encuesta</h2>

        <div class="form-group">
            <asp:Label ID="lNombre" runat="server" Text="Nombre:" CssClass="add-asterisk"></asp:Label>
            <asp:TextBox ID="tNombre" runat="server" CssClass="form-control add-asterisk" Required="true"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lEdad" runat="server" Text="Edad:" CssClass="add-asterisk"></asp:Label>
            <asp:TextBox ID="tEdad" runat="server" CssClass="form-control add-asterisk" ValidationGroup="Encuesta" Required="true" TextMode="Number"></asp:TextBox>
            <asp:RangeValidator ID="rvEdad" runat="server" ControlToValidate="tEdad" Type="Integer" MinimumValue="18" MaximumValue="50"
                ErrorMessage="La edad debe estar entre 18 y 50" Text="*" ForeColor="Red" ValidationGroup="Encuesta"></asp:RangeValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="lEmail" runat="server" Text="Email:" CssClass="add-asterisk"></asp:Label>
            <asp:TextBox ID="tEmail" runat="server" CssClass="form-control add-asterisk" Required="true" TextMode="Email"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ErrorMessage="Ingrese un correo electrónico válido" Text="*" ForeColor="Red" ValidationGroup="Encuesta"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="lPartido" runat="server" Text="Partido Político:" CssClass="add-asterisk"></asp:Label>
            <asp:DropDownList ID="dPartido" runat="server" CssClass="form-control add-asterisk" Required="true">
                <asp:ListItem Text="Seleccionar" Value="" />
                <asp:ListItem Text="PLN" Value="PLN" />
                <asp:ListItem Text="PUSC" Value="PUSC" />
                <asp:ListItem Text="PAC" Value="PAC" />
            </asp:DropDownList>
        </div>

        <asp:Button ID="btnEnviar" runat="server" Text="Enviar Encuesta" CssClass="btn btn-primary" ValidationGroup="Encuesta" OnClick="btnEnviar_Click" />
    </div>
</asp:Content>
