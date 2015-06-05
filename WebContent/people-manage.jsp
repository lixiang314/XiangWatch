<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@ page import="com.myservlet.connect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>智能手环健康监控系统</title>
	<script type="text/javascript" src="js/main.js"></script>
	<link rel="stylesheet" href="css/main-style.css">
</head>


<body>
	

	<div class="template-page-wrapper">

		<div class="navbar-collapse collapse templatemo-sidebar">
			<ul class="templatemo-sidebar-menu">
				<li>
					<a href="health-monitor.jsp">
						<div class="icon_heart"></div>

						<!-- 显示消息数量 -->
						<span class="badge pull-right">1</span>		
						健康监测
					</a>
				</li>
				<li  class="active">
					<a href="#">
						<div class="icon_people_focus"></div>
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




		<!-- 主体 -->
		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">

				<ul class="nav nav-tabs" role="tablist" id="templatemo-tabs">
					<li class="activecover active"><a href="#all" role="tab" data-toggle="tab">所有人员</a></li>
					<!-- <li><a href="#unusual" role="tab" data-toggle="tab" >异常床位</a></li>
					<li><a href="#notempty" role="tab" data-toggle="tab">非空床位</a></li> -->

				</ul>
				<div id="line-hr"></div>

				<!-- 查询表单 -->
				<div class="select-content">

					
					<div style="margin:0 0 20px 5px;">
						<input type="checkbox" id="checkboxAll" onclick="isAllChecked()">
						<label>全选</label>
						<input type="submit" class="btn btn-danger" value="删除选中" href="javascript:;" data-toggle="modal" data-target="#deleteCheckedModal">
						<input type="button" onclick="window.location.replace('people-new.jsp')" class="btn btn-success" style="margin-left:10px;" value="新增人员">
					</div>
				

				</div>
				<!-- - - - -->

				<!-- Tab panes -->
				<div class="tab-content">			
					<div class="tab-pane fade in active" id="all-table">
						<table class="table table-striped table-hover table-bordered">
							<thead>
								<tr>
									<th width="5%"></th>
									<th width="10%">姓名</th>
									<th width="10%">性别</th>
									<th width="10%">年龄</th>
									<th width="15%">楼号与房间</th>
									<th width="10%">床号</th>
									<th width="19%">家属联系方式</th>
									<th width="7%">操作</th>
									<th width="7%"></th>
									<th width="7%"></th>
								</tr>
							</thead>

							<tbody>
							
							
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
									String gender = rs.getString("gender");
									String age = rs.getString("age");
									String buildId = rs.getString("buildId");
									String roomId = rs.getString("roomId");
									String bedId = rs.getString("bedId");
									int deleteId = id;
							%>
							
								
									<tr>
									<td><input type="checkbox" class="checkbox-style everyCheck" id="checkPeople-<%=id%>"></td>
									<td><a href="people-state.jsp?id=<%=id %>">  <%=name %> </a></td>
									<td>				<%=gender %>       		</td>
									<td>				<%=age %>				</td>
									<td>				<%=buildId %><span>号楼</span><%=roomId %><span>室</span></td>
									<td>				<%=bedId %><span>号</span>	</td>              
									<td>
									<div class="btn-group">

									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									查看&nbsp;<span class="caret"></span>
									<span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul class="dropdown-menu dropdown-family" role="menu" style="min-width:14em;">
									<%
									String sql1 = "select * from family where userId="+id;
									Connection conn1 = conObj.connect();
									Statement stmt1 = conObj.stmt(conn1);
									ResultSet rs1 = conObj.rs(stmt1,sql1);
									
									if(rs1!=null){
								        while (rs1.next()) {   
											String familyname = rs1.getString("name");
											String relationship = rs1.getString("relationship");
											String phone = rs1.getString("phone");
											
							

										%> <li style="float:right;"> <%=familyname %>(<%=relationship %>)-<%=phone %> &nbsp;&nbsp;</li><% 
										}
									}
									conObj.close(rs1,stmt1,conn1);
									
									%>

									    </ul>
									</div>
									</td>
									<td><a href="people-state.jsp?id=<%=id%>"><div class="icon-check"></div></a></td>
									<td><a href="people-update.jsp?id=<%=id%>"><div class="icon-edit"></div></a></td>
									<td><div class="icon-remove"  href="javascript:;" data-toggle="modal" data-target="#deleteModal-<%=id%>"></div></td>
									</tr><%
								}
							}
							conObj.close(rs,stmt,conn);

								%>



							</tbody>
						</table>


						<!-- 页码 -->
						<ul class="pagination pull-right">
							<li class="disabled"><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">4 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">5 <span class="sr-only">(current)</span></a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>  
					</div>




				</div> <!-- tab-content --> 
			</div>
		</div>


		<!-- 退出确认 Modal -->
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

		
		
		<!-- 删除确认 Modal -->
		<%
		String sql2="SELECT * FROM user";
		Connection conn2 = conObj.connect();
		Statement stmt2 = conObj.stmt(conn2);
		ResultSet rs2 = conObj.rs(stmt2,sql2);
		
		if(rs2!=null){
	        while (rs2.next()) {
	        	int idD = rs2.getInt("id");
	        	String nameD = rs2.getString("userName");
		
		

			%><div class="modal fade" id="deleteModal-<%=idD %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">确认要删除<span style="color:#09a98b;"><%=nameD %></span>的所有记录吗？（一旦删除即无法撤销！）</h4>
			</div>
			<div class="modal-footer">
			<a href="action/action-delete-people.jsp?id=<%=idD %>" class="btn btn-danger">确认</a>
			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			</div>
			</div>
			</div>
			</div><%
	        }
		}
		conObj.close(rs2,stmt2,conn2);
		%>

<%String sql3="SELECT id FROM user ORDER BY id DESC LIMIT 1";
Connection conn3 = conObj.connect();
Statement stmt3 = conObj.stmt(conn3);
ResultSet rs3 = conObj.rs(stmt3,sql3);
String max="";
if(rs3!=null){
    while (rs3.next()) {
    	max = rs3.getString("id");
    	}
    }
conObj.close(rs3,stmt3,conn3);
%>

				<!-- 多选删除确认 Modal -->
		<div class="modal fade" id="deleteCheckedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">确认要删除所有选中的人员记录吗？ （一旦删除即无法撤销！）</h4>
					</div>
					<div class="modal-footer">
						<!-- 这里和上面单独删除的modal不同，由于需要使用js判断选中了哪些数据，所以必须从main.js里跳转到action-delete来操作数据库。 -->
						<button onclick="deleteCheckPeople(<%=max %>)" class="btn btn-danger">确认</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>         


<!-- 顶部标题 -->
	<div class="navbar navbar-inverse"  role="navigation">
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

		<footer class="templatemo-footer">
			<div class="templatemo-copyright">
				<p><span style="color:#4a4;">智能手环健康监控系统</span> made by 李响 建议使用<a>Chrome浏览器</a>打开以显示最佳效果</p>
			</div>
		</footer>

	</div>




	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	
</body>
</html>