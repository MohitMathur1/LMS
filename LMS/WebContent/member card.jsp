<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <li class="submenu active"> <a href="#"><i class="icon icon-list"></i> <span>Card Management</span></a>
      <ul>
         <li><a href="Card setting.jsp">Card Settings</a></li>
        <li><a href="add book.jsp">Add Book</a></li>
        <li><a href="book list.jsp">Book List</a></li>
          <li><a href="member list.jsp">Member List</a></li>
        <li><a href="issue book.jsp">Issue Book</a></li>
        <li><a href="member card.jsp">Member ID Card</a></li>
      <li><a href="return book.jsp">Return Book</a></li>
        <li><a href="library fine detail.jsp">Card Fine Detail</a></li>
      
     
      </ul>
    </li>
  
    
  </ul>
</div>
<div id="content">
  <div id="content-header">
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Card Management</a> <a href="#" class="current">Member ID Card</a> </div>
  </div>

  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> 
                     <h5>Member Id card</h5>
          </div>
          <p align="center" style="t">${mes}</p>
          <c:remove var="mes" scope="session" />
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="memberid" name="myform" id="basic_validate" onsubmit="return validateemail()" novalidate="novalidate">
                  <div class="control-group">
                <label class="control-label">LNo* </label>
                <div class="controls">
                  <input type="text" name="LNo" id="LNo" placeholder="enter Card no">
                </div>
              </div>
          
              <div class="control-group">
                <label class="control-label">Name*</label>
                <div class="controls">
                  <input type="text" name="Name" id="Name" placeholder="enter name">
                </div>
              </div>
           <div class="control-group" style="padding-right:82px;">
                <label class="control-label">Class</label>
                     <div class="controls" style="size:40px;">
            <select class="form-control" name="Class">
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
</div>
                 </div>
              
              <div class="control-group">
                <label class="control-label">Email*</label>
                <div class="controls">
                  <input type="text" name="Email" id="Email" placeholder="enter email">
                </div>
              </div>
              <div class="form-actions">
                <input type="submit" value="Validate" class="btn btn-success">
              </div>
              <script>  
              function validateemail()  
              {  
              var x=document.myform.Email.value;
              var Name=document.myform.Name.value; 
              var LNo=document.myform.LNo.value;
             
              var atposition=x.indexOf("@");  
              var dotposition=x.lastIndexOf(".");  
              if(LNo==null || LNo==""){  
            	  alert("Library Card No can't be blank");  
            	  return false; 
                } 
              else if(Name==null || Name==""){  
            	  alert("Name can't be blank");  
            	  return false; 
              }
            	  else if(atposition<1 || dotposition<atposition+2 || (dotposition+2)>=x.length){  
                      alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
                      return false;   
              } 
             
              }
</script>
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
