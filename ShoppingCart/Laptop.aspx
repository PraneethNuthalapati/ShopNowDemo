<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Laptop.aspx.cs" Inherits="ShoppingCart.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin-left:200px;margin-top:100px;margin-bottom:250px;height:200px;width:400px">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Samsung Laptops"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="(50000)"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSamsung" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Dell"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="(35000)"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDell" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Lenovo"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="(45000)"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlLenovo" runat="server">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" />   
            </td>
        </tr>
    </table>
</asp:Content>
