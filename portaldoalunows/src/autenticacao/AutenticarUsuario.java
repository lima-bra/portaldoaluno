package autenticacao;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import perfis.*;

@Path("autenticar")
public class AutenticarUsuario {
	@GET
	@Path("aluno/{a}/{b}")
	@Produces(MediaType.APPLICATION_JSON)
	// @Produces(MediaType.TEXT_PLAIN)
	public String autenticar(@PathParam("a") String a, @PathParam("b") String b) {
		Usuario user = new Usuario();
		String login = a;
		String senha = b;
		boolean status = user.verificarUsuario(login, senha);

		if (status == true) {
			return user.nome;
		} else {
			return "Acesso Negado!";
		}
	}
}