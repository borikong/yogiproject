package net.dest.db;

import java.sql.*;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;

public class DestDAO {

	private static DestDAO instance = null;

	private DestDAO() {
	}

	public static DestDAO getInstance() {
		if (instance == null) {
			synchronized (DestDAO.class) {
				instance = new DestDAO();
			}
		}
		return instance;
	}

	private Connection getConnection() {
		Connection conn = null;

		try {

			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();

//			Class.forName("oracle.jdbc.driver.OracleDriver");
//
//			// 3단계
//			String url = "jdbc:oracle:thin:@211.205.43.192:1521:xe";
//			String id = "C##scott";
//			String password = "tiger";
//			conn = DriverManager.getConnection(url, id, password);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection 객체 생성 실패");
		}

		return conn;
	}

	public Vector<DestVO> getDestList(String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<DestVO> destList = new Vector<>();

		try {

			if (keyword.equals("")) {
				sql = "select * from destination";
			} else {
				sql = "select * from destination where dest_name='" + keyword + "'";
			}
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			if (rs != null) {
				while (rs.next()) {
					DestVO vo = new DestVO();
					vo.setDEST_ID(rs.getString("dest_id"));
					vo.setDEST_NAME(rs.getString("dest_name"));
					vo.setDEST_COUNTRY(rs.getString("dest_country"));
					vo.setDEST_NAME_ENG(rs.getString("dest_name_eng"));
					vo.setDEST_CONTENT(rs.getString("dest_content"));
					vo.setDEST_MONEY(rs.getInt("dest_money"));
					vo.setDEST_LANDSCAPE(rs.getInt("dest_landscape"));
					vo.setDEST_FUN(rs.getInt("dest_fun"));
					vo.setDEST_TAG(rs.getString("dest_tag"));
					vo.setDEST_IMG(rs.getString("dest_img"));

					destList.add(vo);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return destList;
	}// end getDestList


}
