<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="java.sql.*,LMS.CO.*" %>
<%@ page import="javax.mail.internet.*" %>



<%  
 mdjavahash md = new mdjavahash();
 String profile_id= request.getParameter("profile_id");
 String np= request.getParameter("newpassword");
 String cp = request.getParameter("confirmpassword");
 //out.println(np +"/"+ cp);

 if( np.equals(" ") || cp.equals(" ")){%>
 <div class="alert success" style="padding: 30px; background-color: grey; 
 color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10% 
 5% 15% 20%;">
     <a href="reset_password?profile_id=<%=profile_id%>"> <span 
  class="closebtn" style="color: white; font-weight: bold; float: right; 
    font-size: 40px; line-height: 35px; cursor: pointer; transition: 
   0.3s;">&times;</span> </a> 
     <h1 style="font-size:30px;">&nbsp;&nbsp; Please Fill Both The Fields 
    </h1>
     <center><a href="reset_password?profile_id=<%=profile_id%>""><h2><input 
    type="button" value="OK"></h2></a></center>
   </div>   
   <% }
   else if(!np.equals(cp)){
    %>
    <div class="alert success" style="padding: 30px; background-color: grey; 
  color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10% 
  5% 15% 20%;">
         <a href="reset_password?profile_id=<%=profile_id%>"> <span 
     class="closebtn" style="color: white; font-weight: bold; float: right; 
        font-size: 40px; line-height: 35px; cursor: pointer; transition: 
             0.3s;">&times;</span> </a> 
         <h1 style="font-size:30px;">&nbsp;&nbsp; The Two Passwords Do Not 
        Match. Try Again </h1>
         <center><a href="reset_password?profile_id=<%=profile_id%>"><h2> 
           <input type="button" value="OK"></h2></a></center>
        </div>
      <%        
     }
    else{   
      try{
   	     // Register JDBC driver
   		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
		 Statement stmt = con.createStatement();

        stmt.executeUpdate("update adminpage set password='"+np+"' where profile_id="+profile_id+"");
        //response.sendRedirect("mainpage.jsp");
        %>
        <div class="alert success" style="padding: 30px; background-color: 
       grey; color: white; opacity: 1; transition: opacity 0.6s; width:65%; 
      margin: 10% 5% 15% 20%;">
         <a href="login.jsp"> <span class="closebtn" style="color: white; 
        font-weight: bold; float: right; font-size: 40px; line-height: 35px; 
         cursor: pointer; transition: 0.3s;">&times;</span> </a> 
         <h1 style="font-size:30px;">&nbsp;&nbsp; The Password Is 
            Successfully Reset.<br>&nbsp;&nbsp; Try Login With New 
             Password</h1>
         <br><br><center><a href="index.jsp"><p style="font-size:20px"> 
            <input type="button" style="width:40px; height:35px;" 
        value="OK"></p></a> 
        </center>
           </div>                   
          <%
           stmt.close();
           con.close();
        }catch(Exception se){
          //Handle errors for JDBC
           se.printStackTrace();
        }
  } 
%>