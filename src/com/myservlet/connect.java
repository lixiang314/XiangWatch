package com.myservlet;
//lab8
import java.sql.*;
import javax.sql.*;
public class connect {
	
	//
	 public  Connection connect() throws ClassNotFoundException, SQLException{
    	 Class.forName("com.mysql.jdbc.Driver");
    	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:8889/XiangWatch?useUnicode=true&characterEncoding=UTF-8","root","root");
    	 return conn;
	 }
	 
     public Statement stmt(Connection conn) throws SQLException{
    	 Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
    	 stmt.executeQuery("SET NAMES UTF8");
    	 return stmt;
     }
     
     public ResultSet rs(Statement stmt,String sqlStr) throws SQLException{
    	 return stmt.executeQuery(sqlStr);  	 
     }
     
     //
     public void close(ResultSet rs,Statement stmt, Connection conn) throws SQLException{
    	 if(rs!=null) rs.close();
    	 if(stmt!=null)stmt.close();
    	 if(conn!=null)conn.close();
     }
     
   //
     public void close(Statement stmt, Connection conn) throws SQLException{
    	 if(stmt!=null)stmt.close();
    	 if(conn!=null)conn.close();
     }

}
