package test.jdbc.connection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
/**
 * Servlet implementation class testservlet
 */
@WebServlet("/testservlet")
public class testservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Step 1:  Set up the printwriter
				PrintWriter out = response.getWriter();
				response.setContentType("text/plain");
				
				// Step 2:  Get a connection to the database
				Connection myConn = null;
				Statement myStmt = null;
				ResultSet myRs = null;
				
				try {
					myConn = dataSource.getConnection();
					
					// Step 3:  Create a SQL statements
					String sql = "select * from feedbacks";
					myStmt = myConn.createStatement();
					
					// Step 4:  Execute SQL query
					myRs = myStmt.executeQuery(sql);
					
					// Step 5:  Process the result set
					while (myRs.next()) {
						String name = myRs.getString("Username");
						out.println(name);
						String content = myRs.getString("comment");
						out.println(content);
					}
				}
				catch (Exception exc) {
					exc.printStackTrace();
				}

	}

}
