<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EadBackEnd2b.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
	var campo1 = false;
	var campo2 = false;
	
	function valida_email() {
		var valor = document.getElementById("txtEmail").value;
		var res = analisa_email(valor);
		if (res == false){
			document.getElementById("labEmail").innerHTML = 'email inválido';
			document.getElementById("btn").disabled = true;	
			campo2 = false;			
		}
		else{
			document.getElementById("labEmail").innerHTML = '';			
			campo2 = true;
		}
		verificaEstadoCampos()
	}
	
	function analisa_email(texto) {
		var reg = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
		return reg.test(texto);
	}
	
	
	function verificaEstadoCampos() {		
		if (campo1 == true && campo2 == true)
			document.getElementById("btn").disabled = false;
		else
			document.getElementById("btn").disabled = true;
	}
	
	function valida_cpf() {
		var valor = document.getElementById("txtCPF").value;
		var res = analisa_cpf(valor);
		if (res == false) {
			document.getElementById("labCPF").innerHTML = 'cpf inválido';
			document.getElementById("btn").disabled = true;
			campo1 = false;
		}
		else {				
			document.getElementById("labCPF").innerHTML = '';			
			campo1 = true;
		}
		
		verificaEstadoCampos()
	}
	
	function analisa_cpf(cpf) {
		var numeros, digitos, soma, i, resultado, digitos_iguais;
		digitos_iguais = 1;
		if (cpf.length < 11)
			return false;
		for (i = 0; i < cpf.length - 1; i++)
			if (cpf.charAt(i) != cpf.charAt(i + 1)) {
				digitos_iguais = 0;
				break;
			}
		if (!digitos_iguais)	{
			numeros = cpf.substring(0,9);
			digitos = cpf.substring(9);
			soma = 0;
			for (i = 10; i > 1; i--)
				soma += numeros.charAt(10 - i) * i;
			resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
			if (resultado != digitos.charAt(0))
				return false;
			numeros = cpf.substring(0,10);
			soma = 0;
			for (i = 11; i > 1; i--)
				soma += numeros.charAt(11 - i) * i;
			resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
			if (resultado != digitos.charAt(1))
				return false;
			return true;
		}
		else
			return false;

	}
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtCPF" runat="server" onchange="javascript: valida_cpf()" placeholder ="digite cpf"></asp:TextBox>
        <asp:Label ID="labCPF" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br />
        <asp:TextBox ID="txtEmail" runat="server" onchange="javascript: valida_email()" placeholder ="digite email"></asp:TextBox>
        <asp:Label ID="labEmail" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="btn" runat="server" Text="Salvar" OnClick="btn_Click" Enabled="false" />
         <br />
         <asp:Label ID="labRes" runat="server" Text="" ForeColor="Blue"></asp:Label>
        <br />
        <br />
         <asp:Button ID="btn2" runat="server" Text="Buscar" OnClick="btn2_Click" />
         <br />
         <asp:Label ID="labRes2" runat="server" Text="" ForeColor="Green"></asp:Label>
    </form>

</body>
</html>
