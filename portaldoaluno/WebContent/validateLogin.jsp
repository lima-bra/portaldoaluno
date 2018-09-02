<%@page import="com.sun.javafx.runtime.SystemProperties"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Comentários para Avaliação do Código: 
	Import das bibliotecas para consumo do webService RESTful -->
<%@ page import="com.sun.jersey.api.client.Client"%>
<%@ page import="com.sun.jersey.api.client.ClientResponse"%>
<%@ page import="com.sun.jersey.api.client.WebResource"%>
<!-- Comentários para Avaliação do Código: 
	/Import das bibliotecas para consumo do webService RESTful -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validação de Login</title>
</head>
<body>
	<%
		try {

			/* 
			Comentários para Avaliação do Código: 
				Recuperação dos parâmetros informados no formulário de login.			
			 */
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			/* 
			Comentários para Avaliação do Código: 
				Construção da url de chamada ao webService REST de autenticação de usuário.			
			 */
			String urlservice = "http://" + request.getServerName() + ":"
					+ request.getServerPort()
					+ "/portaldoalunows/autenticar/aluno/" + login + "/"
					+ senha;

			/* 
			Comentários para Avaliação do Código: 
				Criação do Cliente REST para consumo do webService 
				de autenticação de usuário.			
			 */
			Client client = Client.create();

			/* 
			Comentários para Avaliação do Código: 
				Chamada ao webservice de autenticação do usuário.
			*/
			System.out.println(urlservice);//controle via log da url do serviço 
			WebResource webResource = client.resource(urlservice);
			
			/* 
			Comentários para Avaliação do Código: 
				Captura da situação do acesso ao 
				webservice de autenticação do usuário.			
			 */
			ClientResponse retorno = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (retorno.getStatus() != 200) {
				/* 
				Comentários para Avaliação do Código: 
					Tratamento em caso de falha no acesso ao webservice.
				 */
				throw new RuntimeException("Failed : HTTP error code : "
						+ retorno.getStatus());
			}

			/* 
			Comentários para Avaliação do Código: 
				Captura do retorno do webservice de autenticação do usuário.
			 */
			String output = retorno.getEntity(String.class);

			/* 
			Comentários para Avaliação do Código: 
				Saída para controle do retorno do webservice via log.
			 */
			System.out.println("Output from Server .... \n" + output);
			System.out.println("Redirecionando usuário...");

			if (output.equals("Acesso Negado!")) {
				/* 
				Comentários para Avaliação do Código: 
					Tratamento para proibição de acesso ao sistema após 
					verificação negativa das informações no banco de dados.
					Redirecionamento do usuário para a página acessoNegado.
				 */
				System.out.println("Acesso Negado.");
				String url = "http://" + request.getServerName() + ":"
						+ request.getServerPort()
						+ request.getContextPath() + "/acessoNegado.html";
				response.sendRedirect(url);
			} else {
				/* 
				Comentários para Avaliação do Código: 
					Tratamento para liberação de acesso ao sistema após 
					verificação positiva das informações no banco de dados.
					Redirecionamento do usuário para a página home.
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
			Comentários para Avaliação do Código: 
				Saída de exceção.
			 */
			e.printStackTrace();
		}
	%>
</body>
</html>