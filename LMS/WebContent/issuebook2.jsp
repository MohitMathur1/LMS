<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.time.*" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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


<%
Connection con;
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
%>


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
        <li><a href="Logout"><i class="icon-key"></i> Log Out</a></li>
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
    <li class=""><a title="" href="Logout"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>

<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch--> 

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
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a> <a href="#" class="current">Issue Book</a> </div>
  </div>

  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> 
                     <h5>Issue Book</h5>
          </div>
          <%
          String Lno=request.getParameter("Librarycardno");
           String name= null;
          String sql2="select NAME from memberdetails where Lno='"+Lno+"'";
			PreparedStatement psmt1=con.prepareStatement(sql2);
			ResultSet rs2=psmt1.executeQuery();
			while (rs2.next())
				
			{
				
			    //Lno=rs2.getString(1);
		
			    name=rs2.getString(1);
			}
			out.print("Welcome "+name);
          %>
           <p align="left" style="color: red;">${message1}</p>
		<c:remove var="message" scope="session" /> 
        
             <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="issuebook2.jsp" name="basic_validate" id="basic_validate" novalidate="novalidate">
              <div class="control-group">
                <label class="control-label">Library Card No*</label> <span><div class="widget-title" style="float: right;"> 
                     <h5>Personal Information</h5>
          </div></span>
                <div class="controls">
                  <input type="text" name="Librarycardno" id="required" placeholder="Enter Library Card No">
                </div>
              </div>
                  
              <div class="control-group">
              <div class="controls">
                        <input type="submit" name="btn1"
               value="Find" />
    
               </div>
            </div>
         <%-- 
              <div class="control-group">
              <label class="control-label">From Date* </label>

              <div class="controls">
                        <input type="date" id="start" name="book"
               min="2018-01-01" max="2070-01-01" />
    
               </div>
            </div>
          --%>
              </form>
            <div class="widget-box">
          <div class="widget-title"> 
            <h5>Already issued Book Details</h5>
          </div>
             <table class="table table-bordered table-striped with-check" style="width: 100%;border-spacing: 2px;
     border-bottom: 4px solid #e4e4e4 !important;
      border-top: 4px solid #e4e4e4 !important;">
              <thead>
                <tr>
                  
                  <th>S.NO</th>
                  <th>Library Card No.</th>
                   <th>Book Id</th>
                  <th>Book Title</th>
                   <th>Issue Date</th>
                    <th>Return Date</th>
                    <th>Late Fine(Per Day)</th>
                </tr>
              </thead>
              <tbody>
              <%
            
              
              String sql="select * from issuebook where Lno="+Lno+" ";
              PreparedStatement psmt=con.prepareStatement(sql);
              session.setAttribute("librarycard", Lno);
              ResultSet rs=psmt.executeQuery();
              int count=0;
              while(rs.next())
              {
            	  count++;
            	 
              %>
                <tr>
                  <td><%out.print(count); %></td>
                  <td><%out.print(rs.getString(1)); %></td>
                  <td><%out.print(rs.getString(2)); %></td>
                  <td><%out.print(rs.getString(3)); %></td>
                  <td><%out.print(rs.getDate(4)); %></td>
                  <td><%out.print(rs.getDate(5)); %></td>
                  <td><%out.print(rs.getInt(6)); %></td>
                </tr>
                <%
                
                
              }
              session.setAttribute("Count", count);
             out.print(count);
           	
              %>
              </tbody>
              </table>
          
           </div>
        </div>
        <form action="bookissue" onsubmit="return check(Count,noofbookspercard);">
         <div class="widget-title"> 
            <h5>Book Issue</h5>
            <%  %>
          </div>
             <table class="table table-bordered table-striped with-check" style="width: 100%;border-spacing: 2px;
     border-bottom: 4px solid #e4e4e4 !important;
      border-top: 4px solid #e4e4e4 !important;">
              <thead>
                <tr>

               
                   <th>Book Id</th>
                   <th>Issue Date</th>
                   <th></th>
                
                </tr>
              </thead>
              <%
              
              //LocalDate date=LocalDate.now();
 			//session.setAttribute("issuedate", date);
 			 //response.sendRedirect("library setting.jsp");
 			//request.getAttribute("Count");
 			
 			int noofbookspercard=0;
      		String sql3="select bookspercard from LibrarySettings where active='1'";
			PreparedStatement psmt3=con.prepareStatement(sql3);
			ResultSet rs3=psmt3.executeQuery(sql3);
		while (rs3.next())
		{
			noofbookspercard=rs3.getInt(1);
			
		}
		session.setAttribute("bookspercard", noofbookspercard);
		
      %>
              <tbody>
                <tr>
                  <td><input type="text" name="bookid" placeholder="Enter Book ID"></td>
                  <td> <div class="controls"><input type="date" id="start" name="issuedate"/></div></td>
 				
                     <td><input type="submit" name="btn1" value="Issue" /></td>
   
    
 
                </tr>
                
              </tbody>
              </table>
      
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
