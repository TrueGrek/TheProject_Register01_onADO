<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Table.aspx.cs" Inherits="TheProject_Register01_onADO.Table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"/>

</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container col-12">
            <div class="py-5 text-center ">
                <asp:Label ID="Label2" runat="server" Visible="false" Text="У пользователя нет прав ни на один домен" Font-Size="X-Large"></asp:Label>
                <br />
                <asp:Button ID="Button2" runat="server" Text="Посмотреть таблицу всех пользователей" OnClick="Button2_Click" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="IdUser" HeaderText="IdUser" SortExpression="IdUser" />
                        <asp:BoundField DataField="Domens" HeaderText="Domens" SortExpression="Domens" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [IdUser], [Domens] FROM [Tables] WHERE ([IdUser] = @IdUser)">
                    <SelectParameters>
                        <asp:SessionParameter Name="IdUser" SessionField="idSS" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />

                <br class="mb-3"/>
                <h1>Insert in table</h1>
                Id:
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox><br />
                Domen(только существующие):<br/>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Domens" DataValueField="Domens">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Domens]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Tables]"></asp:SqlDataSource>
                <br class="mb-3"/>
                
                <asp:Button ID="Button1" runat="server" Text="Send" CssClass="btn-success" OnClick="Button1_Click"/><br />
                <asp:Label ID="Label1" Visible="false" runat="server" Text="Операция прошла успешно" ForeColor="#33CC33"></asp:Label>

            </div>
        </div>

    </form>
</body>
</html>
