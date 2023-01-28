package net.member.db;

/*MemberDAO 클래스*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MemberDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDAO() {
		try {

			/*
			 * // 사용하려는 데이터베이스명을 포함한 URL 기술 String url =
			 * "jdbc:mysql://192.168.0.156/drmeongdb"; String id =
			 * "admin_dayeong"; // 사용자계정 String pw = "taco127"; // 사용자계정의 패스워드
			 * // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
			 * Class.forName("com.mysql.jdbc.Driver"); // DriverManager 객체로부터
			 * Connection 객체를 얻어온다. con=DriverManager.getConnection(url,id,pw);
			 * // 커넥션이 제대로 연결되면 수행된다. System.out.println("디비 연결 성공");
			 */
			/*
			 * Context initCtx=new InitialContext(); Context
			 * envCtx=(Context)initCtx.lookup("java:/comp/env"); DataSource
			 * ds=(DataSource)envCtx.lookup("jdbc/mysql");
			 * con=ds.getConnection(); System.out.println("디비 연결 성공");
			 */


			String url = "jdbc:mysql://drmeongdb.mysql.database.azure.com:3306/drmeong?useSSL=true&requireSSL=false&useUnicode=true&characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "drmeongadmin@drmeongdb", "taco127!");
			System.out.println("보호자 디비 연결 성공");
			
		} catch (Exception ex) {
			System.out.println("보호자 DB연결 실패" + ex);
			return;
		}
	}

	// 회원가입 처리를 위한 메서드
	public boolean insertMember(MemberBean mb) throws SQLException {
		String sql = null;

		try {
			sql = "insert into member values" + "(?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getMEMBER_ID());
			pstmt.setString(2, mb.getMEMBER_PW());
			pstmt.setString(3, mb.getMEMBER_NAME());
			pstmt.setInt(4, mb.getMEMBER_AGE());
			pstmt.setString(5, mb.getMEMBER_GENDER());
			pstmt.setString(6, mb.getMEMBER_EMAIL());
			pstmt.setInt(7, mb.getMEMBER_ADMIN());
			pstmt.executeUpdate();

			System.out.println("회원가입 디비완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return true;
	}

	// 회원이 맞는지 확인
	public int userCheck(String id, String pw) throws SQLException {
		String sql = null;
		int x = -1;

		try {
			sql = "select MEMBER_PW from MEMBER where MEMBER_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			
			if (rs.next()) {
				String memberpw = rs.getString("MEMBER_PW");

				if (memberpw.equals(pw)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;// 아이디 존재하지 않음
			}
			return x;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}

		return -1;
	}

	// 아이디 확인하기
	public int confirmId(String id) throws SQLException {
		String sql = null;
		int x = -1;

		try {
			sql = "select MEMBER_ID from member where MEMBER_ID=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1; //다음 아이디가 존재하면
			} else {
				x = -1;
			}
			return x;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return -1;
	}
	


	// 회원정보 가져오기
	public MemberBean getMember(String id) throws SQLException {
		
		MemberBean member = null;
		String sql = null;
		
		System.out.println ("id");
		
		try {

			sql = "select * from member where MEMBER_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberBean();

				member.setMEMBER_ID(rs.getString("MEMBER_ID"));
				member.setMEMBER_PW(rs.getString("MEMBER_PW"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_AGE(rs.getInt("MEMBER_AGE"));
				member.setMEMBER_GENDER(rs.getString("MEMBER_GENDER"));
				member.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return member;
	}

	// 회원정보 수정
	public boolean updateMember(MemberBean mb) throws SQLException {
		String sql = null;

		try {
			sql = "update member set  MEMBER_NAME=?, MEMBER_AGE=?, MEMBER_GENDER=?, MEMBER_EMAIL=? WHERE MEMBER_ID=?";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getMEMBER_NAME());
			pstmt.setInt(2, mb.getMEMBER_AGE());
			pstmt.setString(3, mb.getMEMBER_GENDER());
			pstmt.setString(4, mb.getMEMBER_EMAIL());
			pstmt.setString(5, mb.getMEMBER_ID());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return false;
	}

	
	//회원 삭제
	public int deleteMember(String id, String pw) throws SQLException {
		String sql = null;
		int x = -1;

		try {
			sql = "select MEMBER_PW from member where MEMBER_ID=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String memberpw = rs.getString("MEMBER_PW");
				if (memberpw.equals(pw)) {
					sql = "delete from member where MEMBER_ID=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
				return x;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return -1;
	}

	// 이름이랑 이메일 가지고 회원 아이디 찾기
	public MemberBean findId(String name, String email) throws SQLException {
		String sql = null;
		MemberBean member = new MemberBean();

		try {
			sql = "select MEMBER_ID, MEMBER_PW, MEMBER_EMAIL from member where MEMBER_NAME=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String memberemail = rs.getString("MEMBER_EMAIL");

				if (memberemail.equals(email)) {
					member.setMEMBER_ID(rs.getString("MEMBER_ID"));
					member.setMEMBER_PW(rs.getString("MEMBER_PW"));

					return member;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}

		return null;
	}

	// 관리자 계정인지 확인
	public boolean isAdmin(String id) {
		String sql = "select MEMBER_ADMIN from MEMBER where MEMBER_ID=?";
		int member_admin = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();

			member_admin = rs.getInt("MEMBER_ADMIN");

			if (member_admin == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

}
