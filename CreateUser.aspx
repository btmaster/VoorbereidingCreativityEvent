<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create</title>
</head>

<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblNaam" runat="server" AssociatedControlID="txtNaam" Text="Naam"></asp:Label>
        <asp:TextBox ID="txtNaam" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqvLeeg1" runat="server" ControlToValidate="txtNaam" ErrorMessage="Mag niet leeg blijven"></asp:RequiredFieldValidator>
        <br />

        <asp:Label ID="lblVoornaam" runat="server" AssociatedControlID="txtVoornaam" Text="Voornaam"></asp:Label>
        <asp:TextBox ID="txtVoornaam" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rqvLeeg2" runat="server" ControlToValidate="txtVoornaam" ErrorMessage="Mag niet leeg blijven"></asp:RequiredFieldValidator>
        <br />

        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="E-mailadres"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Geen geldig e-mailadres" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />

        <asp:Label ID="lblGebruikersnaam" runat="server" AssociatedControlID="txtGebruikersnaam" Text="Gebruikersnaam"></asp:Label>
        <asp:TextBox ID="txtGebruikersnaam" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLeeg3" runat="server" ControlToValidate="txtGebruikersnaam" ErrorMessage="Mag niet leeg blijven"></asp:RequiredFieldValidator>
        <br />

        <asp:Label ID="lblWachtwoord" runat="server" AssociatedControlID="txtWachtwoord" Text="Wachtwoord"></asp:Label>
        <asp:TextBox ID="txtWachtwoord" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLeeg4" runat="server" ControlToValidate="txtWachtwoord" ErrorMessage="Mag niet leeg blijven"></asp:RequiredFieldValidator>
        <br />

        <asp:Label ID="lblWachtwoord2" runat="server" AssociatedControlID="txtWachtwoord2" Text="Herhaal wachtwoord"></asp:Label>
        <asp:TextBox ID="txtWachtwoord2" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="cvWachtwoord" runat="server" ControlToCompare="txtWachtwoord" ControlToValidate="txtWachtwoord2" ErrorMessage="Wachtwoord komt niet overeen"></asp:CompareValidator>
        <br />

        <asp:Button ID="btnSignup" runat="server" OnClick="btnSignup_Click" Text="Sign up" />
    
    </div>
        <asp:Label ID="lblinorde" runat="server"></asp:Label>
        <br />
        <br />
    </form>
</body>
</html>
