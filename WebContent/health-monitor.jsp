<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@ page import="com.myservlet.connect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
 <head>
 	<meta charset="utf-8">
 	<title>�����ֻ��������ϵͳ</title>

 	<link rel="stylesheet" href="css/main-style.css">
 </head>



 <body>
 	

	<div class="template-page-wrapper">

		<div class="navbar-collapse collapse templatemo-sidebar">
			<ul class="templatemo-sidebar-menu">
				<li class="active">
					<a href="#">
						<div class="icon_heart_focus"></div>

						<!-- ��ʾ��Ϣ���� -->
						<span class="badge pull-right">1</span>		
						�������
					</a>
				</li>
				<li>
					<a href="people-manage.jsp">
						<div class="icon_people"></div>
						��Ա����
					</a>
				</li>
				<li>
					<a href="device-manage.jsp">
						<div class="icon_device"></div>
						�ֻ�����
					</a>
				</li>

				<li>
					<a href="javascript:;" data-toggle="modal" data-target="#confirmModal">
						<div class="icon_signout"></div>
						�˳���¼
					</a>
				</li>
			</ul>
		</div>



		<!-- ���壬templatemo-content-wrapper���� -->
		<div class="templatemo-content-wrapper">

			<!-- templatemo-content���� -->
			<div class="templatemo-content">

				<ul class="nav nav-tabs" role="tablist" id="templatemo-tabs">
					<li class="activecover active"><a href="#all" role="tab" data-toggle="tab">������Ա</a></li>
					<li><a href="#unusual" role="tab" data-toggle="tab" >�쳣��Ա</a></li>
					<!-- <li><a href="#notempty" role="tab" data-toggle="tab">�ǿմ�λ</a></li> -->

				</ul>
				<div id="line-hr"></div>

				<!-- ��ѯ�� -->
				<!-- <div class="select-content">
					<form>
						<div>
							<div style="margin-bottom:10px;">
								<label>�����������ң�</label>
								<input type="text">
							</div>
							<div>
								<label>����λ�ò��ң�</label>
								<input type="text">
								<label>¥ -</label>
								<input type="text">
								<label>�� -</label>
								<input type="text">
								<label>��</label>
								<input type="submit" class="btn btn-success"  value="����">	
							</div>
						</div>
					</form>
				</div> -->

				<!-- tab-content���� -->
				<div class="tab-content">	

					<!-- ��ɸѡ�����д�λ -->			
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
							<div><%=buildId %> - <%=roomId %> ��</div>
							<div><%=bedId %> �Ŵ�λ</div>
							<div class="bed-state-normal">����</div>
							</div>
							</div></a>	
							<%
								}
							}
							conObj.close(rs,stmt,conn);
							%>



							<!-- ������λmodal -->
							<!-- <a href="state.jsp"><div class="watch-modal">
								<div class="bed-info">
									<div>������</div>
									<div>1-101��</div>
									<div>01�Ŵ�λ</div>
									<div class="bed-state-normal">����</div>
								</div>
							</div></a> -->
							<!-- - - - -->

							<!-- �쳣��λmodal -->
							<!-- <div class="watch-modal watch-error">
								<div class="bed-info">
									<div>����</div>
									<div>1-101��</div>
									<div>02�Ŵ�λ</div>
									<div class="bed-state-error">
										����ƫ��</div>
									</div>
								</div> -->

								

							</div>

							<!-- ɸѡ���������Ĵ�λ -->
							<div class="tab-pane fade" id="unusual">
							
							
								<!-- �쳣��λmodal -->
								<div class="watch-modal watch-error">
									<div class="bed-info">
										<div>����</div>
										<div>1-101��</div>
										<div>02�Ŵ�λ</div>
										<div class="bed-state-error">
											����ƫ��</div>
									</div>
								</div>
							</div>

								<!-- ɸѡ�����зǿմ�λ -->
						<!-- 	<div class="tab-pane fade" id="notempty">

								</div>  -->
								
								<!-- tab-content���� --> 
							</div><!-- templatemo-content���� -->

						</div> <!-- ���壬templatemo-content-wrapper���� -->




						<!-- �˳�ȷ�� Modal ����-->
						<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
										<h4 class="modal-title" id="myModalLabel">ȷ��Ҫ�˳���ǰ�˺���</h4>
									</div>
									<div class="modal-footer">
										<a href="login.html" class="btn btn-primary">ȷ��</a>
										<button type="button" class="btn btn-default" data-dismiss="modal">ȡ��</button>
									</div>
								</div>
							</div>
						</div>
						<!-- �˳�ȷ�� Modal ����-->




	
	
						<!-- footer ���� -->
						<footer class="templatemo-footer">
							<div class="templatemo-copyright">
								<p><span style="color:#4a4;">��watch��ر���ϵͳ</span> made by ���� ����ʹ��<a>Chrome�����</a>������ʾ���Ч��</p>
							</div>
						</footer>
						<!-- footer ���� -->

					</div>

<!-- �������� -->
 	<div class="navbar navbar-inverse"  role="navigation" ">
 		<div class="navbar-header">
 			<div class="logo-img"><img src="image/watch_logo_web.png" width="110px"></div>
 			<div class="logo"><h1>�����ֻ��������ϵͳ</h1></div>
 			
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