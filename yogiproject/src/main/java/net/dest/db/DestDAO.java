package net.dest.db;

import java.sql.*;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;

import net.db.ConnUtil;

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
				sql = "select * from destination where dest_name like '%" + keyword + "%'";
			}
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					DestVO vo = new DestVO();
					vo.setDEST_ID(rs.getString("dest_id"));
					vo.setDEST_NAME(rs.getString("dest_name"));
					vo.setDEST_COUNTRY(rs.getString("dest_country"));
					vo.setDEST_NAME_ENG(rs.getString("dest_name_eng"));
					vo.setDEST_CONTENT(rs.getString("dest_content"));
					vo.setDEST_REFERENCE(rs.getString("dest_reference"));
					vo.setDEST_MONEY(rs.getFloat("dest_money"));
					vo.setDEST_LANDSCAPE(rs.getFloat("dest_landscape"));
					vo.setDEST_FUN(rs.getFloat("dest_fun"));
					vo.setDEST_TAG(rs.getString("dest_tag"));
					vo.setDEST_IMG(rs.getString("dest_img"));
					vo.setDEST_CNT(rs.getInt("dest_cnt"));
					vo.setDEST_SUMMARY(vo.getDEST_SUMMARY());
					
					destList.add(vo);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}

		return destList;
	}// end getDestList
	
	public Vector<DestVO> getDestListByCountry(String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<DestVO> destList = new Vector<>();

		try {

			if (keyword.equals("")) {
				sql = "select * from destination";
			} else {
				sql = "select * from destination where dest_country like '%" + keyword + "%'";
			}
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					DestVO vo = new DestVO();
					vo.setDEST_ID(rs.getString("dest_id"));
					vo.setDEST_NAME(rs.getString("dest_name"));
					vo.setDEST_COUNTRY(rs.getString("dest_country"));
					vo.setDEST_NAME_ENG(rs.getString("dest_name_eng"));
					vo.setDEST_CONTENT(rs.getString("dest_content"));
					vo.setDEST_REFERENCE(rs.getString("dest_reference"));
					vo.setDEST_MONEY(rs.getFloat("dest_money"));
					vo.setDEST_LANDSCAPE(rs.getFloat("dest_landscape"));
					vo.setDEST_FUN(rs.getFloat("dest_fun"));
					vo.setDEST_TAG(rs.getString("dest_tag"));
					vo.setDEST_IMG(rs.getString("dest_img"));
					vo.setDEST_CNT(rs.getInt("dest_cnt"));
					vo.setDEST_SUMMARY(vo.getDEST_SUMMARY());
					
					destList.add(vo);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}

		return destList;
	}// end getDestList
	
	
	public Vector<DestVO> getRecommandList(List<String> keywords) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<DestVO> destList = new Vector<>();

		try {
			con = ConnUtil.getConnection();
			
			for (int i = 0; i < keywords.size(); i++) {
				sql = "select * from destination where dest_name like '%" + keywords.get(i) + "%'";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					DestVO vo = new DestVO();
					vo.setDEST_ID(rs.getString("dest_id"));
					vo.setDEST_NAME(rs.getString("dest_name"));
					vo.setDEST_COUNTRY(rs.getString("dest_country"));
					vo.setDEST_NAME_ENG(rs.getString("dest_name_eng"));
					vo.setDEST_CONTENT(rs.getString("dest_content"));
					vo.setDEST_REFERENCE(rs.getString("dest_reference"));
					vo.setDEST_MONEY(rs.getFloat("dest_money"));
					vo.setDEST_LANDSCAPE(rs.getFloat("dest_landscape"));
					vo.setDEST_FUN(rs.getFloat("dest_fun"));
					vo.setDEST_TAG(rs.getString("dest_tag"));
					vo.setDEST_IMG(rs.getString("dest_img"));
					vo.setDEST_CNT(rs.getInt("dest_cnt"));
					vo.setDEST_SUMMARY(vo.getDEST_SUMMARY());
					
					destList.add(vo);
				}
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}

		return destList;
	}// end getDestList
	
	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) {
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

}
