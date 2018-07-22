 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>  
   <%
 if(("POST").equalsIgnoreCase(request.getMethod())){
	 if(request.getParameter("register")!=null){
		 if(request.getParameter("register").equals("New User")){
			String name=request.getParameter("name");
			String prn =request.getParameter("PRN");
			String branch=request.getParameter("BRANCH");
			String pass=request.getParameter("PASSWORD");
			String re_pass=request.getParameter("RE-PASSWORD");
			String div=request.getParameter("DIV");
			String sex=request.getParameter("gender");
			String fee=request.getParameter("fee");
			String paper=request.getParameter("paper");
					
			if(!name.isEmpty()&&!prn.isEmpty()&&!branch.isEmpty()&&!pass.isEmpty()&&!re_pass.isEmpty()&&!div.isEmpty()&&!sex.isEmpty()&&!fee.isEmpty()&&!paper.isEmpty()){
				
				if(pass.equals(re_pass)){
					
					Connection con =null;
					PreparedStatement ps;
					String q;
					try{
						
						Class.forName("com.mysql.jdbc.Driver");
						
					}
					catch(Exception e){
						e.printStackTrace();
					}
					try{
						String url="jdbc:mysql://localhost/finalproject";
						con=DriverManager.getConnection(url,"root","root");
						q="insert into Registration(Name,Prn,BRANCH,PASSWORD,RE_PASS,DIVI,GENDER,FEE,PAPER) values (?,?,?,?,?,?,?,?,?)";
						ps=con.prepareStatement(q);
						ps.setString(1,name);
						ps.setString(2,prn);
						ps.setString(3,branch);
						ps.setString(4,pass);
						ps.setString(5,re_pass);
						ps.setString(6,div);
						ps.setString(7,sex);
						ps.setString(8,fee);
						ps.setString(9,paper);
						ps.executeUpdate();
					}
					catch(Exception e){
						e.printStackTrace();
					}
					
					
					
				}
				
				
			}
			
			 
			 
			 
			 
			 
			 
		 }
		 
		 
	 }
	 
	 
 }
 
 
 %>  
   <html>
  <head>
    <style type="text/css">
        body{
    background:url("Simple.png");
        background-repeat:no-repeat;
        }
        .Reg{
            color:white;
        }
    </style>
    <script type="text/javascript">
     function NameValid(){}   
        
        
        
    </script>
    
    </head>  
<body>
    <div class="register" style="width:300px;top:50%;margin-top:-267px;left:50%;margin-left:-150px;position:absolute;text-align: center;" >
    <form class="Reg" action="" method="post">
        <input type="text" id="naam" name="name" placeholder="NAME" style="width:230px;height:30px;"/><br><br>
        <input type="text" name="PRN" placeholder="PRN" style="width:230px;height:30px;"/><br><br>
        <input type="text"name="BRANCH" placeholder="BRANCH" style="width:230px;height:30px;"/><br><br>
        <input type="password" name="PASSWORD" placeholder="PASSWORD" style="width:230px;height:30px;"/><br><br>
        <input type="password" name="RE-PASSWORD" placeholder="RE-PASSWORD" style="width:230px;height:30px;"/><br><br>
        <input type="text" name="DIV" placeholder="DIV" style="width:230px;height:30px;"/><br>
        <h3>Choose your gender</h3>
        <input type="radio" name="gender" value="male" checked/>MALE
        <input type="radio" name="gender" value="female"/>FEMALE<br>
        <h3>Fee Submitted</h3>
        <input type="radio" name="fee" value="yes" />YES
        <input type="radio" name="fee" value="no" checked/>NO<br>
        <h3>Paper Submitted</h3>
         <input type="radio" name="paper" value="yes" />YES
        <input type="radio" name="paper" value="no" checked/>NO<br><br>
        <button name="register" value="New User" style="font-weight:bold;"  >SUBMIT</button>
        
        </form>
    
    </div>
   
    </body>



</html>