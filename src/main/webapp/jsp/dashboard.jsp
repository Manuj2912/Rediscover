<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%
//coding if session is already present and showing the login page result to tthe user
session=request.getSession(false);//returns current session if current session exits ,then new session not creates
//checking if session with attribute name "TheUser" is already present
if(session.getAttribute("TheUser")!=null){
	
	Connection con=null;
	PreparedStatement ps;
	ResultSet rs;
	String q;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
	}
		catch(Exception e){
			e.printStackTrace();
		}
	
	try{
		String url="jdbc:mysql://localhost/finalproject";
		 con =DriverManager.getConnection(url,"root","root");
		 System.out.println("hii3");
		 q="select * from Registration where Prn=?";
	 ps=con.prepareStatement(q);
		ps.setString(1,session.getAttribute("TheUser").toString());
		rs=ps.executeQuery();
		if(rs.next()){
			
			response.sendRedirect("parallax.html");
			System.out.println("SEssion Created..");
		
		}
}
	catch(SQLException e){
		e.printStackTrace();
	}
}

if("POST".equalsIgnoreCase(request.getMethod())){
	if(request.getParameter("LOGIN")!=null){
		Connection con=null;
		PreparedStatement ps;
		ResultSet rs;
		String prn=request.getParameter("PRN");
		String pass=request.getParameter("Password");
		
		
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/finalproject";
			 con=DriverManager.getConnection(url,"root","root");
			}
			catch(Exception e){
				e.printStackTrace();
			}
		

		try{
			
			String q="select * from Registration where Prn=? and Password=?";
		 ps=con.prepareStatement(q);
			ps.setString(1,prn);
			ps.setString(2,pass);
		 rs=ps.executeQuery();

			if(rs.next()){
			session=request.getSession();//creating the session 
			session.setAttribute("TheUser",prn);
			//starting the session with unique email name
			
			response.sendRedirect("dashboard.jsp");//redirecting the page from server side to the same page i.e dashboard itself to show the login result
			
			
		}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
			
		
		
		
		
	}
	
	
	
	
}


%>
