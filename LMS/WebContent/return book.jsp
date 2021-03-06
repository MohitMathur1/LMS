<%@page import="java.sql.Date"%>
<%--@page import="java.util.Date"--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.time.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="${pageContext.request.contextPath }/Logout"><i class="icon-key"></i> Log Out</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
    <li class=""><a title="" href="${pageContext.request.contextPath }/Logout"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>

<!--start-top-search-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-search--> 

<!--sidebar-menu-->

<div id="sidebar"> <a href="#" class="visible-phone"><i class="icon icon-list"></i>Forms</a>
  <ul>
      <li class="submenu active"> <a href="#"><i class="icon icon-list"></i> <span>Library Management</span></a>
      <ul>
         <li><a href="library setting.jsp">Library Settings</a></li>
        <li><a href="add book.jsp">Add Book</a></li>
        <li><a href="book list.jsp">Book List</a></li>
          <li><a href="member list.jsp">Member List</a></li>
        <li><a href="issue book.jsp">Issue Book</a></li>
        <li><a href="member card.jsp">Member ID Card</a></li>
      <li><a href="return book.jsp">Return Book</a></li>
        <li><a href="library fine detail.jsp">Library Fine Detail</a></li>
      
     
      </ul>
    </li>
  
   </ul>
</div>
<div id="content">
  <div id="content-header">
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a> <a href="#" class="current">Return Book</a> </div>
  </div>
 
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> 
                     <h5>Return Book</h5>
          </div>
          	<p align="left" style="color: purple;">${message}</p>
			<c:remove var="message" scope="session" /> 
        
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="returnbook1.jsp" name="basic_validate" id="basic_validate" novalidate="novalidate">
              <div class="control-group">
                <label class="control-label">Library Card No*</label><span> <div class="widget-title" style="float: right;"> 
                     <h5>Personal Information</h5>
          </div>
         </span>
                <div class="controls">
                  <input type="text" name="librarycard" id="required" placeholder="Enter Library Card No" required="required">
                </div>
              </div>
                <div class="control-group">
              <label class="control-label">Return Date* </label>

			
              <div class="controls">
                        <input type="date" id="start" name="returndate1" required="required"/>
    
               </div>
            </div>
          <input type="submit" name="btn" value="Submit"> 
                <div class="widget-box">
          <div class="widget-title"> 
            <h5>issued Book Details</h5>
                <table class="table table-bordered table-striped with-check"  style="width: 100%;border-spacing: 2px;
     border-bottom: 4px solid #e4e4e4 !important;
      border-top: 4px solid #e4e4e4 !important;
   ">
              <thead>
                <tr>
                  
                  <th>S.NO</th>
                  <th>Library Card No.</th>
                   <th>Book Id</th>
                  
                  <th>Book Title</th>
                   <th>Issue Date</th>
                    <th>Return Date</th>
                    <th>Fine(Per Day)</th>
                    <th>Total Fine</th>
                       <th><a href="">Return</a>
                       <a href="">Reissue</a></th>
                
                </tr>
                </thead>    
              
 				<%--
 				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
 				SimpleDateFormat dtformat=new SimpleDateFormat("dd-MM-yyyy"); 
 				String date=request.getParameter("returndate1");
 				java.util.Date dt1=dtformat.parse(date); 
 				java.sql.Date sqlDate = new java.sql.Date(dt1.getTime());
 				LocalDate date1 = sqlDate.toLocalDate();
              	Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			  	String Lno= request.getParameter("librarycard");
    	        String sql="select * from issuebook where lno="+Lno+" ";
          	    PreparedStatement psmt=con.prepareStatement(sql);
             	ResultSet rs=psmt.executeQuery();
             	int count=0;
             	while(rs.next())
             	{
             		String Lno1=rs.getString(1);
             		int bookid1=rs.getInt(2);
             		Date returndate2=rs.getDate(5);
             		java.sql.Date returndat=new Date(returndate2.getTime());
             		int fine=rs.getInt(6);
             		LocalDate rrr=returndate2.toLocalDate();
             		Period diff = Period.between(rrr, date1 );
             		int finesum;
             		int days=diff.getDays();
             		int totalfine = days*fine; 
             		if(totalfine>0)
             		{
             			finesum=totalfine;
             		}
             		else
             			finesum=0; 
             		
             		count++;
              --%>
          
              <tbody>
                <tr>
                 
                  <td> <%-- out.print(count); --%></td>
                  <td><%-- out.print(rs.getString(1)); --%></td>
                  <td><%-- out.print(bookid1); --%></td>
                  <td><%-- out.print(rs.getString(3)); --%></td>
                  <td><%-- out.print(rs.getDate(4)); --%></td>
                  <td><%-- out.print(rs.getDate(5)); --%></td>
                  <td><%-- out.print(rs.getInt(6)); --%></td>
                  <td><%-- out.print(finesum); --%></td>
                  <td><%--<a href="ReturnBook?item=<%=Lno1%>&item2=<%=bookid1%>&item4=<%=finesum%>">Return</a>
                       <a href="Reissue?item=<%=Lno1%>&item2=<%=bookid1%>&item3=<%=date%>&item4=<%=finesum%>">Reissue</a> --%></td>
                 <%--
                 }
                  --%>
                </tr>
                
              </tbody>
                    </table>
        
        
          </div>
        </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    </div>
<!--end-Footer-part-->
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/jquery.validate.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.form_validation.js"></script>
</body>
</html>
