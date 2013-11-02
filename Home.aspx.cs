using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{

    string gebruiker = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
        gebruiker = (string)(Session["gebruikersnaam"]);
        lblUser.Text = gebruiker;
        BLLUser inladen = new BLLUser();
        IList<User> test = inladen.selectgebruiker(gebruiker);
        User tester = test[0];
        lblTest.Text = "Welkom " + tester.voornaam;

    }

   

    protected void btnAanwezig_Click(object sender, EventArgs e)
    {
      
        LinkButton btnAanwezig = (LinkButton)(sender);
        int id = Convert.ToInt16(btnAanwezig.CommandArgument);
        
        BLLEvent BLLEvent = new BLLEvent();
        BLLEvent.aanwezig(id);
        
        BLLUser inladen = new BLLUser();
        IList<User> test = inladen.selectgebruiker(gebruiker);
        User tester = test[0];

        Aanwezig aanwezigmaak = new Aanwezig();
        aanwezigmaak.EventId = id;
        aanwezigmaak.PersoonId = tester.Id;
        BLLAanwezig aanwezigmaken = new BLLAanwezig();
        aanwezigmaken.insert(aanwezigmaak);
        


        //tabel verversen
        rptEvents.DataBind();
        btnAanwezig.Attributes["style"] = "visibility: hidden";

    }

    protected void btnInfoEvent_Click(object sender, EventArgs e)
    {

        LinkButton btnInfoEvent = (LinkButton)(sender);
        int id = Convert.ToInt16(btnInfoEvent.CommandArgument);
        Session.Add("gebruikersnaam", gebruiker);
        Session.Add("eventid", id);
        Response.Redirect("~/InfoEvent.aspx");


    }


    protected void btnMaakEvent_Click(object sender, EventArgs e)
    {
        Session.Add("gebruikersnaam", gebruiker);
        Response.Redirect("~/CreateEvent.aspx");
        
    }
 
}