package net.member.db;

/*MemberDAO Ŭ����*/
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
			 * // ����Ϸ��� �����ͺ��̽����� ������ URL ��� String url =
			 * "jdbc:mysql://192.168.0.156/drmeongdb"; String id =
			 * "admin_dayeong"; // ����ڰ��� String pw = "taco127"; // ����ڰ����� �н�����
			 * // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
			 * Class.forName("com.mysql.jdbc.Driver"); // DriverManager ��ü�κ���
			 * Connection ��ü�� ���´�. con=DriverManager.getConnection(url,id,pw);
			 * // Ŀ�ؼ��� ����� ����Ǹ� ����ȴ�. System.out.println("��� ���� ����");
			 */
			/*
			 * Context initCtx=new InitialContext(); Context
			 * envCtx=(Context)initCtx.lookup("java:/comp/env"); DataSource
			 * ds=(DataSource)envCtx.lookup("jdbc/mysql");
			 * con=ds.getConnection(); System.out.println("��� ���� ����");
			 */


			String url = "jdbc:mysql://drmeongdb.mysql.database.azure.com:3306/drmeong?useSSL=true&requireSSL=false&useUnicode=true&characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "drmeongadmin@drmeongdb", "taco127!");
			System.out.println("��ȣ�� ��� ���� ����");
			
		} catch (Exception ex) {
			System.out.println("��ȣ�� DB���� ����" + ex);
			return;
		}
	}

	// ȸ������ ó���� ���� �޼���
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

			System.out.println("ȸ������ ���Ϸ�");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return true;
	}

	// ȸ���� �´��� Ȯ��
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
				x = -1;// ���̵� �������� ����
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

	// ���̵� Ȯ���ϱ�
	public int confirmId(String id) throws SQLException {
		String sql = null;
		int x = -1;

		try {
			sql = "select MEMBER_ID from member where MEMBER_ID=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1; //���� ���̵� �����ϸ�
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
	


	// ȸ������ ��������
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

	// ȸ������ ����
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

	
	//ȸ�� ����
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

	// �̸��̶� �̸��� ������ ȸ�� ���̵� ã��
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

	// ������ �������� Ȯ��
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
