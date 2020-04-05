package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBA {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost:3306/mbbs?serverTimezone=Asia/Seoul";
	static final String USERNAME = "root";
	static final String PASSWORD = "shim0329";
	public static void main(String [] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		System.out.print("User Talbe 접속 : ");
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);
			if(conn != null) {
				System.out.println("성공!");
			}else {
				System.out.println("실패!");
			}
		}
		catch(ClassNotFoundException e) {
			System.out.println("Class Not Found Exceptioin");
		}
		catch(SQLException e) {
			System.out.println("SQL Exception : "+e.getMessage());
			e.printStackTrace();
		}
	}
}
