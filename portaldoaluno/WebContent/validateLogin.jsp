<%@page import="com.sun.javafx.runtime.SystemProperties"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Coment�rios para Avalia��o do C�digo: 
	Import das bibliotecas para consumo do webService RESTful -->
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>
<!-- Coment�rios para Avalia��o do C�digo: 
	/Import das bibliotecas para consumo do webService RESTful -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Valida��o de Login</title>
</head>
<body>
	<%
		try {

			/* 
			Coment�rios para Avalia��o do C�digo: 
				Recupera��o dos par�metros informados no formul�rio de login.			
			 */
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			/* 
			Coment�rios para Avalia��o do C�digo: 
				Constru��o da url de chamada ao webService REST de autentica��o de usu�rio.			
			 */
			String urlservice = "http://" + request.getServerName() + ":"
					+ request.getServerPort()
					+ "/portaldoalunows/autenticar/aluno/" + login + "/"
					+ senha;

			/* 
			Coment�rios para Avalia��o do C�digo: 
				Cria��o do Cliente REST para consumo do webService 
				de autentica��o de usu�rio.			
			 */
			Client client = Client.create();

			/* 
			Coment�rios para Avalia��o do C�digo: 
				Chamada ao webservice de autentica��o do usu�rio.
			*/
			System.out.println(urlservice);//controle via log da url do servi�o 
			WebResource webResource = client.resource(urlservice);
			
			/* 
			Coment�rios para Avalia��o do C�digo: 
				Captura da situa��o do acesso ao 
				webservice de autentica��o do usu�rio.			
			 */
			ClientResponse retorno = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (retorno.getStatus() != 200) {
				/* 
				Coment�rios para Avalia��o do C�digo: 
					Tratamento em caso de falha no acesso ao webservice.
				 */
				throw new RuntimeException("Failed : HTTP error code : "
						+ retorno.getStatus());
			}

			/* 
			Coment�rios para Avalia��o do C�digo: 
				Captura do retorno do webservice de autentica��o do usu�rio.
			 */
			String output = retorno.getEntity(String.class);

			/* 
			Coment�rios para Avalia��o do C�digo: 
				Sa�da para controle do retorno do webservice via log.
			 */
			System.out.println("Output from Server .... \n" + output);
			System.out.println("Redirecionando usu�rio...");

			if (output.equals("Acesso Negado!")) {
				/* 
				Coment�rios para Avalia��o do C�digo: 
					Tratamento para proibi��o de acesso ao sistema ap�s 
					verifica��o negativa das informa��es no banco de dados.
					Redirecionamento do usu�rio para a p�gina acessoNegado.
				 */
				System.out.println("Acesso Negado.");
				String url = "http://" + request.getServerName() + ":"
						+ request.getServerPort()
						+ request.getContextPath() + "/acessoNegado.html";
				response.sendRedirect(url);
			} else {
				/* 
				Coment�rios para Avalia��o do C�digo: 
					Tratamento para libera��o de acesso ao sistema ap�s 
					verifica��o positiva das informa��es no banco de dados.
					Redirecionamento do usu�rio para a p�gina home.
				 */
				System.out.println("Acesso permitido a " + output + ".");
				request.getSession().setAttribute("Aluno", output);
				String url = "http://" + request.getServerName() + ":"
						+ request.getServerPort()
						+ request.getContextPath() + "/home.jsp";
				response.sendRedirect(url);
			}
		} catch (Exception e) {
			/* 
			Coment�rios para Avalia��o do C�digo: 
				Sa�da de exce��o.
			 */
			e.printStackTrace();
		}
	%>
</body>
</html>