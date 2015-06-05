<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.myservlet.connect"%>
    <%@page import="java.util.Calendar"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.Random"%>
    <% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>

<%
request.setCharacterEncoding("UTF-8");


String deviceId = "";
String buildId = "";
String roomId = "";
String bedId = "";
Random random = new Random();
int battery = random.nextInt(100)%(101); 
String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());//获取系统时间


deviceId = request.getParameter("new-deviceId");
buildId = request.getParameter("new-buildId");
roomId = request.getParameter("new-roomId");
bedId = request.getParameter("new-bedId");

	connect conObj = new connect();
	Connection conn = conObj.connect();
	Statement stmt = conObj.stmt(conn);
  	int rtn = stmt.executeUpdate("insert into device (id,deviceId,settingDate,battery,buildId,roomId,bedId) values (null,'"+deviceId+"','"+datetime+"','"+battery+"','"+buildId+"','"+roomId+"','"+bedId+"')");	
	conObj.close(stmt,conn);
	
%>
<%response.sendRedirect("../device-manage.jsp");
 %>
