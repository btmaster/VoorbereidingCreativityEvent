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
        <script src="scripts/all.js" type="text/javascript"></script>
<<<<<<< HEAD
        
    
=======
        <script>$("document").ready(function () {
            // Initialize the SDK upon load
            FB.init({
                appId: '419477641511868', // App ID
                channelUrl: 'http://localhost:50000/project/SignIn.aspx', // Path to your Channel File
                scope: 'id,name,gender,user_birthday,email', // This to get the user details back from Facebook
                status: true, // check login status
                cookie: true, // enable cookies to allow the server to access the session
                xfbml: true  // parse XFBML
            });
            // listen for and handle auth.statusChange events
            FB.Event.subscribe('auth.statusChange', OnLogin);
            });
            // This method will be called after the user login into facebook.
            function OnLogin(response) {
                if (response.authResponse) {
                    FB.api('/me?fields=id,name,gender,email,birthday', LoadValues);
                }
            }

            //This method will load the values to the labels
            function LoadValues(me) {
                if (me.name) {
                    document.getElementById('displayname').innerHTML = me.name;
                    document.getElementById('FBId').innerHTML = me.id;
                    document.getElementById('DisplayEmail').innerHTML = me.email;
                    document.getElementById('Gender').innerHTML = me.gender;
                    document.getElementById('DOB').innerHTML = me.birthday;
                    document.getElementById('auth-loggedin').style.display = 'block';
                }
            }
        </script>
        <script>
          // Load the SDK Asynchronously
          (function (d) {
              var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
              if (d.getElementById(id)) { return; }
              js = d.createElement('script'); js.id = id; js.async = true;
              js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
              ref.parentNode.insertBefore(js, ref);
          } (document));
      </script>
>>>>>>> 6ed2f8254a1300e0f3644d77a6d1a9a860b7fa78

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

     <asp:Button ID="Button1" runat="server" Text="Login with FaceBook" OnClick="Login" />
<asp:Panel ID="pnlFaceBookUser" runat="server" Visible="false">
<hr />
<table>
    <tr>
        <td rowspan="5" valign="top">
            <asp:Image ID="ProfileImage" runat="server" Width="50" Height="50" />
        </td>
    </tr>
    <tr>
        <td>ID:<asp:Label ID="lblId" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>UserName:<asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>Name:<asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <td>Email:<asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
    </tr>
</table>
</asp:Panel>
    
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
