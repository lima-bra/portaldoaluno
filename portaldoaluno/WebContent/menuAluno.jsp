<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Inclusão dos Ícones -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Configuração do Menu bootstrap -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="A sidebar menu as seen on the Google Nexus 7 website" />
<meta name="keywords"
	content="google nexus 7 menu, css transitions, sidebar, side menu, slide out menu" />
<link rel="stylesheet" type="text/css" href="css/menuStyle.css" />
<script src="js/modernizr.custom.js"></script>
<script type="text/javascript">
	function killSession() {

		window.location.href = "index.html";
	}
</script>
</head>
<body>
	<ul id="gn-menu" class="gn-menu-main" style="z-index: 1">
		<li class="gn-trigger"><a class="gn-icon gn-icon-menu"><span>Menu</span></a>
			<nav class="gn-menu-wrapper">
				<div class="gn-scroller">
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-home"></i>Início</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-graduation-cap"></i>Matrículas</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-pencil-square-o"></i>Avaliações</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-institution"></i>Cursos</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-file-o"></i>Emitir
								Boletim</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-question-circle-o"></i>Informações</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-envelope-o"></i>Contatos</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"><i class="fa fa-gears"></i>Configurações</a></li>
					</ul>
					<ul class="gn-menu">
						<li><a href="#"
							onclick="window.location='killSession.jsp?invalidate=true'"><i
								class="fa fa-times-rectangle-o"></i>Sair</a></li>
					</ul>
				</div>
				<!-- /gn-scroller -->
			</nav></li>
		<li>&nbsp;</li>
	</ul>
	<script src="js/classie.js"></script>
	<script src="js/gnmenu.js"></script>
	<script>
		new gnMenu(document.getElementById('gn-menu'));
	</script>
</body>
</html>