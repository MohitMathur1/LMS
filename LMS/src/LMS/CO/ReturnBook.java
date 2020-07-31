package LMS.CO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReturnBook
 */
@WebServlet("/ReturnBook")
public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String LNO = null;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		try
		{
			
		String Lno=request.getParameter("item");
		System.out.println(Lno);
		int noofbooks=0;
		String class1=null,name=null;
		int memberid=0;
		int bookid=Integer.parseInt(request.getParameter("item2"));
		System.out.println(bookid);
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
		System.out.println("Connected");
		String sql1="select noofbooks from addbook where bookid="+bookid+"";
		PreparedStatement psmt2=con.prepareStatement(sql1);
		ResultSet rs=psmt2.executeQuery();
		while(rs.next())
		{
			//title=rs.getString(1);
			noofbooks=rs.getInt(1);
		}
		System.out.println("memberdetails");
		String sql3="SELECT MEMBER_ID,NAME,CLASS FROM MEMBERDETAILS WHERE LNO="+LNO+"";
		PreparedStatement psmt3=con.prepareStatement(sql3);
		ResultSet rs1=psmt3.executeQuery();
		while(rs1.next())
		{
			memberid=rs1.getInt(2);
			System.out.println(memberid);
			name=rs1.getString(3);
			class1=rs1.getString(4);
		}
		System.out.println("Done");
		String sql="delete from issuebook where Lno=? and bookid=?";
  	    PreparedStatement psmt=con.prepareStatement(sql);
     	//out.print("Hello");
		psmt.setString(1, Lno);
		System.out.println(Lno);
		psmt.setInt(2, bookid);
		
		System.out.println(bookid);
	//	psmt.executeUpdate();
		int i = psmt.executeUpdate();
		if(i!=0)
		{
			int newtotalbooks=noofbooks+1;
			String sql5="update addbook set noofbooks=? where bookid='"+bookid+"'";
			PreparedStatement psmt5=con.prepareStatement(sql5);
			psmt5.setInt(1, newtotalbooks);
			psmt5.executeUpdate();
			
			int fine=Integer.parseInt(request.getParameter("item4"));
			if(fine>0)
			{
			String sql4="insert into finedetails values(?,?,?,?,?)";
			PreparedStatement psmt4=con.prepareStatement(sql4);
			//psmt4.setString(1, session);
			psmt4.setInt(1, memberid);
			psmt4.setString(2, Lno);
			psmt4.setString(3, name);
			psmt4.setString(4, class1);
			psmt4.setInt(5, fine);
			psmt4.executeUpdate();	
			String message = "Book Returned <br> Fine To be Paid : "+fine+" ";
			request.getSession().setAttribute("message", message);
			response.sendRedirect("return book.jsp");
			}
			else
			{
			String message = "Book Returned <br> No Fine applied";
			request.getSession().setAttribute("message", message);
			response.sendRedirect("return book.jsp");
			}
		}
		else
		{
		out.println("<br>Row has been deleted successfully.");
		}
     	//out.println("Record Deleted");
		}
		catch(Exception e)
		{
			out.print(e.getMessage());
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
