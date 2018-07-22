<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>  
<%
if(session.getAttribute("TheUser")!=null){
String user=session.getAttribute("TheUser").toString();
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
	
	 q="select FEE,PAPER from Registration where Prn=?";;
 ps=con.prepareStatement(q);
	ps.setString(1,user);
	rs=ps.executeQuery();
if(rs.next()){
	String b=rs.getString("FEE");
	String c=rs.getString("PAPER");
	session.setAttribute("fee", b);
	session.setAttribute("paper",c);
	out.println("<html>");
	out.println("<head>");
	out.print("FEE SUBMITTED:"+session.getAttribute("fee").toString());
	out.println("<br><br>");
	out.println("PAPER SUBMITTED:"+session.getAttribute("paper").toString());
	out.println("</head>");
	out.println("</html>");
}}

catch(SQLException e){
	e.printStackTrace();
}
}
%>
