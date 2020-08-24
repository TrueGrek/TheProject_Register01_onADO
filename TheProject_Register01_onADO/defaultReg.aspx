<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="defaultReg.aspx.cs" Inherits="TheProject_Register01_onADO.defaultReg" %>

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
  <h1 class="h3 mb-3 font-weight-normal">Create an account</h1>

  <asp:TextBox id="inputLogin2" runat="server"  CssClass="form-control mb-1" placeholder="Login" required autofocus></asp:TextBox>
  <asp:TextBox id="inputPassword2" runat="server" type="password" CssClass="form-control mb-1" placeholder="Password" required ControlToCompare="inputPassword2"></asp:TextBox>
  <asp:TextBox id="inputPassword22" runat="server" type="password" CssClass="form-control mb-1" placeholder="Repeat Password" required></asp:TextBox>
        <%//делаю через compare ибо умею, а не умный %>
        <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="mb-1" ForeColor="Red" ErrorMessage="Пароли не совпадают" ControlToValidate="inputPassword22" ControlToCompare="inputPassword2"></asp:CompareValidator>

  <asp:Button ID="Button1" CssClass="btn btn-lg btn-primary btn-block mb-2" type="submit" runat="server" Text="Sign in" OnClick="Button1_Click" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Уже есть аккаунт?</asp:HyperLink>
  <p class="mt-5 mb-3 text-muted">&copy; 2020</p>
</form>
</body>
</html>
