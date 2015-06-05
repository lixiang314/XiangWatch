package com.myservlet;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.sql.*;

import javax.sql.*;

import com.myservlet.*;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7042756416806244618L;
	
//	
//	private Connection conn;
//	private Statement stmt;
//	private ResultSet rs;
	String userId = null;
	HashMap hashmap = new HashMap();  
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String adjunctname = null;
		String fileDir = getServletContext().getRealPath("/image/people_face");
		System.out.println("fileDir: " + fileDir);
		// 指定上传文件的保存地址
		String message = "头像上传成功";
		String address = "";
		String filepath = "-";
		String filename = "-";
		ArrayList uploadFiles=new ArrayList();
		//request.setCharacterEncoding("UTF-8");
		if (ServletFileUpload.isMultipartContent(request)) { // 判断是否是上传文件
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(20 * 1024); // 设置内存中允许存储的字节数
			factory.setRepository(factory.getRepository()); // 设置存放临时文件的目录
			ServletFileUpload upload = new ServletFileUpload(factory); // 创建新的上传文件句柄

			int size = 2 * 1024 * 1024; // 指定上传文件的大小
			List formlists = null; // 创建保存上传文件的集合对象
			try {
				formlists = upload.parseRequest(request); // 获取上传文件集合
			} catch (FileUploadException e) {
				e.printStackTrace();  
			}
			Iterator iter = formlists.iterator(); // 获取上传文件迭代器
			while (iter.hasNext()) {
				FileItem formitem = (FileItem) iter.next(); // 获取每个上传文件
				if (!formitem.isFormField()) { // 忽略不是上传文件的表单域
					String name = formitem.getName();
					
					filename = formitem.getName();// 获取上传文件的名称(——————————存到数据库——————————)
					
					if (formitem.getSize() > size) { // 如果上传文件大于规定的上传文件的大小
						message = "您上传的文件太大，请选择不超过2M的文件";
						break; // 退出程序
					}
					String adjunctsize = new Long(formitem.getSize()).toString(); // 获取上传文件的大小
					if ((name == null) || (name.equals(""))
							&& (adjunctsize.equals("0"))) // 如果上传文件为空
						continue; // 退出程序
					adjunctname = name.substring(name.lastIndexOf("/") + 1,
							name.length());
					address = fileDir + "/" + adjunctname; // 创建上传文件的保存地址
					File saveFile = new File(address); // 根据文件保存地址，创建文件
					try {
						formitem.write(saveFile); // 向文件写数据
						filepath = "image/people_face/"+adjunctname;
						uploadFiles.add(filepath);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				else{
					 String name = formitem.getFieldName();  
			         String value = formitem.getString("UTF-8");
			         hashmap.put(name,value);   
			          
				}
			}
		}
		request.setAttribute("result", message); // 将提示信息保存在request对象中
		request.setAttribute("files", uploadFiles);
		userId = (String)hashmap.get("userId");
		
		String pagename = "people-state.jsp?id="+userId;
		String pagetext = "people-manage.jsp";
//		RequestDispatcher requestDispatcher = request.getRequestDispatcher(pagetext); // 设置相应返回地址
//		requestDispatcher.forward(request, response);
		response.sendRedirect(pagename);
		
		
		//调试
		System.out.println("地址是："+filepath+"\nid是"+userId+"\n跳转页面地址是："+pagename);
		
			///////////////////////////////////////////////
		
		 try {
	        	Class.forName("com.mysql.jdbc.Driver");
	        	connect conObj = new connect();
	        	Connection conn = conObj.connect();
	        	Statement stmt = conObj.stmt(conn);
	        	String sql = "update user set imgPath='"+filepath+"' where id="+userId;
		        int rtn = stmt.executeUpdate(sql);
		        
		        
		        conObj.close(stmt,conn);
	        	
	        }catch(Exception e){
	        	System.out.print("出现异常.");
	        	e.printStackTrace();
	        }
	        
	        /////////////////////////////////////////////
		
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
