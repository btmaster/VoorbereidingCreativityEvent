using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateEvent : System.Web.UI.Page
{
    String gebruiker = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        gebruiker = (string)(Session["gebruikersnaam"]);
    }
    protected void btnMaak_Click(object sender, EventArgs e)
    {
        int ideigenaar = 0;

        BLLUser inladen = new BLLUser();
        IList<User> lijst = inladen.selectgebruiker(gebruiker);
        User eigenaar = lijst[0];
        ideigenaar = eigenaar.Id;

        BLLEvent maakaan = new BLLEvent();
        Event newEvent = new Event();
        newEvent.naam = txtTitel.Text;
        newEvent.informatie = txtInformatie.Text;
        newEvent.datum = clDatum.SelectedDate;
        newEvent.eigenaar = ideigenaar;
        newEvent.visitors = 1;
        maakaan.insert(newEvent);
        
        Session.Add("gebruikersnaam", gebruiker);
        Response.Redirect("~/Home.aspx");

    }
}