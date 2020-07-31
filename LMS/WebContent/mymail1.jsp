<%@page import="java.sql.Date"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="java.sql.*,LMS.CO.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.time.format.*"%>
<%--@ page import="java.util.Date"--%>
<%@ page import="java.text.SimpleDateFormat"%>
<% 
mdjavahash md = new mdjavahash();
String smail =request.getParameter("email");
int profile_id = 0;
if(smail!=null)
{
 	try{
// Register JDBC driver


		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
		Statement stmt = con.createStatement();
		out.print("Mohit");
 		String sql1;
		sql1="select  email from adminpage where email = '"+smail+"'";

  		ResultSet rs1=stmt.executeQuery(sql1);
  
		if(rs1.next())
		{
    		String sql;
    		sql = "select profile_id from adminpage where email='"+smail+"'";
     		ResultSet rs2 = stmt.executeQuery(sql);
    

    // Extract data from result set
   			while(rs2.next()){
       //Retrieve by column name
     			profile_id  = rs2.getInt("profile_id");
   	 		}
   		
    		java.sql.Timestamp  intime = new java.sql.Timestamp(new java.util.Date().getTime());
    		Calendar cal = Calendar.getInstance();
    		cal.setTimeInMillis(intime.getTime());
    		cal.add(Calendar.MINUTE, 20);
    //SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); 
    		java.sql.Timestamp  exptime = new Timestamp(cal.getTime().getTime());
    		out.print(exptime);
    		/*SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		Calendar cal = Calendar.getInstance();
    		String intime=dateFormat.format(cal);*/
    		int rand_num = (int) (Math.random() * 1000000);
    		String rand = Integer.toString(rand_num);
    		String finale =(rand+""+intime); // 
    		String hash = md.getHashPass(finale); //hash code
    		out.print("Mohit");
    		String save_hash = "insert into  reset_password (profile_id, hash_code,exptime,datetime) values("+profile_id+", '"+hash+"','"+exptime+"','"+intime+"')";
    		int saved = stmt.executeUpdate(save_hash);
    		out.print("Mohit");
    		if(saved>0)
    		{
  				String link = "http://localhost:8089/LMS/reset_password.jsp";     
  //bhagawat till here, you have fetch email and verified with the email 
// from 
  //datbase and retrived password from the db.
    //-----------------------------------------------
				String host="", user="", pass=""; 
				host = "smtp.gmail.com"; user = "mohit.ethovia@gmail.com"; 
//"email@removed" // email id to send the emails 
				pass = "gmail@ethovia"; //Your gmail password 
				String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; 
				String to = smail;  
				String from = "mohit.ethovia@gmail.com";  
				String subject = "Password Reset"; 
 				String messageText = " Click <a href='"+link+"?key="+hash+">Here</a> To Reset your Password."
		 		+"You must reset your password within 20  minutes.";
 //messageString; 
   				String fileAttachment = ""; 
   				boolean WasEmailSent ; 
  				boolean sessionDebug = true; 
  				Properties props = System.getProperties(); 
  				props.put("mail.host", host); 
				props.put("mail.transport.protocol.", "smtp"); 
				props.put("mail.smtp.auth", "true"); 
				props.put("mail.smtp.", "true"); 
				props.put("mail.smtp.port", "465"); 
				props.put("mail.smtp.socketFactory.fallback", "false"); 
			 	props.put("mail.smtp.socketFactory.class", SSL_FACTORY); 
				Session mailSession = Session.getDefaultInstance(props, null); 
				mailSession.setDebug(sessionDebug); 
				Message msg = new MimeMessage(mailSession); 
				msg.setFrom(new InternetAddress(from)); 
				InternetAddress[] address = {new InternetAddress(to)}; 
				msg.setRecipients(Message.RecipientType.TO, address); 
				msg.setSubject(subject); 
				msg.setContent(messageText, "text/html");  
				Transport transport = mailSession.getTransport("smtp"); 
				transport.connect(host, user, pass);
    %>
 <div class="alert success" style="padding: 30px; background-color: grey; 
  color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10% 
 5% 
15% 20%;">
 <a href="forgotpassword.jsp"> <span class="closebtn" style="color: white; 
font-weight: bold; float: right; font-size: 40px; line-height: 35px; cursor: 
pointer; transition: 0.3s;">&times;</span> </a> 
 <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>Check Your Email. Link To 
Reset Your Password Is Sent To : <%out.println(" "+smail); %></strong>  
</h1>
 <center><a href="index.jsp"><h2><input type="button" value="OK"> 
</h2></a></center>
</div>
<%
				try { 
					transport.sendMessage(msg, msg.getAllRecipients()); 
					WasEmailSent = true; // assume it was sent 
				} 
				catch (Exception err) { 
					out.print(err.getMessage());
					WasEmailSent = false; // assume it's a fail 
				} 
 				transport.close();
    //-----------------------------------------------
 			}  
		
			 else{
	  %>
    <div class="alert success" style="padding: 30px; background-color: grey; 
 color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10% 
 5% 15% 20%;">
     <a href="forgotpassword.jsp"> <span class="closebtn" style="color: 
 white; font-weight: bold; float: right; font-size: 40px; line-height: 35px; 
 cursor: pointer; transition: 0.3s;">&times;</span> </a> 
     <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>There Is No Email As 
 Such <%out.println(" "+smail); %></strong>Try Again  </h1>
     <center><a href="forgotpassword.jsp"><h2><input type="button" 
 value="OK"></h2></a></center>
    </div>
  
    <%     
 			}  

			stmt.close();
			rs1.close();
			con.close();
		}
 	}
			catch(SQLException se){
//Handle errors for JDBC
			se.printStackTrace();
			}
 			catch(Exception e){
//Handle errors for Class.forName
			e.printStackTrace();
			}
		}

else{
    %>
 <div class="alert success" style="padding: 30px; background-color: grey; 
 color: white; opacity: 1; transition: opacity 0.6s; width:50%; margin: 10% 
 5% 15% 20%;">
  <a href="forgotpassword.jsp"> <span class="closebtn" style="color: white; 
  font-weight: bold; float: right; font-size: 40px; line-height: 35px; 
 cursor: 
 pointer; transition: 0.3s;">&times;</span> </a> 
 <h1 style="font-size:30px;">&nbsp;&nbsp; <strong>Please Enter The Valid 
 Email Address</strong>  </h1>
 <center><a href="forgotpassword.jsp"><h2><input type="button" value="OK"> 
 </h2></a></center>
 </div>
 <%    
  }

  %>