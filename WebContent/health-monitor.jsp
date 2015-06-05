<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@ page import="com.myservlet.connect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
 <head>
 	<meta charset="utf-8">
 	<title>智能手环健康监控系统</title>

 	<link rel="stylesheet" href="css/main-style.css">
 </head>



 <body>
 	

	<div class="template-page-wrapper">

		<div class="navbar-collapse collapse templatemo-sidebar">
			<ul class="templatemo-sidebar-menu">
				<li class="active">
					<a href="#">
						<div class="icon_heart_focus"></div>

						<!-- 显示消息数量 -->
						<span class="badge pull-right">1</span>		
						健康监测
					</a>
				</li>
				<li>
					<a href="people-manage.jsp">
						<div class="icon_people"></div>
						人员管理
					</a>
				</li>
				<li>
					<a href="device-manage.jsp">
						<div class="icon_device"></div>
						手环管理
					</a>
				</li>

				<li>
					<a href="javascript:;" data-toggle="modal" data-target="#confirmModal">
						<div class="icon_signout"></div>
						退出登录
					</a>
				</li>
			</ul>
		</div>



		<!-- 主体，templatemo-content-wrapper以下 -->
		<div class="templatemo-content-wrapper">

			<!-- templatemo-content以下 -->
			<div class="templatemo-content">

				<ul class="nav nav-tabs" role="tablist" id="templatemo-tabs">
					<li class="activecover active"><a href="#all" role="tab" data-toggle="tab">所有人员</a></li>
					<li><a href="#unusual" role="tab" data-toggle="tab" >异常人员</a></li>
					<!-- <li><a href="#notempty" role="tab" data-toggle="tab">非空床位</a></li> -->

				</ul>
				<div id="line-hr"></div>

				<!-- 查询表单 -->
				<!-- <div class="select-content">
					<form>
						<div>
							<div style="margin-bottom:10px;">
								<label>根据姓名查找：</label>
								<input type="text">
							</div>
							<div>
								<label>根据位置查找：</label>
								<input type="text">
								<label>楼 -</label>
								<input type="text">
								<label>室 -</label>
								<input type="text">
								<label>床</label>
								<input type="submit" class="btn btn-success"  value="搜索">	
							</div>
						</div>
					</form>
				</div> -->

				<!-- tab-content以下 -->
				<div class="tab-content">	

					<!-- 不筛选，所有床位 -->			
					<div class="tab-pane fade in active" id="all">


						<%
						 	Class.forName("com.mysql.jdbc.Driver");
						 	connect conObj = new connect();
							String sql="SELECT * FROM user";
							Connection conn = conObj.connect();
							Statement stmt = conObj.stmt(conn);
							ResultSet rs = conObj.rs(stmt,sql);
							
							if(rs!=null){
						        while (rs.next()) {
						        	int id = rs.getInt("id");
									String name = rs.getString("userName");
									String buildId = rs.getString("buildId");
									String roomId = rs.getString("roomId");
									String bedId = rs.getString("bedId");
							
							%>
							<a href="people-state.jsp?id=<%=id%>"><div class="watch-modal">
							<div class="bed-info">
							<div><%=name %></div>
							<div><%=buildId %> - <%=roomId %> 室</div>
							<div><%=bedId %> 号床位</div>
							<div class="bed-state-normal">正常</div>
							</div>
							</div></a>	
							<%
								}
							}
							conObj.close(rs,stmt,conn);
							%>



							<!-- 正常床位modal -->
							<!-- <a href="state.jsp"><div class="watch-modal">
								<div class="bed-info">
									<div>赵铁柱</div>
									<div>1-101室</div>
									<div>01号床位</div>
									<div class="bed-state-normal">正常</div>
								</div>
							</div></a> -->
							<!-- - - - -->

							<!-- 异常床位modal -->
							<!-- <div class="watch-modal watch-error">
								<div class="bed-info">
									<div>张三</div>
									<div>1-101室</div>
									<div>02号床位</div>
									<div class="bed-state-error">
										心率偏低</div>
									</div>
								</div> -->

								

							</div>

							<!-- 筛选出不正常的床位 -->
							<div class="tab-pane fade" id="unusual">
							
							
								<!-- 异常床位modal -->
								<div class="watch-modal watch-error">
									<div class="bed-info">
										<div>张三</div>
										<div>1-101室</div>
										<div>02号床位</div>
										<div class="bed-state-error">
											心率偏低</div>
									</div>
								</div>
							</div>

								<!-- 筛选出所有非空床位 -->
						<!-- 	<div class="tab-pane fade" id="notempty">

								</div>  -->
								
								<!-- tab-content以上 --> 
							</div><!-- templatemo-content以上 -->

						</div> <!-- 主体，templatemo-content-wrapper以上 -->




						<!-- 退出确认 Modal 以下-->
						<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
										<h4 class="modal-title" id="myModalLabel">确认要退出当前账号吗？</h4>
									</div>
									<div class="modal-footer">
										<a href="login.html" class="btn btn-primary">确认</a>
										<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 退出确认 Modal 以上-->




	
	
						<!-- footer 以下 -->
						<footer class="templatemo-footer">
							<div class="templatemo-copyright">
								<p><span style="color:#4a4;">响watch监控报警系统</span> made by 李响 建议使用<a>Chrome浏览器</a>打开以显示最佳效果</p>
							</div>
						</footer>
						<!-- footer 以上 -->

					</div>

<!-- 顶部标题 -->
 	<div class="navbar navbar-inverse"  role="navigation" ">
 		<div class="navbar-header">
 			<div class="logo-img"><img src="image/watch_logo_web.png" width="110px"></div>
 			<div class="logo"><h1>智能手环健康监控系统</h1></div>
 			
			<!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar">aaa</span>
				<span class="icon-bar">bbb</span>
				<span class="icon-bar">ccc</span>
			</button>  -->
		</div>   
	</div>

					<script src="js/jquery.min.js"></script>
					<script src="js/bootstrap.min.js"></script>
					<script src="js/Chart.min.js"></script>
					<script src="js/templatemo_script.js"></script>
				</body>
				</html>