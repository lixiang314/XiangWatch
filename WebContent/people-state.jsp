<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*" %>
    <%@ page import="com.myservlet.connect"%>
    <%@ page import="java.net.URLEncoder"%>
    
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.data.category.CategoryDataset" %>
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.plot.PiePlot"%>
<%@ page import="org.jfree.chart.ChartRenderingInfo"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="org.jfree.chart.urls.StandardPieURLGenerator"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@ page import="org.jfree.chart.encoders.SunPNGEncoderAdapter"%>
<%@ page import="org.jfree.chart.StandardChartTheme"%>
<%@ page import="org.jfree.chart.ChartFactory"%>
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.chart.axis.CategoryAxis"%>
<%@ page import="org.jfree.chart.renderer.category.BarRenderer"%>
<%@ page import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>
<%@ page import="java.awt.Font"%>
<%@ page import="java.awt.Color"%>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
response.setContentType("text/html; charset=utf-8"); 
%>


  

<html lang="en">
<head>
	<meta charset="utf-8">
	<title>智能手环健康监控系统</title>

	<link rel="stylesheet" href="css/main-style.css">
	<script type="text/javascript" src="js/main.js"></script>

</head>


<%
	
	
	ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());

 	//实现折现图
 	DefaultCategoryDataset mDatasetline = new DefaultCategoryDataset();
	mDatasetline.addValue(51, "First", "0:00");
	mDatasetline.addValue(54, "First", "1:00");
	mDatasetline.addValue(53, "First", "2:00");
	mDatasetline.addValue(56, "First", "3:00");
	mDatasetline.addValue(54, "First", "4:00");
	mDatasetline.addValue(59, "First", "5:00");
	mDatasetline.addValue(58, "First", "6:00");
	mDatasetline.addValue(56, "First", "7:00");
	mDatasetline.addValue(57, "First", "8:00");
	mDatasetline.addValue(55, "First", "9:00");
	
	DefaultCategoryDataset mDatasetline2 = new DefaultCategoryDataset();
	mDatasetline2.addValue(15, "First", "0:00");
	mDatasetline2.addValue(13, "First", "1:00");
	mDatasetline2.addValue(14, "First", "2:00");
	mDatasetline2.addValue(15, "First", "3:00");
	mDatasetline2.addValue(18, "First", "4:00");
	mDatasetline2.addValue(17, "First", "5:00");
	mDatasetline2.addValue(18, "First", "6:00");
	mDatasetline2.addValue(16, "First", "7:00");
	mDatasetline2.addValue(14, "First", "8:00");
	mDatasetline2.addValue(17, "First", "9:00");
	
	
	DefaultCategoryDataset mDatasetline3 = new DefaultCategoryDataset();
	mDatasetline3.addValue(0, "First", "0:00");
	mDatasetline3.addValue(0, "First", "1:00");
	mDatasetline3.addValue(0, "First", "2:00");
	mDatasetline3.addValue(0, "First", "3:00");
	mDatasetline3.addValue(0, "First", "4:00");
	mDatasetline3.addValue(0, "First", "5:00");
	mDatasetline3.addValue(0, "First", "6:00");
	mDatasetline3.addValue(0.2, "First", "7:00");
	mDatasetline3.addValue(0.4, "First", "8:00");
	mDatasetline3.addValue(0.5, "First", "9:00");


	
	StandardChartTheme mChartThemeline = new StandardChartTheme("CN");
	mChartThemeline.setLargeFont(new Font("黑体", Font.BOLD, 8));
	mChartThemeline.setExtraLargeFont(new Font("宋体", Font.PLAIN, 13));
	mChartThemeline.setRegularFont(new Font("宋体", Font.PLAIN, 13));
	ChartFactory.setChartTheme(mChartThemeline);
			
	JFreeChart mChartline = ChartFactory.createLineChart(
				null,null,null,
				mDatasetline,PlotOrientation.VERTICAL,
				false, false, false);
	
	JFreeChart mChartline2 = ChartFactory.createLineChart(
			null,null,null,
			mDatasetline2,PlotOrientation.VERTICAL,
			false, false, false);
	
	JFreeChart mChartline3 = ChartFactory.createLineChart(
			null,null,null,
			mDatasetline3,PlotOrientation.VERTICAL,
			false, false, false);
		
	CategoryPlot mPlotline = (CategoryPlot)mChartline.getPlot();
	mPlotline.setBackgroundPaint(Color.WHITE);
	mPlotline.setRangeGridlinePaint(Color.BLUE);//背景底部横虚线
	mPlotline.setOutlinePaint(null);//边界线
	
	CategoryPlot mPlotline2 = (CategoryPlot)mChartline2.getPlot();
	mPlotline2.setBackgroundPaint(Color.WHITE);
	mPlotline2.setRangeGridlinePaint(Color.BLUE);//背景底部横虚线
	mPlotline2.setOutlinePaint(null);//边界线
	
	CategoryPlot mPlotline3 = (CategoryPlot)mChartline3.getPlot();
	mPlotline3.setBackgroundPaint(Color.WHITE);
	mPlotline3.setRangeGridlinePaint(Color.BLUE);//背景底部横虚线
	mPlotline3.setOutlinePaint(null);//边界线
	
	//500是图片长度，300是图片高度
	String filenameline = ServletUtilities.saveChartAsPNG(mChartline, 530, 210, info, session);
	String graphURLline = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenameline; 
	
	String filenameline2 = ServletUtilities.saveChartAsPNG(mChartline2, 530, 210, info, session);
	String graphURLline2 = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenameline2; 
	
	String filenameline3 = ServletUtilities.saveChartAsPNG(mChartline3, 530, 210, info, session);
	String graphURLline3 = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenameline3; 
  %>
  
  <%
	//显示柱状图
	DefaultCategoryDataset mDataset = new DefaultCategoryDataset();
	mDataset.addValue(0, "", "0:00");
	mDataset.addValue(0, "", "2:00");
	mDataset.addValue(0, "", "3:00");
	mDataset.addValue(0, "", "4:00");
	mDataset.addValue(0, "", "5:00");
	mDataset.addValue(0, "", "6:00");
	mDataset.addValue(0.2, "", "7:00");
	mDataset.addValue(0.3, "", "8:00");
	mDataset.addValue(0.5, "", "9:00");

	
	//创建主题样式
	StandardChartTheme mChartTheme = new StandardChartTheme("UK");
	//设置图表标题
	mChartTheme.setExtraLargeFont(new Font("黑体", Font.BOLD, 8));
	//设置轴向字体
	mChartTheme.setLargeFont(new Font("宋体", Font.PLAIN, 8));
	//设置图例字体
	mChartTheme.setRegularFont(new Font("宋体", Font.PLAIN, 8));
	//应用主题
	ChartFactory.setChartTheme(mChartTheme);
	
	JFreeChart mChart = ChartFactory.createBarChart3D(
				null, 
				null, 
				null,
				mDataset, 
				PlotOrientation.VERTICAL, 
				false, 
				false,false);
	//设置内部属性
	CategoryPlot mPlot = (CategoryPlot)mChart.getPlot();
	CategoryAxis mDomainAxis = mPlot.getDomainAxis();
	//设置柱状图距离x轴最左端（即y轴）的距离百分比10%
	//mDomainAxis.setLowerMargin(0.1);
	mDomainAxis.setUpperMargin(0.1);
	//柱体显示数值
	BarRenderer mRenderer = new BarRenderer();
	mRenderer.setItemLabelGenerator(new StandardCategoryItemLabelGenerator());
	mRenderer.setItemLabelFont(new Font("宋体", Font.PLAIN, 15));
	mRenderer.setItemLabelsVisible(true);
	mPlot.setRenderer(mRenderer);
	
	//500是图片长度，300是图片高度
	String filenamebar = ServletUtilities.saveChartAsPNG(mChart, 530, 210, info, session);
	String graphURLbar = request.getContextPath() + "/servlet/DisplayChart?filename=" + filenamebar;  
 %>
  
  
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
						<table width="100%" style="line-height:32px;font-size:17px;">
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
						<!-- <div style="width:530px;height:210px;background-color:rgba(0,100,200,0.3);position:absolute;filter: alpha (opacity=50);-moz-opacity: 0.50; opacity: 0.50;"></div> -->     
						<img src="<%= graphURLline %>" width=530 height=210 border=0 usemap="#<%= filenameline %>" style="filter: alpha (opacity=50);-moz-opacity: 0.50; opacity: 0.50;">
									
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
						<img src="<%= graphURLline2 %>" width=530 height=210 border=0 usemap="#<%= filenameline2 %>" style="filter: alpha (opacity=50);-moz-opacity: 0.50; opacity: 0.50;">                      
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
					          
						<!-- <div id="move-chart"  style="width: 550px; height: 230px; margin: 0 0 0 -20px;"></div> -->
						<img src="<%= graphURLbar %>" width=530 height=210 border=0 usemap="#<%= filenamebar %>" style="filter: alpha (opacity=50);-moz-opacity: 0.50; opacity: 0.50;">                       
					</div>

					<div class="move-info-table">
						<table width="90%">
							<tr>
								<td>当前运动状态：</td>
								<td><span>步行</span></td>
							</tr>
							<tr>
								<td>今日累计：</td>
								<td><span>1.0</span>公里</td>
							</tr>
							<tr>
								<td>本周累计：</td>
								<td><span>11.2</span>公里</td>
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
										<td><label style="float:right;">姓名</label></td>
										<td><input type="text" class="form-control" name="family-name"></td>
									</tr>
									<tr>
										<td><label style="float:right;">与用户关系</label></td>
										<td><input type="text" class="form-control" name="family-relationship"></td>
									</tr>
									<tr>
										<td><label style="float:right;">手机号码</label></td>
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






  </body>
  </html>