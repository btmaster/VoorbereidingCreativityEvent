using Facebook;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.FaceBookAPI;
using ASPSnippets.TwitterAPI;
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


    protected void LoginFacebook(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }

    protected void LoginTwitter(object sender, EventArgs e)
    {
        if (!TwitterConnect.IsAuthorized)
        {
            TwitterConnect twitter = new TwitterConnect();
            twitter.Authorize(Request.Url.AbsoluteUri.Split('?')[0]);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //Facebook
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



        //Twitter
        TwitterConnect.API_Key = "119463787-1UYWPMHNNg3YblS4D1Je36FBtdV9vDOHnP42Eowi";
        TwitterConnect.API_Secret = "PbbNaKpM4Fr7hVUE816pOx36NBpAk9LBKqKCGMt7Vv0Kh";
        if (!IsPostBack) if (!IsPostBack)
            {
                if (TwitterConnect.IsAuthorized)
                {
                    TwitterConnect twitter = new TwitterConnect();

                    //LoggedIn User Twitter Profile Details
                    DataTable dt = twitter.FetchProfile();
                    imgProfile.ImageUrl = dt.Rows[0]["profile_image_url"].ToString();
                    lblName.Text = dt.Rows[0]["name"].ToString();
                    lblTwitterId.Text = dt.Rows[0]["Id"].ToString();
                    lblScreenName.Text = dt.Rows[0]["screen_name"].ToString();
                    lblDescription.Text = dt.Rows[0]["description"].ToString();
                    lblTweets.Text = dt.Rows[0]["statuses_count"].ToString();
                    lblFollowers.Text = dt.Rows[0]["followers_count"].ToString();
                    lblFriends.Text = dt.Rows[0]["friends_count"].ToString();
                    lblFavorites.Text = dt.Rows[0]["favourites_count"].ToString();
                    lblLocation.Text = dt.Rows[0]["location"].ToString();
                    tblTwitter.Visible = true;

                    //Any other User Twitter Profile Details. Here jQueryFAQs
                    dt = twitter.FetchProfile("jQueryFAQs");
                    imgOtherProfile.ImageUrl = dt.Rows[0]["profile_image_url"].ToString();
                    lblOtherName.Text = dt.Rows[0]["name"].ToString();
                    lblOtherTwitterId.Text = dt.Rows[0]["Id"].ToString();
                    lblOtherScreenName.Text = dt.Rows[0]["screen_name"].ToString();
                    lblOtherDescription.Text = dt.Rows[0]["description"].ToString();
                    lblOtherTweets.Text = dt.Rows[0]["statuses_count"].ToString();
                    lblOtherFollowers.Text = dt.Rows[0]["followers_count"].ToString();
                    lblOtherFriends.Text = dt.Rows[0]["friends_count"].ToString();
                    lblOtherFavorites.Text = dt.Rows[0]["favourites_count"].ToString();
                    lblOtherLocation.Text = dt.Rows[0]["location"].ToString();
                    tblOtherTwitter.Visible = true;

                    btnLogin.Enabled = false;
                }
                if (TwitterConnect.IsDenied)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "alert('User has denied access.')", true);
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