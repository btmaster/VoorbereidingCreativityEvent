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
        BLLAanwezig SelectAanwezig = new BLLAanwezig();
        BLLUser SelectUser = new BLLUser();
        IList<int> Events = SelectAanwezig.SelectAllAanwezige(eventId);
        var Aanwezigen = new List<string>();
        

        foreach (int row in Events)
        {
            int id = row;
            List<string> TussenAanwezig = SelectUser.selectAanwezigen(id);
            var persoon = TussenAanwezig[0];
            Aanwezigen.Add(persoon);
        } 


        rptAanwezig.DataSource = Aanwezigen;
        rptAanwezig.DataBind();


    }
}