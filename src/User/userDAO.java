package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	private Connection conn;
	private PreparedStatement pstmt;//해킹을 방어하기 위한 방식
	private ResultSet rs;
	
	public userDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/mbbs";
						//mysql protocol/도메인:포트/mbbs(table)로 접속하라
			String dbID = "root";
			String dbPassword = "shim0329";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();//에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력한다.
		}
	}//mysql과 연동하는 함수
	
	public int login(String userId, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			//preparedstatement-코드 안전성,가독성 높음/매개변수를 set해줘야함
			pstmt.setString(1, userId);
			//setString을 사용해 위의 sql문의 ?부분에 (1,*) *부분이 들어가게함/인덱스를 String값으로 지정합니다.
			rs = pstmt.executeQuery();
			//executeQuery는 주로 select문을 수행할 떄 사용됨
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;//로그인 성공
				}
				else
					return 0;//비밀번호 불일치
			}
			return -1;//아이디가 없음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;//데이터베이스 오류
	}
	
	public int join(user user) {
		String SQL = "INSERT INTO mbbs VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(1, user.getUserName());
			pstmt.setString(1, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;//이미 있으니까 insert되지않고 나와서 -1을 리턴함
	}
	
}
