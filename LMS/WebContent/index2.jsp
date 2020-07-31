<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<style type="text/css">
  .aq{
    margin-top:20px;
    margin-left:80px;
    border:1px solid #3c3b5f;
    padding-top:40px;
    padding-bottom:40px;
  }
  #footer{
    margin-top:30px;
    background-color:#3c3b5f;
  }
  h4{
    text-align:center;
    color:#3c3b5f
  }
  .aq i{
    padding-left:50px;
  }
</style>
</head>
<body>


<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
</div>
<%
		if (session != null) {
			if (session.getAttribute("user") != null) {
				String name = (String) session.getAttribute("user");
				out.print("Hello, " + name + " Welcome to ur Profile");
			} else {
				response.sendRedirect("index.jsp");
			}
		}
%>
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
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<div id="sidebar">
  <ul>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>Library Management</span></a>
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
<!--breadcrumbs-->
  <div id="content-header">
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a>
     </div>
      </div>
     
     <div class="row-fluid">
       <div class="container">
         <img src="img/libra.jpg" style= "width:100%;height:300px;">
    </div>
     </div>
     <div class="container">
   <div class="row">
     <div class="col-md-2 aq" style="background-color:lightblue;">
      <i class="fa fa-cog" style="font-size:48px;"aria-hidden="true"></i>
      <br>
      
     <h4> Library Setting</h4>
     </div>
       <div class="col-md-2 aq" style="background-color:lightblue;">
        <i class="fa fa-book"style="font-size:48px;padding-left:30px;"aria-hidden="true"></i><i class="fa fa-plus-circle" style="font-size:30px;padding-left:8px;" aria-hidden="true"></i>
            <br>
          <h4>Add Book</h4>
     </div>
     <div class="col-md-2 aq" style="background-color:lightblue;">
       <i class="fa fa-book"style="font-size:48px;"aria-hidden="true"></i>
       <br>
        <h4>Book List</h4>
     </div>
     <div class="col-md-2 aq"style="background-color:lightblue;">
      <i class="fa fa-user" style="font-size:48px;" aria-hidden="true"></i>
      <br>
        <h4>Member List</h4>
      </div>
   </div>
 </div>
 <div class="container">
   <div class="row">
     <div class="col-md-2 aq"style="background-color:lightblue;">
      <img src="img/issuebook.png" style="width:48px;margin-left: 55px;
">
      <br>
      
        <h4>Issue Book</h4>
     </div>
       <div class="col-md-2 aq" style="background-color:lightblue;">
           <i class="fa fa-id-card" style="font-size:48px;" aria-hidden="true"></i>
            <br>
            
          <h4>Member Id card</h4>
     </div>
     <div class="col-md-2 aq"style="background-color:lightblue;">
        <img src="img/returnbook.png" style="width:48px;margin-left: 55px;
">
        <br>
        
        <h4>Return Book</h4>
     </div>
     <div class="col-md-2 aq"style="background-color:lightblue;">
         <img src="img/bookicon.png" style="width:48px;margin-left: 55px;
">
     <br>
     
        <h4>Library Fine detail</h4>
     </div>
   </div>
 </div>
<div class="row-fluid">
  <div id="footer" class="span12"> 2018 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in">Themedesigner.in</a> </div>
</div>

<script src="js/excanvas.min.js"></script> 
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.flot.min.js"></script> 
<script src="js/jquery.flot.resize.min.js"></script> 
<script src="js/jquery.peity.min.js"></script> 
<script src="js/fullcalendar.min.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.dashboard.js"></script> 
<script src="js/jquery.gritter.min.js"></script> 
<script src="js/matrix.interface.js"></script> 
<script src="js/matrix.chat.js"></script> 
<script src="js/jquery.validate.js"></script> 
<script src="js/matrix.form_validation.js"></script> 
<script src="js/jquery.wizard.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/matrix.popover.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/matrix.tables.js"></script> 

<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>
