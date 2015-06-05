<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
				<li>
					<a href="health-monitor.jsp">
						<div class="icon_heart"></div>

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
				<li  class="active">
					<a href="device-manage.jsp">
						<div class="icon_device_focus"></div>
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
					<li class="activecover active"><a href="#all" role="tab" data-toggle="tab">新增手环</a></li>
					<!-- <li><a href="#unusual" role="tab" data-toggle="tab" >异常床位</a></li>
					<li><a href="#notempty" role="tab" data-toggle="tab">非空床位</a></li> -->

				</ul>
				<div id="line-hr"></div>
				<div class="new-form">
					<form name="form-device-new" action="action/action-new-device.jsp" method="post">
						<table>
							<tbody>
								<tr>
									<td><label for="name" class="new-form-tips">手环编号</label></td>
									<td><input type="text" class="form-control" id="new-deviceId" value="" name="new-deviceId"></td>
								</tr>

								

								<!-- <tr>
									<td><label for="name" class="new-form-tips">配置时间</label></td>
									<td><input type="text" class="form-control" id="new-date" value=""  name="new-date"></td>
								</tr> -->

								<!-- <tr>
									<td><label for="deviceId" class="new-form-tips">设备信息</label></td>
									<td><input type="text" class="form-control" id="new-deviceId" value=""  name="new-deviceId"></td>
								</tr> -->
							</tbody>
						</table>

						<table class="new-form-location"><tbody>
							<tr>
								<td><label class="new-form-tips">位置</label></td>
								<td><input type="text" class="form-control" id="new-buildingId" value=""  name="new-buildId"></td>
								<td><label for="buildingId" class="new-form-location-tips">楼</label></td>
								<td><input type="text" class="form-control" id="new-roomId" value=""  name="new-roomId"></td>
								<td><label for="roomId" class="new-form-location-tips">室</label></td>
								<td><input type="text" class="form-control" id="new-bedId" value=""  name="new-bedId"></td>
								<td><label for="bedId" class="new-form-location-tips">号床</label></td>
							</tr>

						</tbody></table>

						<div id="new-form-submit"><input type="submit" class=" btn btn-success" id="new-submit" value="提 交"></div>
	                    
					</form>
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
		</body>
		</html>