<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 request.setCharacterEncoding("UTF-8"); 
 
session.setMaxInactiveInterval(5);//设置session存活时间为10秒，测试用
//得到表单传递过来的用户名和密码  
String str_name = request.getParameter("username");
String str_pwd = request.getParameter("password");


if(str_name.equals("admin") && str_pwd.equals("admin")){
	session.setAttribute("isValued","true"); 	
	session.setAttribute("username",str_name);
	response.sendRedirect("../health-monitor.jsp");
}
else{
	%><script>alert("用户名或密码错误！");</script><% 
	response.sendRedirect("../login.jsp");
} 
%>
</body>
</html>