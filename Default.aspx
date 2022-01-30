<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="but1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   

    <h3>Futbolcu formu</h3>
    <table class="nav-justified user-form-table">
        <tr>
            <td style="height: 20px">
                Futbolcu ID</td>
            <td style="height: 20px">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Futbolcu Adı</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Futbolcu Soyadı</td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px">Futbolcu Yaşı</td>
            <td style="height: 20px">
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Number"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Aktif Futbolcu</td>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="height: 17px">Toplam gol</td>
            <td style="height: 17px">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 17px">Toplam asist</td>
            <td style="height: 17px">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 17px">Toplam sarı kart</td>
            <td style="height: 17px">
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 17px">Toplam kırmızı kart</td>
            <td style="height: 17px">
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
            <td style="height: 20px"></td>
        </tr>
        <tr>
            <td style="height: 26px"></td>
            <td style="height: 26px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Futbolcu ekle" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Futbolcuyu güncelle" />
                <asp:Button ID="Button3" runat="server" Text="Futbolcuyu sil" OnClick="Button3_Click" />
            </td>
        </tr>
        </table>

    <h3>
        Futbolcu tablosu                
    </h3>
    <asp:Label ID="Label1" runat="server" Text="Sıralama Ölçütü"></asp:Label>:
    <asp:DropDownList ID="DropDownList2" runat="server" >
        <asp:ListItem Value="ID">ID</asp:ListItem>
        <asp:ListItem Value="firstName">Adı</asp:ListItem>
        <asp:ListItem Value="lastName">Soyadı</asp:ListItem>
        <asp:ListItem Value="age">Yaşı</asp:ListItem>
        <asp:ListItem Value="active">Aktiflik durumu</asp:ListItem>
        <asp:ListItem Value="goals">Gol</asp:ListItem>
        <asp:ListItem Value="assists">Asist</asp:ListItem>
        <asp:ListItem Value="yellowCards">Sarı kart</asp:ListItem>
        <asp:ListItem Value="redCards">Kırmızı kart</asp:ListItem>        
    </asp:DropDownList>
    <asp:DropDownList ID="DropDownList3" runat="server" >
        <asp:ListItem Value="asc">Artan Sıralama</asp:ListItem>
        <asp:ListItem Value="desc">Azalan sıralama</asp:ListItem>
    </asp:DropDownList>
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Yenile" />
    <table class="user-table" style="">
        <thead>
            <tr>
                <th>ID</th>
                <th>Adı</th>
                <th>Soyadı</th>
                <th>Yaşı</th>
                <th>Aktiflik durumu</th>
                <th>Gol</th>
                <th>Asist</th>
                <th>Sarı kart</th>
                <th>Kırmızı kart</th>
            </tr>
        </thead>
        <tbody>
            <%=tableStr%>
        </tbody>
    </table>
    

<style>
    .user-table{
        table-layout: fixed; width: 100%;
    }

    .user-table, .user-table td, .user-table th {
         border: thin blue solid; border-collapse: collapse;
    }

    .user-table td, .user-table th{
        padding: 1px;
    }

    .user-form-table {
        border: thin solid rgba(120,140,168,0.3);             
    }

    .user-form-table td, .user-form-table th {
        padding: 0px 8px;
    }

    .auto-style1 {
        height: 22px;
    }

</style>   

</asp:Content>
