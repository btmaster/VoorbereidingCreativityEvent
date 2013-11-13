using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


    protected void Page_Load(object sender, EventArgs e)
    {
        
        


        
    }
}