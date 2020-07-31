<%@page import="java.sql.*"%>
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>bookList</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'><style type="text/css">

</style>
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
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a> <a href="#" class="current">Book List</a> </div>
  </div>

  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> 
                     <h5>Book List</h5>
          </div>
<div class="widget-content nopadding">
<form class="form-horizontal"  method="post" action="BookList" name="basic_validate" id="basic_validate"  novalidate="novalidate">
<input type="text" name="required"  onkeyup="selectsession()" id="selectsessionmyInput"     placeholder="Select Session" style="width:100px;">
<input type="text" name="required"  onkeyup="category()" id="categorymyInput"     placeholder="Category" style="width:120px;">
<input type="text" name="required"  onkeyup="publisher()" id="publishermyInput"     placeholder="Publisher" style="width:100px;">
<input type="text" name="required"  onkeyup="author()" id="authormyInput"     placeholder="Author" style="width:100px;">
<%--input type="text" class="form-control"  onkeyup="noofbooks()" id="noofbooksmyInput"  style="width:100px;"   placeholder="No. Of Books">
<input type="text" class="form-control" onkeyup="priceperunit()" id="priceperunitmyInput"  style="width:100px;"  placeholder="Price Per Unit">
<input type="text" class="form-control"  onkeyup="purchasedate()" id="purchasedatemyInput"  style="width:100px;"   placeholder="Purchase Date"> --%>
<input type="text" class="form-control"  onkeyup="keywordse()" id="keywordsemyInput"   style="width:100px;"   placeholder="Keywords">
<input type="text" class="form-control"  onkeyup="title()" id="titlemyInput"  style="width:100px;"   placeholder="Title">
<%-- 
<input type="text" class="form-control"  onkeyup="description()" id="descriptionmyInput"   style="width:100px;"   placeholder="description">
--%>
</div>
                 </form>
                 <script>
                 function myfunction(){
                	  var input=document.getElementbyID("bookid");
                	 var filter=input.value.toUpperCase();
                	 table=document.getElementByID("mytable");
                	 tr=table.getElementByTagName("tr");
                	 for(i=0;i<tr.length;i++){
                		 td=tr[i].getElementByTagName("td")[1];
                		 if(td){
                			 if(td.innerHTML.toupperCase().indexOf(filter)>-1){
                				 tr[i].style.display="";
                			 }else{
                				 tr[i].style.display="none";
                			 }
                			 }
                		 }
                	 }
                 
                 </script>
                 
                  <% 
              Class.forName("oracle.jdbc.driver.OracleDriver");
			  Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
			  String sql="select * from addbook";
			  PreparedStatement ps=c.prepareStatement(sql);
			  ResultSet rs=ps.executeQuery();
			  %>
                  <table class="table table-bordered table-striped with-check" id ="mytable" style="width: 100%;border-spacing: 2px;
     border-bottom: 4px solid #e4e4e4 !important;
      border-top: 4px solid #e4e4e4 !important;">
              <thead>
                <tr>
                  		<th>BOOKID</th>
                        <th>SELECT_SESSION</th>
                        <th>CATEGORY</th>
                        <th>PUBLISHER</th>
                        <th>AUTHOR</th>
                        <th>NO_OF_BOOKS</th>
                        <th>PRICE_PER_UNIT</th>
                        <th>PURCHASE_DATE</th>
                        <th>KEYWORDSE</th>
                        <th>TITLE</th>
                        <th>DESCRIPTION</th>
                    
                </tr>
              </thead>
             
              <tbody>
                <tr>
                <%
                while(rs.next())
                {
                	%>
                
              	 
                  <td><% out.print(rs.getString(1));%></td>
                  <td><% out.print(rs.getString(2));%></td>
                  <td><% out.print(rs.getString(3));%></td>
                  <td><% out.print(rs.getString(4));%></td>
                  <td><% out.print(rs.getString(5));%></td>
                  <td><% out.print(rs.getString(6));%></td>
                  <td><% out.print(rs.getString(7));%></td>
                  <td><% out.print(rs.getString(8));%></td>
                  <td><% out.print(rs.getString(10));%></td>
                   <td><% out.print(rs.getString(11));%></td>
                    <td><% out.print(rs.getString(12));%></td>
                 
                
                </tr>
                <%} %>
                
              </tbody>
            </table>
          
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


<!-- script for searching -->


<script type="text/javascript">
  

  function selectsession() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("selectsessionmyInput");
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



// 


function category() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("categorymyInput");
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


// 

function publisher() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("publishermyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[3];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}


// 


function author() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("authormyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[4];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}


// 

/*
function noofbooks() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("noofbooksmyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[4];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
*/
// 

/*
function priceperunit() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("priceperunitmyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[5];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
*/
// 

/*
function purchasedate() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("purchasedatemyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[6];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

*/
// 


function keywordse() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("keywordsemyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[8];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

// 

function title() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("titlemyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[9];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}

// 
/*
function description() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("descriptionmyInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[9];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
*/

</script>


</body>
</html>
