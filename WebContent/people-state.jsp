<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@ page import="com.myservlet.connect"%>
    <%@ page import="java.net.URLEncoder"%>
    <% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>智能手环健康监控系统</title>

	<link rel="stylesheet" href="css/main-style.css">
	<script type="text/javascript" src="js/main.js"></script>

</head>

<%
String id = request.getParameter("id");


connect conObj = new connect();
String sql="SELECT * FROM user where id ="+id;
Connection conn = conObj.connect();
Statement stmt = conObj.stmt(conn);
ResultSet rs = conObj.rs(stmt,sql);

String name = "";
String age = "";
String gender = "";
String buildId = "";
String roomId = "";
String bedId = "";
String imgPath = "";

if(rs!=null){
	while (rs.next()) {
	name = rs.getString("userName");
	age = rs.getString("age");
	gender = rs.getString("gender");
	buildId = rs.getString("buildId");
	roomId = rs.getString("roomId");
	bedId = rs.getString("bedId");
	imgPath = rs.getString("imgPath");
	
    }
	
}
conObj.close(rs,stmt,conn);



%>






<body>
	

	<div class="template-page-wrapper">

		<div class="navbar-collapse collapse templatemo-sidebar" style="min-height:1300px;">
			<ul class="templatemo-sidebar-menu">
				<li class="active">
					<a href="health-monitor.jsp">
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
		<!-- - - - - 主体 以下- - - - - -->
		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">




				<!-- 基本信息div 以下-->
				<!-- <div>健康监测 个人健康信息</div> -->
				<div class="basic-info">
				<div class="people-info">
				
					<div class="people-face">
					
						<img src="<%=imgPath %>" width="120px" href="javascript:;" data-toggle="modal" data-target="#imgModal">
						
					</div>

					<div class="basic-info-table">
						<table width="100%">
							<tr>
								<td width="30%">姓名</td>
								<td width="70%"> <span><%=name %></span></td> 
							</tr>
							<tr>
								<td>性别</td>
								<td><span><%=gender %></span></td>
							</tr>         
							<tr>
								<td>年龄</td>
								<td><span><%=age %></span></td>
							</tr>
							<tr>
								<td>楼室</td>
								<td><span><%=buildId %></span>号楼<span><%=roomId %></span>室</td>
							</tr>
							<tr>
								<td>床位</td>
								<td><span><%=bedId %></span>号</td>
							</tr>
							<!-- <tr>
								<td>病史</td>
								<td><span>高血压</span></td>
							</tr> -->
						</table>
					</div>
				</div>

					<div class="relative-info">
						<div style="margin-bottom:20px;">
							<span style="color:#DDD;">家属联系方式</span>
							<input type="button" class="btn btn-success" style="float:right;" href="javascript:;" data-toggle="modal" data-target="#familyModal" value="新增">
						</div>

						<div class="relative-info-table">

							<table width="100%">
								<%
								String sql1="SELECT * FROM family where userId="+id;
								Connection conn1 = conObj.connect();
								Statement stmt1 = conObj.stmt(conn1);
								ResultSet rs1 = conObj.rs(stmt1,sql1);
								
								String familyname = "";
								String relationship = "";
								String phone = "";

								if(rs1!=null){
									while (rs1.next()) {
									familyname = rs1.getString("name");
									relationship = rs1.getString("relationship");
									phone = rs1.getString("phone");
									
									
									/* byte[] b = familyname.getBytes();
									String familyname1 = new String(b, "UTF-8"); */
									%>
									<tr>
									<td width="15%"><span><%=relationship %></span></td>
									<td width="20%"><span><%=familyname %></span></td>
									<td width="45%"><span><%=phone %></span></td>
									<td width="20%"><a href="#">发送短信</a></td>
								</tr><%
									}
								}
								conObj.close(rs1,stmt1,conn1);
								
								%>	

							</table>
						</div>
					</div>
				</div>
				<!-- 基本信息 以上-->


				<!-- 心率 以下-->
				<div class="heart-info">
				<p class="info-title">心率曲线变化图</p>
					<div class="chart-content">
						            
						<!-- <canvas id="heart-chart"></canvas>   -->
						<!-- <div id="heart-chart"  style="width: 550px; height: 230px; margin: 0 0 0 -20px;"></div> -->      

					</div>

					<div class="heart-info-table">
						<table width="90%">
							<tr>
								<td>当前心率：</td>
								<td><span>52</span>次/分</td>
							</tr>
							<tr>
								<td>今日平均心率：</td>
								<td><span>54</span>次/分</td>
							</tr>
							<tr>
								<td>本周平均心率：</td>
								<td><span>51</span>次/分</td>
							</tr>
						</table>
						
					</div>
				</div>
				<!-- 心率 以上-->


				<!-- 呼吸率 以下-->
				<div class="breath-info">
				<p class="info-title">呼吸率曲线变化图</p>
					<div class="chart-content">
						          
						<!-- <div id="breath-chart"  style="width: 550px; height: 230px; margin: 0 0 0 -20px;"></div> -->                      
					</div>

					<div class="breath-info-table">
						<table width="90%">
							<tr>
								<td>当前呼吸率：</td>
								<td><span>17</span>次/分</td>
							</tr>
							<tr>
								<td>今日平均呼吸率：</td>
								<td><span>15</span>次/分</td>
							</tr>
							<tr>
								<td>本周平均呼吸率：</td>
								<td><span>16</span>次/分</td>
							</tr>
						</table>
						
					</div>
				</div>
				<!-- 呼吸率 以上-->

				<div class="move-info">
				<p class="info-title">运动曲线变化图</p>
					<div class="chart-content">
					          
						<div id="move-chart"  style="width: 550px; height: 230px; margin: 0 0 0 -20px;"></div>                       
					</div>

					<div class="move-info-table">
						<table width="90%">
							<tr>
								<td>当前运动状态：</td>
								<td><span>步行</span></td>
							</tr>
							<tr>
								<td>今日累计：</td>
								<td><span>2.3</span>公里</td>
							</tr>
							<tr>
								<td>本周累计：</td>
								<td><span>11</span>公里</td>
							</tr>
						</table>
						
					</div>
				</div>


			</div>
		</div>


		<!-- - - - - 主体 以上- - - - - -->

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


