<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateEvent.aspx.cs" Inherits="CreateEvent"MasterPageFile="~/MasterPage.master"%>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <title>Create  Events</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="ContentHeadCenter" runat="server">
    <div class="page-header">
        <asp:Label Text="Maak een nieuw event aan" runat="server"  CssClass="h1"></asp:Label>
    </div>
        <asp:Label ID="lblTitel" runat="server" AssociatedControlID="txtTitel" Text="Titel"></asp:Label>
        <asp:TextBox ID="txtTitel" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTitel" runat="server" ControlToValidate="txtTitel" ErrorMessage="Gelieve dit in te vullen"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblInformatie" runat="server" AssociatedControlID="txtInformatie" Text="Informatie"></asp:Label>
        <asp:TextBox ID="txtInformatie" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvInformatie" runat="server" ControlToValidate="txtInformatie" ErrorMessage="Gelieve dit in te vullen"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblDatum" runat="server" AssociatedControlID="clDatum" Text="Datum"></asp:Label>
        <asp:Calendar ID="clDatum" runat="server" SelectedDate="10/30/2013 18:03:17" ></asp:Calendar>
        <br />
        <asp:Button ID="btnMaak" runat="server" OnClick="btnMaak_Click" Text="Maak aan" CssClass="btn btn-primary btn-large" />
        <p>
            <asp:Label ID="lblGebruiker" runat="server" Text="gebruiker" ></asp:Label>
        </p>

</asp:Content>