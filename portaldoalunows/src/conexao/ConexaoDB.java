package conexao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoDB {
	public Connection conectarBanco() {
		Connection conn = null;
		try {
			// Class.forName("com.mysql.jdbc.Driver").newInstance();
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/pupil?useTimezone=true&serverTimezone=UTC&useSSL=false";
			String username = "root";
			String password = "root";
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			System.out.println("erro de conexão: " + e);
		}
		return conn;
	}
}
