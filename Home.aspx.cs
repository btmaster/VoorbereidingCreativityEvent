using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        
       
        string gebruiker = (string)(Session["gebruikersnaam"]);
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
        btnAanwezig.Visible = false;


        //tabel verversen
        rptEvents.DataBind();

    }
}