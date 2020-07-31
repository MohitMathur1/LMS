package LMS.CO;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LibrarySettings
 */
@WebServlet("/LibrarySettings")
public class LibrarySettings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			SimpleDateFormat dtformat=new SimpleDateFormat("dd-MM-yyyy"); 
			
			PrintWriter out = response.getWriter();
			String sess=request.getParameter("selectsession");
			String from=request.getParameter("fromdate");
			String to=request.getParameter("todate");
			String check=request.getParameter("radios");
			int nobookpercard=Integer.parseInt(request.getParameter("bookspercard"));
			int fineperday=0;
			int nodaystoreturn;
			if(request.getParameter("daystoreturn").equals(""))
			{
				nodaystoreturn=0;
			}
			else
			nodaystoreturn=Integer.parseInt(request.getParameter("daystoreturn"));
			//Boolean act=Boolean.parseBoolean(request.getParameter("act"));
			java.util.Date dt=dtformat.parse(from); 
			java.util.Date dt1=dtformat.parse(to); 
			java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
			java.sql.Date sqlDate1 = new java.sql.Date(dt1.getTime());
			if(check.equals("1"))
			{
				fineperday=Integer.parseInt(request.getParameter("Amt"));;
			}
			String active=request.getParameter("act");
			//response.getWriter().append("Served at: ").append(request.getContextPath());			
			Connection con;
			System.out.println("Mohit");
			PreparedStatement psmt,psmt2;
		    Class.forName("oracle.jdbc.driver.OracleDriver");
	        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
	        System.out.println("Connected");
	        //String sql2="update LibrarySettings set act=?";
	        //psmt2=con.prepareStatement(sql2);
	        //psmt2.setString(1, "False");
	        //psmt2.executeUpdate();
	        System.out.println("psmt");
			String sql="insert into LibrarySettings values(?,?,?,?,?,?,?)";
			
			psmt=con.prepareStatement(sql);
			
			psmt.setString(1, sess);
			
			psmt.setDate(2, sqlDate);
			psmt.setDate(3, sqlDate1);
			
			psmt.setInt(4, nobookpercard);
			psmt.setString(5, check);
			psmt.setInt(6, fineperday);
			psmt.setInt(7, nodaystoreturn);
			
			
			int x=psmt.executeUpdate();
			System.out.println("Mohit");
			
			 if(x!=0){  
				 String message = "Library Settings Updated";
				 request.getSession().setAttribute("message", message);
				 response.sendRedirect("library setting.jsp");
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
			
		}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
