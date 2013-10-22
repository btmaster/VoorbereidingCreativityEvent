<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblGebruikersnaam" runat="server" AssociatedControlID="txtGebruikersnaam" Text="Gebruikersnaam"></asp:Label>
        <asp:TextBox ID="txtGebruikersnaam" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGebruiker" runat="server" ControlToValidate="txtGebruikersnaam" ErrorMessage="Dit mag niet leeg blijven"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblWachtwoord" runat="server" AssociatedControlID="txtWachtwoord" Text="Wachtwoord"></asp:Label>
        <asp:TextBox ID="txtWachtwoord" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvWachtwoord" runat="server" ControlToValidate="txtWachtwoord" ErrorMessage="Dit mag niet leeg blijven"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in" />
        <br />
        <asp:Label ID="lblwerkt" runat="server" Text=""></asp:Label>
    
    </div>
    </form>
</body>
</html>
