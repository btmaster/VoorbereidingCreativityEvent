<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap/bootstrap-theme.css" rel="stylesheet" />
    <link href="Content/bootstrap/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="Content/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <title>Sign In</title>
        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
  
</head>
<body>
 
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblGebruikersnaam" runat="server" AssociatedControlID="txtGebruikersnaam" Text="Gebruikersnaam"></asp:Label>
        <asp:TextBox ID="txtGebruikersnaam" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGebruiker" runat="server" ControlToValidate="txtGebruikersnaam" ErrorMessage="Dit mag niet leeg blijven" CssClass="alert-danger"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblWachtwoord" runat="server" AssociatedControlID="txtWachtwoord" Text="Wachtwoord"></asp:Label>
        <asp:TextBox ID="txtWachtwoord" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvWachtwoord" runat="server" ControlToValidate="txtWachtwoord" ErrorMessage="Dit mag niet leeg blijven" CssClass="alert-danger"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log in"  CssClass="btn btn-primary btn-large" />
        <br />
        <asp:Label ID="lblwerkt" runat="server" Text=""></asp:Label>

     <asp:Button ID="btnFacebook" runat="server" Text="Login with FaceBook" OnClick="LoginFacebook" />
    


        <asp:Button ID="btnTwitter" runat="server" Text="Login with Twitter" OnClick="LoginTwitter" />
<hr />





<table runat="server" id="tblTwitter" visible="false">
    <tr>
        <td colspan="2">
            <u>Logged in Twitter User's Profile</u>
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
            Profile Image
        </td>
        <td>
            <asp:Image ID="imgProfile" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Name
        </td>
        <td>
            <asp:Label ID="lblName" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Twitter Id
        </td>
        <td>
            <asp:Label ID="lblTwitterId" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Screen Name
        </td>
        <td>
            <asp:Label ID="lblScreenName" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Description
        </td>
        <td>
            <asp:Label ID="lblDescription" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Tweets
        </td>
        <td>
            <asp:Label ID="lblTweets" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Followers
        </td>
        <td>
            <asp:Label ID="lblFollowers" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Friends
        </td>
        <td>
            <asp:Label ID="lblFriends" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Favorites
        </td>
        <td>
            <asp:Label ID="lblFavorites" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Location
        </td>
        <td>
            <asp:Label ID="lblLocation" runat="server" />
        </td>
    </tr>
</table>
<br />
<table runat="server" id="tblOtherTwitter" visible="false">
    <tr>
        <td colspan="2">
            <u>Other Twitter User's Profile</u>
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
            Profile Image
        </td>
        <td>
            <asp:Image ID="imgOtherProfile" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Name
        </td>
        <td>
            <asp:Label ID="lblOtherName" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Twitter Id
        </td>
        <td>
            <asp:Label ID="lblOtherTwitterId" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Screen Name
        </td>
        <td>
            <asp:Label ID="lblOtherScreenName" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Description
        </td>
        <td>
            <asp:Label ID="lblOtherDescription" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Tweets
        </td>
        <td>
            <asp:Label ID="lblOtherTweets" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Followers
        </td>
        <td>
            <asp:Label ID="lblOtherFollowers" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Friends
        </td>
        <td>
            <asp:Label ID="lblOtherFriends" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Favorites
        </td>
        <td>
            <asp:Label ID="lblOtherFavorites" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            Location
        </td>
        <td>
            <asp:Label ID="lblOtherLocation" runat="server" />
        </td>
    </tr>
</table>












    </div>
        <br />
        <br />
        <p>
            <asp:Button ID="btnNietlog" runat="server" OnClick="btnNietlog_Click" Text="Log niet in" CssClass="btn" />
        </p>
        
        <p>
            <asp:Button ID="btnSignup" runat="server" OnClick="btnSignup_Click" Text="Sign up" CssClass="btn" />
        </p>
    </form>
    
</body>
</html>
