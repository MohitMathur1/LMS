<%@page import="java.text.*" %>
<%@page import="java.sql.*" %>
<%
String hash = (request.getParameter("key"));

java.sql.Timestamp  curtime = new java.sql.Timestamp(new java.util.Date().getTime());

int profile_id = 0;
String exptime;

try{
// Register JDBC driver
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
Statement stmt = con.createStatement();

 String sql = "select profile_id, exptime from reset_password where hash_code ='"+hash+"'";
 ResultSet rs = stmt.executeQuery(sql);
 if(rs.next()){
 profile_id = rs.getInt("profile_id");  
 exptime = rs.getString("exptime");
 out.print("Hello");
 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
 java.util.Date parsedDate = dateFormat.parse(exptime);
 Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
  //out.println(exptime+"/"+curtime);
  if((curtime).before(parsedDate)){        
      %>
      <div class="container">
       <form class="form-signin" action="update_reset.jsp" method="Post"> 
      <br/><br/>
         <h4 class="form-signin-heading">Reset Your Password Here</h4>
         <br> 
          <text style="font-size:13px;"><span class="req" 
        style="color:red">* </span>Enter New Password</text>
         <input type="password" id="inputPassword" name="newpassword" 
       class="form-control" placeholder="New Password" required autofocus>
         <br>
          <text style="font-size:13px;"><span class="req" 
         style="color:red">* </span>Enter New Password Again</text>
         <input type="password" id="inputPassword" name="confirmpassword" 
         class="form-control" placeholder="New Password Again" required>

          <input type="hidden" name="profile_id" value=<%=profile_id %>>
        <br>
         <button class="btn btn-lg btn-primary btn-block" 
    type="submit">Reset Password</button>
       </form>
     </div> <!-- /container -->
    <% } 
    else{
        %>
        <div class="alert success" style="padding: 30px; background-color: 
   grey; color: white; opacity: 1; transition: opacity 0.6s; width:50%; 
  margin: 10% 5% 15% 20%;">
             <a href="forgotpassword.jsp"> <span class="closebtn" 
   style="color: white; font-weight: bold; float: right; font-size: 40px; 
   line-height: 35px; cursor: pointer; transition: 0.3s;">&times;</span> 
   </a> 
             <h1 style="font-size:30px;">&nbsp;&nbsp; The Time To Reset 
  Password Has Expired.<br> &nbsp;&nbsp; Try Again </h1>
             <center><a href="index.jsp"><h2><input type="button" 
     value="OK"></h2></a></center>
        </div>
       <%       
       }    
     }
   else{
    %>
    <div class="alert success" style="padding: 30px; background-color: grey; 
   color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 
    10% 5% 15% 20%;">
         <a href="forgotpassword.jsp"> <span class="closebtn" style="color: 
      white; font-weight: bold; float: right; font-size: 40px; line-height: 
       35px; cursor: pointer; transition: 0.3s;">&times;</span> </a> 
         <h1 style="font-size:30px;">&nbsp;&nbsp; The Hash Key DO Not Match. 
            <br/> &nbsp;&nbsp;&nbsp;Try Again!! </h1>
         <center><a href="index.jsp"><h2><input type="button" 
         value="OK"></h2></a></center>
        </div>
    <%
    }
   // Clean-up environment
   rs.close();
   stmt.close();
   con.close();
  }catch(SQLException se){
  //Handle errors for JDBC
  se.printStackTrace();
 }catch(Exception e){
  e.printStackTrace();
  }
%> 