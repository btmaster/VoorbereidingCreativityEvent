<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateEvent.aspx.cs" Inherits="CreateEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblTitel" runat="server" AssociatedControlID="txtTitel" Text="Titel"></asp:Label>
        <asp:TextBox ID="txtTitel" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblInformatie" runat="server" AssociatedControlID="txtInformatie" Text="Informatie"></asp:Label>
        <asp:TextBox ID="txtInformatie" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblDatum" runat="server" AssociatedControlID="clDatum" Text="Datum"></asp:Label>
        <asp:Calendar ID="clDatum" runat="server" SelectedDate="10/30/2013 18:03:17"></asp:Calendar>
    
    </div>
        <asp:Button ID="btnMaak" runat="server" OnClick="btnMaak_Click" Text="Maak aan" />
        <p>
            <asp:Label ID="lblGebruiker" runat="server" Text="gebruiker"></asp:Label>
        </p>
    </form>
</body>
</html>
