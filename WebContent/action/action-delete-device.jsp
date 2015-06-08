<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.myservlet.connect"%>
    <% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 


String id = "";
String idArrayStr = "";
String idStr = "";
String userIdStr = "";
String idArray[] = null;

id = request.getParameter("id");
idArrayStr = request.getParameter("idArray");

	connect conObj = new connect();
	Connection conn = conObj.connect();
	Statement stmt = conObj.stmt(conn);
	String sqlDel      = "DELETE FROM device WHERE id="+id;
	
	System.out.println("----------sql语句"+sqlDel);
	

	try{
		if(!idArrayStr.equals(null)){
			idArray = idArrayStr.split("_");			
			for (int i=0; i < idArray.length; i++) { 
				idStr = idStr+"id="+idArray[i]+" or ";	
			}
			idStr = idStr.substring(0,idStr.length()-4);
			String sqlDelArr   = "DELETE FROM device WHERE "+idStr;
			stmt.executeUpdate(sqlDelArr);

		}
	}
	catch(Exception e){
		System.out.println("error");
		}

	stmt.executeUpdate(sqlDel);
	conObj.close(stmt,conn);
	
response.sendRedirect("../device-manage.jsp"); %>
