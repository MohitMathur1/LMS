<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a> <a href="#" class="current">Library Fine Detail</a> </div>
  </div>

  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> 
                     <h5>Library Fine List</h5>
          </div>
         <%-- <div class="widget-content nopadding">
              <div class="controls" style="width:110px;">
            <select class="form-control" id="exampleFormControlSelect1">
      <option>--Session--</option>
     </select>
</div>
             </div--%>
             <table class="table table-bordered data-table" style="width: 100%;border-spacing: 2px;
     		border-bottom: 4px solid #e4e4e4 !important;
     		 border-top: 4px solid #e4e4e4 !important;">
              <thead>
                <tr style="border:2px solid;">
                  <th>S.No.</th>
                  <th>Student Name</th>
                  <th>Member_ID</th>
                  <th>Library Card No</th>
                  <th>Class</th>
                  <th>Paid fine</th>
                  
                </tr>
              </thead>
          <%
          	Class.forName("oracle.jdbc.driver.OracleDriver");
  			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
          	String sql3="select member_id,Lno,name,class,SUM(fine) from finedetails group by Lno,name,member_id,class";
  			PreparedStatement psmt3=con.prepareStatement(sql3);
  			ResultSet rs=psmt3.executeQuery();
  			int count=0;
  			while(rs.next())
  			{
  				count++;
  				
          %>
           <tbody>
                <tr>
                 
                  <td> <% out.print(count); %></td>
                  <td><% out.print(rs.getString(3)); %></td>
                  <td><% out.print(rs.getInt(1)); %></td>
                  <td><% out.print(rs.getString(2)); %></td>
                  <td><% out.print(rs.getString(4)); %></td>
                  <td><% out.print(rs.getInt(5)); %></td>
                 
                 <%
                 }
                  %>
                </tr>
                
              </tbody>
          
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
