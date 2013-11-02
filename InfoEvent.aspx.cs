using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InfoEvent : System.Web.UI.Page
{
    string gebruiker = "";
    int eventId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        gebruiker = (string)(Session["gebruikersnaam"]);
        lblgebruiker.Text = gebruiker;

        eventId = (int)(Session["eventid"]);
        lblEventid.Text = Convert.ToString(eventId);
        DALAanwezig SelectEvent = new DALAanwezig();
        IList<Aanwezig> Events = SelectEvent.SelectEvent(eventId);
        rptAanwezig.DataSource = Events;
        rptAanwezig.DataBind();


    }
}