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
String name = "";
String age = "";
String gender = "";
String deviceId = "";
String buildId = "";
String roomId = "";
String bedId = "";

id = request.getParameter("id");
name = request.getParameter("new-name");
age = request.getParameter("new-age");
gender = request.getParameter("new-gender");
deviceId = request.getParameter("new-deviceId");
buildId = request.getParameter("new-buildId");
roomId = request.getParameter("new-roomId");
bedId = request.getParameter("new-bedId");

	connect conObj = new connect();
	Connection conn = conObj.connect();
	Statement stmt = conObj.stmt(conn);
/*   	int rtn = stmt.executeUpdate("insert into user (id,userName,gender,age,deviceId,bedId,roomId,buildId,imgPath) values (null,'"+name+"','"+gender+"','"+age+"','"+deviceId+"','"+bedId+"','"+roomId+"','"+buildId+"','"+imgPath+"')"); */	
	String sql = "update user set userName='"+name+"',age="+age+",gender='"+gender+"',deviceId='"+deviceId+"',bedId='"+bedId+"',roomId='"+roomId+"',buildId='"+buildId+"' where id="+id;

	int rtn = stmt.executeUpdate(sql);
	conObj.close(stmt,conn);
	
%>
<%response.sendRedirect("../people-manage.jsp");
 %>
