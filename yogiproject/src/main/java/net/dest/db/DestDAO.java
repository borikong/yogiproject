package net.dest.db;

import java.sql.*;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;

import mem.model.MemberDAO;
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
	
	//여행지 이름으로 여행지 정보 가져오기
	public DestVO getDest(String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		DestVO vo=null;
		try {

			sql = "select * from destination where dest_name like '%" + keyword + "%'";

			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			vo = new DestVO();

			if (rs.next()) {
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
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}

		return vo;
	}

	//키워드로 여행지 리스트
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
	
	//국가로 여행지 리스트 검색
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
	
	//추천 리스트의 관광지 상세정보 검색
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
	
	
	
	
	public void updateCnt(String mode,String dest, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int cnt=0;

		try {
			con = ConnUtil.getConnection();
			sql = "select dest_cnt from destination where dest_name like '%" + dest + "%'";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("dest_cnt");
			}
			
			//이미 찜하거나 취소한 여행지인지 확인
			MemberDAO mdao=MemberDAO.getInstance();
			String[] userlike=mdao.getLikeList(id);
			boolean iscontain=false;
			
			if(userlike!=null) {
				for (String string : userlike) {
					if(string.contains(dest)) {
						iscontain=true;
						break;
					}
				}
				
			}
			
			if(iscontain&&mode.equals("dislike") && cnt>0) { //좋아요 되어 있고, dislike 모드이고 cnt>0인 경우만
				cnt--;
			}else if(!iscontain&&mode.equals("like")) { //좋아요 되어있지 않고, like 모드인 경우
				cnt++;
			}
			

			sql = "update destination set dest_cnt="+cnt+" where dest_name like '%" + dest + "%'";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}

	}
	
	
	
	
	
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
