package LMS.CO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Reissue
 */
@WebServlet("/Reissue")
public class Reissue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
			PreparedStatement psmt,psmt1;
			String Lno=request.getParameter("item");
			int bookid=Integer.parseInt(request.getParameter("item2"));
			
			LocalDate idate=LocalDate.parse(request.getParameter("item3"));
			Date issuedate=Date.valueOf(idate);
						
			int daystoreturn=0,memberid=0;
			String name=null,class1=null;
			String sql3="select noofbookspercard,fineperday,daystoreturn from LibrarySettings where check='1'";
			psmt1=con.prepareStatement(sql3);
			ResultSet rs3=psmt1.executeQuery();
			while (rs3.next())
			{
			
				daystoreturn=rs3.getInt(3);
			}
			LocalDate returndate=idate.plusDays(daystoreturn);
			Date rdate = Date.valueOf(returndate);
			String sql4="select memberid,membername,class from memberdetails where Lno="+Lno+"";
			PreparedStatement psmt3=con.prepareStatement(sql4);
			ResultSet rs1=psmt3.executeQuery();
			while(rs1.next())
			{
				memberid=rs1.getInt(1);
				name=rs1.getString(2);
				class1=rs1.getString(3);
			}
			
			String sql="update issuebook set issuedate=?, returndate=? where Lno='"+Lno+"' and bookid="+bookid+"";
			psmt=con.prepareStatement(sql);
			psmt.setDate(1, issuedate );
			psmt.setDate(2, rdate);
			psmt.executeUpdate();
			String message="Book Reissued";
			request.getSession().setAttribute("message", message);
			response.sendRedirect("return book.jsp");
			
			int fine=Integer.parseInt(request.getParameter("item4"));
			if(fine>0)
			{
			String sql6="insert into finedetails values(?,?,?,?,?)";
			PreparedStatement psmt4=con.prepareStatement(sql6);
			//psmt4.setString(1, session);
			psmt4.setInt(1, memberid);
			psmt4.setString(2, Lno);
			psmt4.setString(3, name);
			psmt4.setString(4, class1);
			psmt4.setInt(5, fine);
			int x=psmt4.executeUpdate();		
			}
			else
			{
			String message1 = "Book Reissued ";
			request.getSession().setAttribute("message", message1);
			response.sendRedirect("return book.jsp");
			}
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
