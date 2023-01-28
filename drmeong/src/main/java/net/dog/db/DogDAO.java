package net.dog.db;

/*MemberDAO Ŭ����*/
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
			System.out.println("������ ��� ���� ����");
			
		} catch (Exception ex) {
			System.out.println("������ DB���� ����" + ex);
			return;
		}
	}

	// ������ ���� �Է�
	public boolean insertDog(DogBean db) throws SQLException {
		String sql = null;

		try {
			sql = "insert into dog values" + "(?,?,?,?,?,?,?,?,?)"; //9��

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, db.getMEMBER_ID()); //��ȣ�� �̸�(MEMBER_ID)
			pstmt.setString(2, db.getDOG_NAME()); //������ �̸�(DOG_NAME)
			pstmt.setInt(3, db.getDOG_BYEAR());//������ ����(DOG_BYEAR) int
			pstmt.setInt(4, db.getDOG_BMONTH());//������ ����(DOG_BMONTH) int
			pstmt.setInt(5, db.getDOG_BDATE());//������ ����(DOG_BDATE) int 
			pstmt.setInt(6, db.getDOG_AGE());//������ ����(DOG_AGE) int
			pstmt.setString(7, db.getDOG_BREED());//����(DOG_BREED)
			pstmt.setString(8, db.getDOG_SEX());//������ ����(DOG_SEX)
			pstmt.setInt(9, db.getDOG_WEIGHT());//������ ������(DOG_WEIGHT) int
			pstmt.executeUpdate();

			System.out.println("������ ���Ϸ�");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return true;
	}

	
	// ���������� ��������
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

	//������ ���� ����
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

	//�� ������ ��������
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
	
	//������ ���� URL��������
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
	
	//�� ������ ���� �������� URL��������
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
	
	
	// �� ������ ���� ��������
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
				//System.out.println("������ ����:"+dog_breed);
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,dog_breed);
				rs=pstmt.executeQuery();
				
				dogdiseases=new DogDiseaseBean();
				
				while(rs.next()){
					dogdiseases.setDog_disease(rs.getString("disease"));
					//System.out.println("������� ������ ���� : "+rs.getString("disease"));
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
		
		// ������ ���� ����Ʈ ��������
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
