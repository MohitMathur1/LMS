
<!DOCTYPE html>
 <%@page import="java.sql.*" %>
    
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
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.jsp">Matrix Admin</a></h1>
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
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a> <a href="#" class="current">Member List</a> </div>
  </div>
 

       <div class="widget-box">
          <div class="widget-title"> 
            <h5>member list</h5>
          </div>
          <div class="widget-content nopadding">
              <form class="form-horizontal" method="post" action="#" name="basic_validate"   id="basic_validate" novalidate="novalidate">
              <input type="text" name="Name" id="Name" required="required" placeholder="Enter Student Name" onkeyup="myFunction()" style="width:150px;">
                <%-- ><input type="text" name="required" id="required" placeholder="Enter Admission NO." style="width:150px;">--%>
                   <input type="text" name="LNo" id="LNo" placeholder="Enter Library Card NO." onkeyup="myFunctio()" style="width:150px;">
                 <select class="form-control selectpicker" id="Class" name="Class" style="width:150px;">
        <option>-Select Class-</option>
       <option>N.C</option>
       <option>K.G</option>
       <option>1st</option>
       <option>2nd</option>
       <option>3rd</option>
       <option>4th</option>
       <option>5th</option>
       <option>6th</option>
       <option>7th</option>
       <option>8th</option>
       <option>9th</option>
       <option>10th</option>
      <option>11th</option>
     <option>12th</option>
      </select>
      <script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("Name");
  filter = input.value.toUpperCase();
  
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
 
}
function myFunctio() {
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("LNo");
	  filter = input.value.toUpperCase();
	  
	  table = document.getElementById("mytable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[1];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	  
	 }

</script>
<script type="text/javascript">
$(document).ready(function() {
    function calculate() {
        $('#mytable tbody tr').show();
        var sel_class = $('select[name="Class"] option:selected').text();
        //var sel_gender = $('select[name="gender"] option:selected').text();

        if(sel_class == '-Select Class-') {
            return;
        }

        $('#mytable tbody tr').each(function() {
            var col_class = $(this).find('td').first();
            //var col_gender = $(this).find('td').last();

            if(col_class.text() !== sel_class && sel_class !== '-Select Class-') {
                $(this).hide();
            }

        });
    }

    $('select[name="Class"]').change(function() {
        calculate();
    });
});

</script>


                 
                 
                 <%
                Class.forName("oracle.jdbc.driver.OracleDriver");
   			  	Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
   				String sql="select * from memberdetails";
   				PreparedStatement ps=c.prepareStatement(sql);
   				ResultSet rs=ps.executeQuery();
                 
                %>
          
            <table class="dynamicTable tableTools table table-striped table-primary" id="mytable"  style="width: 150%;border-spacing: 2px;
     border-bottom: 4px solid #e4e4e4 !important;
      border-top: 4px solid #e4e4e4 !important;">
              <thead>
                <tr>
                  
                  <th>Member_ID</th>
                  <th>LNO</th>
                  <th>Name</th>
                  <th>Class</th>
                   <th>Email</th>
                   <%--  <th>Deactivate</th>--%>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <%
                  while(rs.next())
     				{
                	  
                       %>
                  
                  <td><%out.print(rs.getString(1)); %></td>
                  <td><% out.print(rs.getString(2)); %></td>
                  <td><% out.print(rs.getString(3)); %></td>
                   <td><%out.print(rs.getString(4)); %></td>
                  <td><% out.print(rs.getString(5)); %></td>
                  <%-- <td>no</td>--%>
                 
                </tr>
                <%
                } 
                  %>
              </tbody>
            </table>
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
