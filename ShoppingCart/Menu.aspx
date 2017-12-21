<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ShoppingCart.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:90%">
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click"/>
    </div>
    
    <table style="margin-left:350px;margin-top:100px;margin-bottom:250px">
        <tr>
            <td>
                <a href="TV.aspx">
                <asp:Label ID="Label1" runat="server" Text="Tv" ></asp:Label>
                    </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="Fridge.aspx">
                <asp:Label ID="Label2" runat="server" Text="Fridge"></asp:Label>
                    </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="Mobile.aspx">
                <asp:Label ID="Label3" runat="server" Text="Mobile"></asp:Label>
                    </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="Laptop.aspx">
                <asp:Label ID="Label4" runat="server" Text="Laptop"></asp:Label></a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="Car.aspx">
                <asp:Label ID="Label5" runat="server" Text="Car"></asp:Label>
                    </a>
            </td>
        </tr>
    </table>
    
</asp:Content>
