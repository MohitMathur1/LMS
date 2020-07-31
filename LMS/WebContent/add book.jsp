<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>LibraryManagement System</title>
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


	
<!-- category -->

<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ETHOVIA", "ETHOVIA");
Statement state =conn.createStatement();
String sql ="select * from category";
ResultSet data = state.executeQuery(sql);	

//conn.close();

%>

<!-- publisher -->

<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connp= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ETHOVIA", "ETHOVIA");
Statement statep =connp.createStatement();
String sqlp ="select * from publisherdata";
ResultSet datapublisher = statep.executeQuery(sqlp);	 

//conn.close();

%>


<!-- author -->


<%

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connnn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "ETHOVIA", "ETHOVIA");
Statement stateee =connnn.createStatement();
String sqlll ="select * from author";
ResultSet dataauthor = stateee.executeQuery(sqlll); 

//conn.close();

%>

<style>
button.btn.btn-success {
    float: right;
    margin-right: -18px;
        padding-left: 6px;
    
}
</style>
<script>
function checkforblank(){
  var s1 = document.getElementById('Selection').value;
    if(s1=="Select Session"){
    
   alert('please enter your session');
		return false;
	}
    else
    return true
}



</script>

	


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
     <div id="breadcrumb"> <a href="index2.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="tip-bottom">Library Management</a> <a href="#" class="current">Add Book</a> </div>
  </div>

  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span3"></div>
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> 
                     <h5>Add Book</h5>
          </div>
          <p style="color:red">${message} </p>
          <c:remove var="msg" scope="session" />
           
           <div class="widget-content nopadding">
          
         
          
          <form action="Books" method="post" onsubmit="return checkforblank()" class="form-horizontal" >
           
               <div class="control-group">
           <label class="control-label">Select Session</label>
              <div class="controls">
            <select class="form-control" name="selectsession" id="Selection">
      <option>Select Session</option>
      <option>2017-2018</option>
      <option>2018-2019</option>
      <option>2019-2020</option>
     </select>
</div>
             </div>
            <div class="control-group">
           <label class="control-label">Category*</label>
              <div class="controls">
            <select class="form-control ajay1" name="category" id="exampleFormControlSelect1" required="required">
      <option>Select Category</option> 
      
      </select>

       
       <span><button  class="btn btn-success" data-toggle="modal" data-target="#myModal1">Add</button></span>
</div>
             </div>
            <div class="control-group">
           <label class="control-label">Publisher*</label>
              <div class="controls">
            <select class="form-control ajay" name="publisher" id="exampleFormControlSelect1" required="required">
      <option>--Select Publisher--</option>
      <% 
     while(datapublisher.next()){
       
       %>
       
       <option value='<%= datapublisher.getString("name") %>'> <%= datapublisher.getString("name") %> </option>
       
       <%
       }
     %>
     </select>
<span><button  class="btn btn-success" data-toggle="modal" data-target="#myModal">Add</button>
     </span>
</div>
             </div>
            <div class="control-group">
           <label class="control-label">Author*</label>
              <div class="controls">
            <select class="form-control ajay2" name="author" id="exampleFormControlSelect1" required="required">
       <option>--Select Author--</option>
       <% 
     while(dataauthor.next()){
       
       %>
       
       <option value='<%= dataauthor.getString("name") %>'> <%= dataauthor.getString("name") %> </option>
       
       <%
       }
     %>
      

</select>


<span><button  class="btn btn-success" data-toggle="modal" data-target="#myModal2">Add</button>
     </span>
</div>
             </div>
           
              <div class="control-group">
                <label class="control-label">No Of Books*</label>
                <div class="controls">
                  <input type="text" name="noofbooks" id="required" placeholder="Enter The No Of Books" required="required">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Price Per Unit</label>
                <div class="controls">
                  <input type="text" name="priceperunit" id="required" placeholder="Enter The Price Per Unit" required="required">
                </div>
              </div>
                    <div class="control-group">
              <label class="control-label">Purchase Date* </label>
              <div class="controls">
                <input type="date" id="required" name="purchasedate" placeholder="yyyy-mm-dd" required="required"
               min="2018-01-01" max="2070-12-31"/>
                  </div>
            </div>
            
      
              <div class="control-group">
                <label class="control-label">Keywords</label>
                <div class="controls">
               <textarea class="form-control" name="keywords" id="exampleFormControlTextarea1" rows="3" placeholder="You Can Enter Multiple Keywords About Book"></textarea>
                 </div>
              </div>
              <div class="control-group">
                <label class="control-label">Title*</label>
                <div class="controls">
                  <input type="text" name="title" id="required" placeholder="Enter The Title Of Hook" required="required">
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Description</label>
                <div class="controls">
                      <textarea class="form-control" name="description" id="exampleFormControlTextarea1" rows="3"  placeholder="Enter The Description"></textarea>

                  </div>
              </div>
              <%--
            <div class="control-group">
                <label class="control-label">Book Photograph:</label><br>
                <div class="controls">
             <input type="file" name="BookPhotograph" class="form-control-file" id="exampleFormControlFile1">
  </div>

                </div>  --%>
               <div class="control-group">
              <label class="control-label">Not for Issue</label>
              <div class="controls">
                  <input class="form-check-input position-static" name="notforissue" type="checkbox" id="blankCheckbox" value="True" aria-label="...">

              </div>
            </div>
         <div class="form-actions">
              <button type="submit" class="btn btn-success">Save</button><span>
                           <%-- <asp:Button id="btnSave" Text="Save" runat="server" OnClick="Save data" />--%>  
                           <%--  <button type="submit" class="btn btn-danger">Back</button>  --%>
                            
          </div></span>
         
            </form>
            </div>
            
        </div>
          
      </div>
    </div>
    </div>
