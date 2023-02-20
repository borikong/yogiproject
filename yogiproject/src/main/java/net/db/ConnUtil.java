package net.db;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

public class ConnUtil {
	private static DataSource ds;

	static {
		try {
			
			InitialContext ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:/comp/env/jdbc/myoracle");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Connection 객체 생성 실패");
		}
	}

	public static Connection getConnection() throws SQLException {

		return ds.getConnection();
	}
}
