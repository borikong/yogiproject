package net.member.db;

import java.sql.*;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;

import net.db.ConnUtil;

public class MemberDAO {
	private static MemberDAO instance = null;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();
			}
		}
		return instance;
	}


	//모든 사용자의 좋아요 표시한 리스트 가져오기
	public Vector<MemberVO> getLikeList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		Vector<MemberVO> likeList = new Vector<>();

		try {
			sql = "select * from member";
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs!=null) {
				while (rs.next()) {
					MemberVO vo = new MemberVO();
					vo.setUSER_ID(rs.getString("userid"));
					vo.setUSER_LIKE(rs.getString("userlike"));

					likeList.add(vo);
				}
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}

		return likeList;
	}
	
	//특정 사용자의 좋아요 표시한 리스트 가져오기
	public String[] getLikeList(String userid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String[] likeList=null;

		try {
			sql = "select * from member where userid='"+userid+"'";
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(rs.getString("userlike")!=null)
					likeList=rs.getString("userlike").split(",");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, con);
		}

		return likeList;
	}
	
	//하트찜 버튼 누르면 데이터베이스에 update
	public int addLike(String userid, String likeDest) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String originLike="";
		int result=0;
		
		try {
			con = ConnUtil.getConnection();
			
			//기존에 있던 userlike 가져오기
			sql="select userlike from member where userid='"+userid+"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("userlike")!=null)
					originLike=rs.getString("userlike");
			}
			
			sql="update member set userlike='"+originLike+","+likeDest+"' where userid='"+userid+"'";
			pstmt = con.prepareStatement(sql);
			result= pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, con);
		}
		
		return result;
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
