<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/pageStyle.css" />
<link rel="stylesheet" type="text/css" href="css/formStyle.css" />
<link rel="stylesheet" type="text/css" href="css/formStyle.css" />
</head>
<body>
	<%@ include file="validateSession.jsp"%>
	<div class="container">
		<div style="z-index: 1">
			<%@ include file="menuAluno.jsp"%>
		</div>
		<header>
			<h1>
				Portal do Aluno<span>Gest�o Acad�mica</span>
			</h1>
			O Portal do Aluno � a sua plataforma online de gest�o acad�mica. Ele
			foi projetado pensando em voc�, e � utilizado como diferencial de
			qualidade pelas melhores institui��es de ensino. Aqui voc� ser� capaz
			de realizar matr�culas nos cursos relacionados � sua gradua��o,
			consultar notas, emitir boletins e muito mais. Se voc� tem acesso �
			nossa plataforma, tenha certeza de que optou por uma institui��o de
			ensino que preza por oferecer a melhor experi�ncia ao seu aluno.
			Aproveite todo o potencial do Portal para alavancar os seus estudos.
			<br /> Equipe Portal do Aluno.
		</header>
		<footer>
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
	<!-- /container -->
</body>
</html>