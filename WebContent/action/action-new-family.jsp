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
request.setCharacterEncoding("UTF-8");

String userId = "";
String name = "";
String relationship = "";
String phone = "";

userId = request.getParameter("family-userId");
name = request.getParameter("family-name");
relationship = request.getParameter("family-relationship");
phone = request.getParameter("family-phone");

	connect conObj = new connect();
	Connection conn = conObj.connect();
	Statement stmt = conObj.stmt(conn);
  	int rtn = stmt.executeUpdate("insert into family (id,name,relationship,phone,userId,password) values (null,'"+name+"','"+relationship+"','"+phone+"','"+userId+"',null)");	
	conObj.close(stmt,conn);

	
System.out.println("---------------------------");
System.out.println("家属的名字："+name);
System.out.println("关系："+relationship);
System.out.println("电话："+phone);
System.out.println("老人id："+userId);

%>
<%response.sendRedirect("../people-state.jsp?id="+userId);
 %>
