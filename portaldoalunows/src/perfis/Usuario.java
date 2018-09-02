package perfis;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import conexao.*;

public class Usuario {
	ConexaoDB cdb = new ConexaoDB();
	public String nome = "";
	public boolean result = false;

	public boolean verificarUsuario(String login, String senha) {
		String sql = "";
		Connection conn = cdb.conectarBanco();
		sql += "select nomealuno from aluno ";
		sql += "where emaialuno = " + "'" + login + "' ";
		sql += "and senhaaluno = " + "'" + senha + "';";
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				result = true;
				nome = rs.getString("nomealuno");
			}
		} catch (Exception e) {
			System.out.println("erro de validação: " + e);
		}
		return result;
	}
}