<!--end-Footer-part-->
<script type="Text/javascript">
function Add()
{
var dd=document.getElementById("Add");
var option=document.creatElement("option");
option.innerHtml = document.getElementById("txtText").value;
option.value=document.getElementById("txtValue").value;
dd.option.add(option);
}
</script>


<!-- modal -->


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add New Value</h4>
      </div>
      <div class="modal-body">
        <input type="text" placeholder="Add New Value" class="form-control" id="newvalue">
        <a href="javascript:void(0)" class="btn btn-success" id="btnadd">Add Value</a> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>



<!-- model 1 -->


<!-- Modal -->
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add New Value</h4>
      </div>
      <div class="modal-body">
        <input type="text" placeholder="Add New Value" class="form-control" id="newvalue1">
        <a href="javascript:void(0)" class="btn btn-success" id="btnadd1">Add Value</a> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- model 1 -->


<!-- model 1 -->


<!-- Modal -->
<div id="myModal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add New Value</h4>
      </div>
      <div class="modal-body">
        <input type="text" placeholder="Add New Value" class="form-control" id="newvalue2">
        <a href="javascript:void(0)" class="btn btn-success" id="btnadd2">Add Value</a> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<!-- model 1 -->

<script src="js/jquery.min.js"></script> 


<script>


	

	$(document).ready(function(){



			$("#btnadd").click(function(){

			var newvalue =	 $('#newvalue').val();

			//alert(newvalue);

        // $.ajax({
        //   url:"insertcategory.jsp",
        //   method:"POST",
        //   dataType: "json",
        //   data:{data:newvalue},
        //   success:function(result) {
        //     alert(result);
        //     console.log(result);
        //   }
        // })

        $.ajax({
			url: "insertpublisher.jsp",
			type: "post",
			data: {
					fname: $('#newvalue').val()
				},
			success : function(data){
				//alert(data);
			}
		});

				
			

				$("#showvalue").html("<option>" + newvalue + "</option>");

				$(".ajay").append('<option value="'+newvalue+'" class="co">'+newvalue+'</option>');
				
				//alert("hello");
				
				$('#myModal').modal('toggle');

				// alert(newvalue + " value added Successful!!");

			});


      // second modal jquery

      $("#btnadd1").click(function(){

        var newvalue1 =   $('#newvalue1').val();

        $.ajax({
			url: "insertcategory.jsp",
			type: "get",
			data: {
					fname: $('#newvalue1').val()
				},
			success : function(data){
				//alert(data);
			}
		});
        
        //alert(newvalue);

        $("#showvalue1").html("<option>" + newvalue1 + "</option>");

        $(".ajay1").append('<option value="'+newvalue1+'" class="co">'+newvalue1+'</option>');
        
        //alert("hello");
        
        $('#myModal1').modal('toggle');

        // alert(newvalue + " value added Successful!!");

      });



      // third model jquery


      $("#btnadd2").click(function(){

        var newvalue2 =   $('#newvalue2').val();

        
        //alert(newvalue2);

          $.ajax({
      url: "insertauthor.jsp",
      type: "get",
      data: {
          fname: $('#newvalue2').val()
        },
      success : function(data){
        //alert(data);
      }
    });

        $("#showvalue2").html("<option>" + newvalue2 + "</option>");

        $(".ajay2").append('<option value="'+newvalue2+'" class="co">'+newvalue2+'</option>');
        
        //alert("hello");
        
        $('#myModal2').modal('toggle');

        // alert(newvalue + " value added Successful!!");

      });
			
			




	});


</script>

<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/jquery.validate.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.form_validation.js"></script>

<style>

.co{display:none;}

</style>
</body>
</html>
