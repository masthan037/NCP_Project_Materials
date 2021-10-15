package test.jdbc.connection;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.time.*;
import java.time.format.DateTimeFormatter;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class FeedbackControllerServlet
 */
@WebServlet("/FeedbackControllerServlet")
public class FeedbackControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
private FeedbackDbUtil feedbackDbUtil;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			feedbackDbUtil = new FeedbackDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	
    public FeedbackControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// list the students ... in mvc fashion
//		PrintWriter out = response.getWriter();
//		List<Feedbacks> feeds;
//		try {
//			feeds = feedbackDbUtil.getFeedbacks();
//			
//		} catch (Exception e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
					try {
						listfeeds(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		addFeedback(request, response);
	}
	
	private void addFeedback(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String name = request.getParameter("realname");
		String email = request.getParameter("email");
		String thumbs = request.getParameter("LikeorUnlike");
		String heading = request.getParameter("heading");
		String content = request.getParameter("comments");
		
		// create a new student object
		if(name.length()==0) {name="Guest User";};
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		LocalDateTime now = LocalDateTime.now();  
		String date = dtf.format(now);  
		Feedbacks thefeedback = new Feedbacks(name, email, thumbs, heading, content,date);
		
		// add the student to the database
		try {
			feedbackDbUtil.addFeedbacks(thefeedback);
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/");  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		// send back to main page (the student list)
		
	}


	private void listfeeds(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			PrintWriter out = response.getWriter();
			// get students from db util
			List<Feedbacks> feeds = feedbackDbUtil.getFeedbacks();
			out.println(feeds);
			// add students to the request
			request.setAttribute("FEEDS_LIST", feeds);
					
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
	
	



}
