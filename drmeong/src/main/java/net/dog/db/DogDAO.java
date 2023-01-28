package net.dog.db;

/*MemberDAO 클래스*/
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DogDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public DogDAO() {
		try {

			String url = "jdbc:mysql://drmeongdb.mysql.database.azure.com:3306/drmeong?useSSL=true&requireSSL=false&useUnicode=true&characterEncoding=utf-8";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, "drmeongadmin@drmeongdb", "taco127!");
			System.out.println("강아지 디비 연결 성공");
			
		} catch (Exception ex) {
			System.out.println("강아지 DB연결 실패" + ex);
			return;
		}
	}

	// 강아지 정보 입력
	public boolean insertDog(DogBean db) throws SQLException {
		String sql = null;

		try {
			sql = "insert into dog values" + "(?,?,?,?,?,?,?,?,?)"; //9개

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, db.getMEMBER_ID()); //보호자 이름(MEMBER_ID)
			pstmt.setString(2, db.getDOG_NAME()); //강아지 이름(DOG_NAME)
			pstmt.setInt(3, db.getDOG_BYEAR());//강아지 생년(DOG_BYEAR) int
			pstmt.setInt(4, db.getDOG_BMONTH());//강아지 생달(DOG_BMONTH) int
			pstmt.setInt(5, db.getDOG_BDATE());//강아지 생일(DOG_BDATE) int 
			pstmt.setInt(6, db.getDOG_AGE());//강아지 나이(DOG_AGE) int
			pstmt.setString(7, db.getDOG_BREED());//견종(DOG_BREED)
			pstmt.setString(8, db.getDOG_SEX());//강아지 성별(DOG_SEX)
			pstmt.setInt(9, db.getDOG_WEIGHT());//강아지 몸무게(DOG_WEIGHT) int
			pstmt.executeUpdate();

			System.out.println("강아지 디비완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return true;
	}

	
	// 강아지정보 가져오기
	public DogBean getDog(String id) throws SQLException {
		
		DogBean dog = null;
		String sql = null;
		
		try {

			sql = "select * from dog where MEMBER_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dog = new DogBean();

				dog.setMEMBER_ID(rs.getString("MEMBER_ID"));
				dog.setDOG_NAME(rs.getString("DOG_NAME"));
				dog.setDOG_BYEAR(rs.getInt("DOG_BYEAR"));
				dog.setDOG_BMONTH(rs.getInt("DOG_BMONTH"));
				dog.setDOG_BDATE(rs.getInt("DOG_BDATE"));
				dog.setDOG_AGE(rs.getInt("DOG_AGE"));
				dog.setDOG_BREED(rs.getString("DOG_BREED"));
				dog.setDOG_SEX(rs.getString("DOG_SEX"));
				dog.setDOG_WEIGHT(rs.getInt("DOG_WEIGHT"));


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
		return dog;
	}

	//강아지 정보 수정
	public void updateDog(DogBean db) throws SQLException {
		String sql = null;

		try {
			sql = "update dog set  DOG_NAME=?, DOG_BYEAR=?, DOG_BMONTH=?, DOG_BDATE=?, DOG_AGE=?, DOG_BREED=?, DOG_SEX=?, DOG_WEIGHT=? WHERE MEMBER_ID=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, db.getDOG_NAME());
			pstmt.setInt(2, db.getDOG_BYEAR());
			pstmt.setInt(3, db.getDOG_BMONTH());
			pstmt.setInt(4, db.getDOG_BDATE());
			pstmt.setInt(5, db.getDOG_AGE());
			pstmt.setString(6, db.getDOG_BREED());
			pstmt.setString(7, db.getDOG_SEX());
			pstmt.setInt(8, db.getDOG_WEIGHT());
			pstmt.setString(9, db.getMEMBER_ID());
			pstmt.executeUpdate();
			
			
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
	}

	//내 강아지 가져오기
	public String getMyDog (String id) throws SQLException{
		String sql=null;
		String dog_breed=null;
		
		try{
			sql="SELECT DISTINCT dog_breed FROM dog WHERE member_id=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dog_breed=rs.getString("DOG_BREED");
			}
			return dog_breed;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return null;
	}
	
	//강이지 사진 URL가져오기
	public String getDogPic(String breed) throws SQLException
	{
		String sql=null;
		String url=null;
		
		try{
			sql="SELECT DISTINCT dog_image FROM dogdisease WHERE dog_type=? ";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, breed);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				url=rs.getString("DOG_IMG");
			}
			return url;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return null;
	}
	
	//각 질병에 대한 질병정보 URL가져오기
	public String getDiseaseURL(String disease)throws SQLException{
		String sql=null;
		String url=null;
		
		try{
			sql="SELECT DISTINCT disease_info FROM dogdisease WHERE disease=? ";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, disease);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				url=rs.getString("DISEASE_INFO");
			}
			return url;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		return null;
		
	}
	
	
	// 내 강아지 정보 가져오기
		public DogDiseaseBean getMyDogInfo(String id) throws SQLException {
			
			DogDiseaseBean dogdiseases=null;
			String sql = null;
			String sql2=null;
			String dog_breed=null;
			
			try {

				sql = "SELECT DISTINCT disease FROM dogdisease WHERE dog_type=?";
				sql2="SELECT DISTINCT dog_breed FROM dog WHERE member_id=? ";
				
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					dog_breed=rs.getString("DOG_BREED");
				}
				//System.out.println("강아지 종류:"+dog_breed);
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,dog_breed);
				rs=pstmt.executeQuery();
				
				dogdiseases=new DogDiseaseBean();
				
				while(rs.next()){
					dogdiseases.setDog_disease(rs.getString("disease"));
					//System.out.println("집어넣은 강아지 질병 : "+rs.getString("disease"));
				}
				
				return dogdiseases;
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			}
			
			return null;
			
		}
		
		// 강아지 종류 리스트 가져오기
				public ArrayList<String> getDogList() throws SQLException {

					ArrayList<String> doglist;
					String sql = null;

					try {

						sql="SELECT DISTINCT dog_type FROM dogdisease ";
						
						pstmt=con.prepareStatement(sql);
						rs=pstmt.executeQuery();
						
						doglist=new ArrayList<String>();
						while(rs.next()){
							doglist.add(rs.getString("dog_type"));
						}
						return doglist;
						
					}catch(Exception e){
						e.printStackTrace();
					}finally {
						if (pstmt != null) {
							pstmt.close();
						}
						if (rs != null) {
							rs.close();
						}
					}
					
					return null;
					
				}

}
