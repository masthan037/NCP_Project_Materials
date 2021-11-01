package Question.jdbc.connect;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import test.jdbc.connection.FeedbackDbUtil;
import test.jdbc.connection.Feedbacks;

/**
 * Servlet implementation class QuestionController
 */
@WebServlet("/QuestionController")
public class QuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
private QuestionDBUtil questionDbUtil;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			questionDbUtil = new QuestionDBUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
    public QuestionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			listQuestions(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String userinfo = String.valueOf(session.getAttribute("userinfo"));
		if(userinfo.length()==4) {
			
            response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal//QuestionController?error=Please Login to post a Question");
		}
		else {
			//response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/DoubtClearance/questions.jsp?error=Posted");
			addFeedback(request, response);
		}
	}
	
	private void addFeedback(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String userinfo = String.valueOf(session.getAttribute("userinfo"));
		String[] temp = userinfo.split("\\+");
		String username = temp[1];
		String question = request.getParameter("qbox");
		
		// create a new student object
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		LocalDateTime now = LocalDateTime.now();  
		String date = dtf.format(now);  
		Question thefeedback = new Question(username, question, date);
		
		// add the student to the database
		try {
			
				questionDbUtil.addFeedbacks(thefeedback);
				response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/QuestionController");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		// send back to main page (the student list)
		
	}
	
	private void listQuestions(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			PrintWriter out = response.getWriter();
			// get students from db util
			List<Question> feeds = questionDbUtil.getQuestions();
			List<String> feed_count = questionDbUtil.getReplyCount();
			
			out.println(feeds);
			// add students to the request
			request.setAttribute("Q_LIST", feeds);
			request.setAttribute("Rep_COUNT", feed_count);
			//System.out.println(feed_count.toString());	
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/DoubtClearance/questions.jsp");
			dispatcher.forward(request, response);
		}
}
