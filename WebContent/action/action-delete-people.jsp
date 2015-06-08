<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.myservlet.connect"%>

    <% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>

<%

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
/*   	int rtn = stmt.executeUpdate("insert into user (id,userName,gender,age,deviceId,bedId,roomId,buildId,imgPath) values (null,'"+name+"','"+gender+"','"+age+"','"+deviceId+"','"+bedId+"','"+roomId+"','"+buildId+"','"+imgPath+"')"); */	
	String sqlDelUser      = "DELETE FROM user WHERE id="+id;
	String sqlDelFamily    = "DELETE FROM family WHERE userId="+id;
	
	System.out.println("----------sql语句"+sqlDelUser);
	
	
	
	try{
		if(!idArrayStr.equals(null)){
			idArray = idArrayStr.split("_");
			
			for (int i=0; i < idArray.length; i++) { 
				idStr = idStr+"id="+idArray[i]+" or ";
				userIdStr = userIdStr+"userId="+idArray[i]+" or ";
			}
			idStr = idStr.substring(0,idStr.length()-4);
			userIdStr = userIdStr.substring(0,userIdStr.length()-4);
			
			String sqlDelUserArr   = "DELETE FROM user WHERE "+idStr;
			String sqlDelFamilyArr = "DELETE FROM family WHERE "+userIdStr;
			stmt.executeUpdate(sqlDelUserArr);
			stmt.executeUpdate(sqlDelFamilyArr);
		}
	}
	catch(Exception e){
		System.out.println("error");
		}
	
	stmt.executeUpdate(sqlDelUser);
	stmt.executeUpdate(sqlDelFamily);
	
	
	conObj.close(stmt,conn);
	
%>
<%response.sendRedirect("../people-manage.jsp"); %>