<!-- 家属人员注册 Modal -->
		<div class="modal fade" id="familyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">新增家属</h4>
					</div>

					<div class="modal-footer">
						<div class="newfamily-form">
							<form action="action/action-new-family.jsp" method="post">
								<table><tbody>
									<tr>
										<td><label for="name">姓名</label></td>
										<td><input type="text" class="form-control" name="family-name"></td>
									</tr>
									<tr>
										<td><label for="name">与老人关系</label></td>
										<td><input type="text" class="form-control" name="family-relationship"></td>
									</tr>
									<tr>
										<td><label for="name">手机号码</label></td>
										<td><input type="text" class="form-control" name="family-phone"></td>
									</tr>
									<input type="hidden" name="family-userId" value="<%=id%>">
								</tbody></table>

								
								<input type="submit" class="btn btn-success" value="提交" >
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<!-- 头像上传 Modal -->
		<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">上传头像</h4>
					</div>

					<div class="modal-footer">
						<div class="newfamily-form">
							<form action="UploadServlet" method="post" 
							enctype="multipart/form-data" name="form1" 
							id="form1" onsubmit="return validate()">
								
								<input type="file" name="file1" class="form-control" style="color:#000; margin-bottom:20px;">
								<input type="hidden" name="userId" value="<%=id%>">
								
								<input type="submit" class="btn btn-success" name="Submit" value="上传" >
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


		<footer class="templatemo-footer">
			<div class="templatemo-copyright">
				<p><span style="color:#4a4;">智能手环健康监控系统</span> made by 李响 建议使用<a>Chrome浏览器</a>打开以显示最佳效果</p>
			</div>
		</footer>

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
	

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/templatemo_script.js"></script>
	<!-- <script type="text/javascript" src="jquery-1.10.1.js"></script>-->
	<script type="text/javascript" src="js/highcharts.js"></script> 


	<script type="text/javascript"> 
		var chart1; // global
		var chart2; // global
		
		function requestData1() {

			$.ajax({
				url: 'echojson/echojson-heart.jsp', 
				success: function(point) {
					var series1 = chart1.series[0],
						shift1 = series1.data.length > 20;
					chart1.series[0].addPoint(eval(point), true, shift1);
					setTimeout(requestData1, 1000);	
				},
				cache: false
			});
		}


		function requestData2() {
			$.ajax({
				url: 'echojson/echojson-breath.jsp', 
				success: function(point2) {
					var series2 = chart2.series[0],
						shift2 = series2.data.length > 20; 
					chart2.series[0].addPoint(eval(point2), true, shift2);
					setTimeout(requestData2, 1000);	
				},
				cache: false
			});

		}
		



		$(document).ready(function() {
// 心率表--------------------------------------------
			chart1 = new Highcharts.Chart({
				chart: {
					renderTo: 'heart-chart',
					defaultSeriesType: 'spline',
					events: {
						load: requestData1
					}
				},
				title: {
					text: ''
				},
				xAxis: {
					type: 'datetime',
					tickPixelInterval: 150,
					maxZoom: 20 * 1000
				},
				yAxis: {
					minPadding: 0.2,
					maxPadding: 0.2,
					title: {
						text: '',
						margin: 20
					}
				},
				series: [{
					name: '心率（次/分）',
					data: []
				}]
			});	


// 呼吸率表--------------------------------------------
			chart2 = new Highcharts.Chart({
				chart: {
					renderTo: 'breath-chart',
					defaultSeriesType: 'spline',
					events: {
						load: requestData2
					}
				},
				title: {
					text: ''
				},
				xAxis: {
					type: 'datetime',
					tickPixelInterval: 150,
					maxZoom: 20 * 1000
				},
				yAxis: {
					minPadding: 0.2,
					maxPadding: 0.2,
					title: {
						text: '',
						margin: 20
					}
				},
				series: [{
					name: '呼吸率（次/分）',
					data: []
				}]
			});	


		});
		</script>


  </body>
  </html>