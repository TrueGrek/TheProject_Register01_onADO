<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TheProject_Register01_onADO._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
    <link href="signin.css" rel="stylesheet">

        <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

</head>
<body class="text-center">
    <form class="form-signin" id="form1" runat="server">
  <img class="mb-4" src="doge.gif" alt="" width="100" height="100">
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    
  

  <asp:TextBox id="inputLogin" runat="server"  CssClass="form-control mb-1" placeholder="Login" required autofocus></asp:TextBox>
  <asp:TextBox id="inputPassword" runat="server" type="password" CssClass="form-control" placeholder="Password" required></asp:TextBox>

  <asp:Button ID="Button1" CssClass="btn btn-lg btn-primary btn-block mb-2" type="submit" runat="server" Text="Sign in" OnClick="Button1_Click" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/defaultReg.aspx">Ещё нет аккаунта?</asp:HyperLink>
        <asp:Label ID="Label1" Visible="false" runat="server" Text="Неправильно набран логин или пароль" ForeColor="Red"></asp:Label>
  <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
</form>
</body>
</html>
