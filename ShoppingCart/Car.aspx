<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Car.aspx.cs" Inherits="ShoppingCart.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin-left:200px;margin-top:100px;margin-bottom:250px;height:200px;width:400px">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="I20"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="(500000)"></asp:Label>
            </td>
            <td><asp:DropDownList ID="ddlI20" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Zen"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="(600000)"></asp:Label>
            </td>
            <td><asp:DropDownList ID="ddlZen" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Ritz"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="(700000)"></asp:Label>
            </td>
            <td><asp:DropDownList ID="ddlRitz" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAddCar" runat="server" Text="Add to Cart" OnClick="btnAddCar_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
