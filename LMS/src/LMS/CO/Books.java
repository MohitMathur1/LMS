package LMS.CO;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Books
 */

@WebServlet("/Books")
@MultipartConfig
public class Books extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPose(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		try
		{
		
		String sess=request.getParameter("selectsession");
		String category=request.getParameter("category");
		String publisher=request.getParameter("publisher");
		String author=request.getParameter("author");
		int noofbooks=Integer.parseInt(request.getParameter("noofbooks"));
		int priceperunit=Integer.parseInt(request.getParameter("priceperunit"));
		String keywords=request.getParameter("keywords");
		String title=request.getParameter("title");
		String description=request.getParameter("description");
		String notforissue=request.getParameter("notforissue");
		String purchasedate=request.getParameter("purchasedate");
		
		SimpleDateFormat dtformat=new SimpleDateFormat("yyyy-MM-dd"); 
		//Boolean act=Boolean.parseBoolean(request.getParameter("act"));
		java.util.Date dt=dtformat.parse(purchasedate); 
		//java.util.Date dt1=dtformat.parse(to); 
		java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
		//java.sql.Date sqlDate1 = new java.sql.Date(dt1.getTime());
		int status=0,count=1;
		Connection con;
	    Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
        for(int i=1;i<=noofbooks;i++)
        {
		PreparedStatement ps=con.prepareStatement("insert into addbook(select_session,category,publisher,author,noofbooks,priceperunit,"
				+ "purchasedate,keyword,description,notforissue,title) values(?,?,?,?,?,?,?,?,?,?,?)");
      //  psmt2.setString(7, "False");
       // psmt2.executeUpdate();
		
		ps.setString(1,sess);
		ps.setString(2,category);
		ps.setString(3,publisher);
		ps.setString(4,author);
		ps.setInt(5,count);
		ps.setInt(6,priceperunit);
		ps.setDate(7,sqlDate);
		ps.setString(8,keywords);
		ps.setString(11,title);
		ps.setString(9,description);
		//ps.setBlob(11,inputStream);
		ps.setString(10,notforissue);
		status=ps.executeUpdate();
	
        }
		 if(status!=0){  
			 String message = "Record Inserted";
			 request.getSession().setAttribute("message", message);
			 response.sendRedirect("add book.jsp");
                //response.sendRedirect("library setting.jsp");
              }  
		 else
			 out.println("Error .... ");

		//response.sendRedirect("library setting.jsp");
		con.commit();
		con.close();
		
     
	}
	
catch(Exception e)
	{
		out.print(e.getMessage());
	}
	}
	/**
	 * @param <HttpServletRequest>
	 * @param <HttpServletResponse>
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
