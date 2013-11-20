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
               
                pnlFaceBookUser.Visible = true;
                lblId.Text = faceBookUser.Id;
                lblUserName.Text = faceBookUser.UserName;
                lblName.Text = faceBookUser.Name;
                lblEmail.Text = faceBookUser.Email;
                ProfileImage.ImageUrl = faceBookUser.PictureUrl;
                btnLogin.Enabled = false;
            }
        }
    }
    public class FaceBookUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserName { get; set; }
        public string PictureUrl { get; set; }
        public string Email { get; set; }
    }
}