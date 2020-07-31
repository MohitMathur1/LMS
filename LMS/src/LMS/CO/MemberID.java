package LMS.CO;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/memberid")
public class MemberID extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html");	
      PrintWriter out=response.getWriter();
     // out.println("<html><body>");
      String Lno=request.getParameter("LNo");
      String name=request.getParameter("Name");
       String classs=request.getParameter("Class");
    	 String email=request.getParameter("Email");
    		  try
    		  {
    		  
    			  Class.forName("oracle.jdbc.driver.OracleDriver");
    			  Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
    			  
    			  System.out.println("coneccted");
    			  
    String sql="insert into  memberdetails(Lno,name,class,email) values (?,?,?,?)";
	PreparedStatement ps=c.prepareStatement(sql);
	ps.setString(1,Lno);
	ps.setString(2,name);
	ps.setString(3,classs);
	ps.setString(4,email);
	int x=ps.executeUpdate();
	if(x!=0)
	{
		String message="Data inserted to the database <br> Welcome "+name;
		request.getSession().setAttribute("mes", message);
		response.sendRedirect("member card.jsp");
	}
	else
	{
		String message="Data insertion failed";
		request.getSession().setAttribute("mes", message);
		response.sendRedirect("member card.jsp");
	}
	//System.out.println("Data inserted the database");
	ps.close();
	c.close();
	
	
	out.println("Data saved");
    		  }
    		  
    		  catch(Exception e)
    		  {
    			  
    			  e.printStackTrace();
    		  }
	}
}

	

