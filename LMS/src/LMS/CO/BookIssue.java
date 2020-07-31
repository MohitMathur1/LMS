package LMS.CO;



import java.io.IOException;
import java.io.PrintWriter;
import java.time.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookIssue
 */
@WebServlet("/bookissue")
public class BookIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		try
		{
			int bookid=Integer.parseInt(request.getParameter("bookid"));
			HttpSession session = request.getSession(true);
			String Lno=(String)session.getAttribute("librarycard");
			String title=null;
			int x=0,noofbooks=0,daystoreturn=0, noofbookspercard=0, fineperday=0;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ETHOVIA","ETHOVIA");
			PreparedStatement psmt,psmt3,psmt4,psmt5;
			String sql1="select title,noofbooks from addbook where bookid="+bookid+"";
			
			psmt=con.prepareStatement(sql1);
			ResultSet rs=psmt.executeQuery();
			System.out.print("Moht");
			while (rs.next())
			{
				noofbooks=rs.getInt(2);
				title=rs.getString(1);
				
			}
			if(title!=null || noofbooks>0)
			{
			String sql3="select bookspercard,fineamountperday,daystoreturn from LibrarySettings where active='1'";
			psmt3=con.prepareStatement(sql3);
			ResultSet rs3=psmt3.executeQuery();
			System.out.println("Moht");
			while (rs3.next())
			{
				noofbookspercard=rs3.getInt(1);
				fineperday=rs3.getInt(2);
				daystoreturn=rs3.getInt(3);
			}
	
			int count=(int)session.getAttribute("Count");
			int bookspercard=(int)session.getAttribute("bookspercard");
			if(count>=bookspercard)
			{
				 String message = "No More Books can be issued ";
				 request.getSession().setAttribute("message1", message);
				 response.sendRedirect("issuebook2.jsp");
				 
			}
			else
			{
			//LocalDate issuedate=(LocalDate)session.getAttribute("issuedate");
			String issue=request.getParameter("issuedate");
			LocalDate issuedate=LocalDate.parse(issue);
			LocalDate returndate=issuedate.plusDays(daystoreturn);
			java.sql.Date issuedate1 = java.sql.Date.valueOf( issuedate );
			java.sql.Date returndate1 = java.sql.Date.valueOf( returndate );
			String sql4="insert into issuebook values(?,?,?,?,?,?)";
			psmt4=con.prepareStatement(sql4);
			psmt4.setString(1, Lno);
			psmt4.setInt(2, bookid);
			psmt4.setString(3, title);
			psmt4.setDate(4, issuedate1);
			psmt4.setDate(5, returndate1);
			psmt4.setInt(6, fineperday);
			
			x=psmt4.executeUpdate();
			}
			}
			else
			{
				String message = "No Such Book Available ";
				request.getSession().setAttribute("message1", message);
				response.sendRedirect("issuebook2.jsp");
			}
			if(x!=0)
			{	
				int leftbooks=noofbooks-1;
				String sql5="update addbook set noofbooks=? where bookid='"+bookid+"'";
				psmt5=con.prepareStatement(sql5);
				psmt5.setInt(1, leftbooks);
				psmt5.executeUpdate();
				String message = "Book issued 1";
				request.getSession().setAttribute("message", message);
				response.sendRedirect("issuebook2.jsp?Librarycardno="+Lno+"");
				
			}
			
		}
		catch(Exception ex)
		{
			out.print(ex.getMessage());
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
