package forgotpass.jdbc.connect;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import test.jdbc.connection.FeedbackDbUtil;
import test.jdbc.connection.Feedbacks;

/**
 * Servlet implementation class forgotpasswordController
 */
@WebServlet("/forgotpasswordController")
public class forgotpasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private forgotpassDButil forgotpassDButil;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			forgotpassDButil = new forgotpassDButil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotpasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		try {
			listfeeds(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void listfeeds(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			PrintWriter out = response.getWriter();
			// get students from db util
			String email = request.getParameter("email");
			String feeds = forgotpassDButil.getemail(email);
			
			//out.println(feeds);
			// add students to the request
			//request.setAttribute("FEEDS_LIST", feeds);
					
			// send to JSP page (view)
			if(feeds.length()!=0) {
				System.out.println(feeds);
				//SendMail.sendpass(email, feeds);
				response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/forgotpassword.jsp?error=Please check your mail!!");
			}
			else {
				response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/forgotpassword.jsp?error=EmailID not valid!!");
			}
		}

}
