<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/CSS/home.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Label ID="lblUser" runat="server" Text="User"></asp:Label>
        <br />
        <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
        <br />
        
        <br />
        <br />
        <asp:Repeater ID="rptEvents" runat="server" DataSourceID="ObjdsEvents">
            <HeaderTemplate>
                <table class="table table-striped">
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td>
                     <asp:LinkButton ID="btnInfoEvent" OnClick="btnInfoEvent_Click" CommandArgument='<%# Eval("id") %>' runat="server" >   <%# Eval("naam") %></asp:LinkButton>
                    </td>
                    <td>
                        <%# Eval("visitors") %>
                    </td>
                    <td id="verwijder">
                        <asp:LinkButton ID="btnAanwezig" OnClick="btnAanwezig_Click" CommandArgument='<%# Eval("id") %>' runat="server" Text="aanwezig"></asp:LinkButton>
                    </td>

                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="ObjdsEvents" runat="server" SelectMethod="SelectAllEvents" TypeName="BLLEvent"></asp:ObjectDataSource>
        
       
        <p>
            <asp:Button ID="btnMaakEvent" runat="server" OnClick="btnMaakEvent_Click" Text="Maak Event" />
        </p>
        
       
    </form>
</body>
</html>
