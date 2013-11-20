using Facebook;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class SignIn : System.Web.UI.Page
{

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var gebruiker = txtGebruikersnaam.Text;
        var wachtwoord = txtWachtwoord.Text;
        Boolean toegelaten = false;
        BLLUser BllCheckUser = new BLLUser();
       
        
        User newUser = new User();

        newUser.gebruikersnaam = gebruiker;
        newUser.wachtwoord = wachtwoord;


        toegelaten = BllCheckUser.Checker(newUser);

        if (toegelaten == true)
        {
            Session.Add("gebruikersnaam", gebruiker);
            Response.Redirect("~/Home.aspx");
        }
        else
        {
            lblwerkt.Text = "werkt niet";
        }
    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("~/CreateUser.aspx");
    }
    protected void btnNietlog_Click(object sender, EventArgs e)
    {
        
        var gebruikers ="";
        Session.Add("gebruikersnaam", gebruikers);
        Response.Redirect("~/Home.aspx");
        
    }


    protected void Login(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        FaceBookConnect.API_Key = "249728251846520";
        FaceBookConnect.API_Secret = "1d01c361395c681d29ec84ba2a4aedc2";

        if (!IsPostBack)
        {
            if (Request.QueryString["error"] == "access_denied")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User has denied access.')", true);
                return;
            }

            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                string data = FaceBookConnect.Fetch(code, "me");
                FaceBookUser faceBookUser = new JavaScriptSerializer().Deserialize<FaceBookUser>(data);
               
                
                btnLogin.Enabled = false;

                User newUser = new User();
                BLLUser BLLAddUsers = new BLLUser();

                var voornaam = faceBookUser.First_Name;
                var naam = faceBookUser.Last_Name;
                var email = faceBookUser.Email;
                var wachtwoord = "";
                var gebruikersnaam = faceBookUser.UserName;
                Boolean toegestaan = false;


                newUser.wachtwoord = wachtwoord;
                newUser.gebruikersnaam = gebruikersnaam;
                toegestaan = BLLAddUsers.Checker(newUser);
                if (toegestaan == true)
                {
                    lblwerkt.Text = "gebruiker bestaat al";
                    Session.Add("gebruikersnaam", newUser.gebruikersnaam);
                    Response.Redirect("~/Home.aspx");
                    
                }
                else
                {
                    newUser.email = email;
                    newUser.voornaam = voornaam;
                    newUser.naam = naam;
                    newUser.rol = "visitor";
                    BLLAddUsers.insert(newUser);
                    Session.Add("gebruikersnaam", newUser.gebruikersnaam);
                    Response.Redirect("~/Home.aspx");
       
                }
            }
        }
    }
    public class FaceBookUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
        public string Email { get; set; }
    }
}