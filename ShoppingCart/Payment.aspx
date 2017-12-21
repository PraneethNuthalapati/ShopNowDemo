<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ShoppingCart.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="margin-left:350px;margin-top:100px;margin-bottom:250px">
        <tr>
            <td>
                <asp:Button ID="btnGenerateBill" runat="server" Text="GenerateBill" OnClick="btnGenerateBill_Click" />
            </td>
            <td>
                <asp:Button ID="btnMenu" runat="server" Text="Continue Shopping" OnClick="btnMenu_Click" />
            </td>
        </tr>
        <tr>

            <td colspan="2">
                <asp:Label ID="lblTv" runat="server" ></asp:Label></td>
            
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMobile" runat="server" ></asp:Label>
            </td>
        </tr>
    </table>
    

</asp:Content>
