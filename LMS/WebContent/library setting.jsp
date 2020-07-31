<!DOCTYPE html>
<%--  --%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/colorpicker.css" />
<link rel="stylesheet" href="css/datepicker.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/select2.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link rel="stylesheet" href="css/bootstrap-wysihtml5.css" />
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

<!--close-left-menu-stats-sidebar-->

<div id="content">
<div id="content-header">
  <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a> <a href="#" class="current">Library Setting</a> </div>
  </div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
    <div class="span3"></div>
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title">
          <h5>Library Setting</h5>
        </div>
        
        <p align="left" style="color: purple;">${message}</p>
		<c:remove var="message" scope="session" /> 
        
        <div class="widget-content nopadding">
        
          <form action="LibrarySettings" method="Get" class="form-horizontal" onsubmit="return check();">
          
            <div class="control-group">
           <label class="control-label">Select Session*</label>
              <div class="controls">
            <select class="form-control" id="exampleFormControlSelect1" name="selectsession" required="required">
      <option>--Select Session--</option>
      <option>2020-2021</option>
      <option>2021-2022</option>
      <option>2022-2023</option>
     </select>
</div>
             </div>
            <div class="control-group">
              <label class="control-label">From Date* </label>
              <div class="controls">
                <input type="text" data-date-format="dd-mm-yyyy" name="fromdate" class="datepicker span11" placeholder="Enter From Date of Book Setting" required="required">
              </div>
            </div>
            <div class="control-group">
            	  <label class="control-label">To Date*</label>
              <div class="controls">
                <input type="text" data-date-format="dd-mm-yyyy" name="todate" class="datepicker span11" placeholder="Enter To Date of Book Setting" required="required">
               </div>
            
              </div> 
  <%--        <div class="control-group">
              <label class="control-label">Apply to:</label>
              <div class="controls">
                <label>
                  <input type="radio" name="radios" />
                  All Classes</label>
                <label>
                  <input type="radio" name="radios" />
                  Class Wise</label>
               
                </div>
              </div>
--%>            
             
            <div class="control-group">
              <label class="control-label">No of Book Per Card*</label>
              <div class="controls">
                <input type="text" class="span11" name="bookspercard" placeholder="Enter The No Of Book Per Card" required="required" />
              </div>
            </div>
            <div class="control-group">
                            <label class="control-label">Apply fine for Book</label>
                            <div class="controls">
                               <label><input type="radio" name="radios" onclick="EnableSelect()" value="1"/>Yes</label>
                               <label><input type="radio" name="radios" onclick="UpdateSelect()"/>No</label>
                            </div>
                        </div>
      
            <div class="control-group">
              <label class="control-label">Fine Amount per Day</label>
              <div class="controls">
                <input type="text" class="span11" name="Amt" id="amt1" placeholder="Enter The Fine Amount Per Day" />
              </div>
             
            <div class="control-group">
              <label class="control-label">No of Days to Return Book</label>
              <div class="controls">
              	 <input type="text" class="span11" name="daystoreturn" placeholder="Enter The No Of Days To Return Book" />
              
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Active</label>
              <div class="controls">
              	  <input type="checkbox" name="act" id="blankCheckbox" value="True" aria-label="...">

              </div>
            </div>
            
            <div class="form-actions">
            	<div class="controls">
              <input type="submit" class="btn btn-success" name="btn1" value="Submit">
          </div>
            </div>
           
            </form>
         
        </div>
      </div>
    </div>
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/bootstrap-colorpicker.js"></script> 
<script src="js/bootstrap-datepicker.js"></script> 
<script src="js/jquery.toggle.buttons.js"></script> 
<script src="js/masked.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.form_common.js"></script> 
<script src="js/wysihtml5-0.3.0.js"></script> 
<script src="js/jquery.peity.min.js"></script> 
<script src="js/bootstrap-wysihtml5.js"></script> 
<script>
function UpdateSelect() {
			document.getElementById("amt1").disabled = true;
}
function EnableSelect() {
			document.getElementById("amt1").disabled = false;
}
function check()
{
	var s=document.getElementById("exampleFormControlSelect1").value;
	if(s=="--Select Session--")
		{
		alert("Session not selected");
		return false;
		}
	else
		return true;
	
}
	
	$('.textarea_editor').wysihtml5();
</script>
</body>
</html>
