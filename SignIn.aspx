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

     <div id="fb-root"></div> <!-- This initializes the FB controls-->   
        <div class="fb-login-button" autologoutlink="true" scope="user_birthday,email" >
        Login with Facebook
     </div> <!-- FB Login Button -->   
        <!-- Details --> 
        <div id="auth-status">    
        <div id="auth-loggedin" style="display: none">
            Hi, <span id="displayname"></span><br/>
            Your Facebook ID : <span id="FBId"></span><br/>
            Your Email : <span id="DisplayEmail"></span><br/>
            Your Sex:, <span id="Gender"></span><br/>
            Your Date of Birth :, <span id="DOB"></span><br/>        
    </div>
    </div>
    
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
