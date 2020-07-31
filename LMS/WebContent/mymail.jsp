<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.mail.internet.*" %>

<%

    //Creating a result for getting status that messsage is delivered or not!

    String result="";

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("email");

   //final String subject = request.getParameter("sub");

  //final String messg = request.getParameter("mess");
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
	
    Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
    String body=null;
    String sql="select username,password from adminpage where email='"+to+"'";
	PreparedStatement ps=c.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	String user=rs.getString(1);
	String passw=rs.getString(2);
	body=body+"\nUsername : "+user+"\nyour Password is :"+passw;

    // Sender's email ID and password needs to be mentioned
	}
    final String from = "mohit.ethovia@gmail.com";

    final String pass = "mohit9911500";

    
    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties
    
    
props.put("mail.smtp.user","Your username"); 
props.put("mail.smtp.host", "smtp.gmail.com"); 
props.put("mail.smtp.port", "25"); 
props.put("mail.debug", "true"); 
props.put("mail.smtp.auth", "true"); 
props.put("mail.smtp.starttls.enable","true"); 
props.put("mail.smtp.EnableSSL.enable","true");

props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
props.setProperty("mail.smtp.socketFactory.fallbac k", "false"); 
props.setProperty("mail.smtp.port", "465"); 
props.setProperty("mail.smtp.socketFactory.port", "465"); 


 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

        message.addRecipient(Message.RecipientType.TO,

        		
        		
        		
        		
                new InternetAddress("mohit.ethovia@gmail.com"));

        // Set Subject: header field

        message.setSubject("Username and Password for the Library Page");

        // Now set the actual message

        message.setText("mohit.ethovia@gmail.com");

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";
        String msg="Username and Password has been mailed";
		request.getSession().setAttribute("mes", msg);
		response.sendRedirect("index.jsp");

    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";

    }

%>