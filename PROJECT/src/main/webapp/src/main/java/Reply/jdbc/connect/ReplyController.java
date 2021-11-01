package Reply.jdbc.connect;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Login.account.jdbc.connect.LoginAcc;
import Login.account.jdbc.connect.LoginDB;
import Question.jdbc.connect.Question;
import test.jdbc.connection.Feedbacks;

/**
 * Servlet implementation class ReplyController
 */
@WebServlet("/ReplyController")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	private ReplyDBUtil replyDBUtil;
	
	private int qids;
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			replyDBUtil = new ReplyDBUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
    
    public ReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String userinfo = String.valueOf(session.getAttribute("userinfo"));
		if(userinfo.length()==4) {
			
            response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/QuestionController?error=please login to post a reply!!");
		}
		else {
			//response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/DoubtClearance/questions.jsp?error=Posted");
			addreply(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		listreply(request,response);
                     
	}
	
	private void listreply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qid = request.getParameter("qid");
		String[] temp = qid.split("\\+");
		qids = Integer.parseInt(temp[0]);
		String q_name = temp[0];
		
        List<Reply> replies = new ArrayList<Reply>();
		try {
			replies = replyDBUtil.listreply(qid);
			q_name = replyDBUtil.getquestion(qid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //Calling authenticateUser function
        
        
			request.setAttribute("REPLY_LIST", replies);
			request.setAttribute("questions", q_name);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/DoubtClearance/discussions.jsp");
			dispatcher.forward(request, response);
	}
	
	private void addreply(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//String qid = request.getParameter("qid");
		String reply = request.getParameter("ans_box");
		
		HttpSession session = request.getSession(false);
		String userinfo = String.valueOf(session.getAttribute("userinfo"));
		String[] temp = userinfo.split("\\+");
		String username = temp[1];
		
		
		// create a new student object
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		LocalDateTime now = LocalDateTime.now();  
		String date = dtf.format(now); 
		
		Reply thefeedback = new Reply(qids, reply,username, date);
		
		// add the student to the database
		try {
			
				replyDBUtil.addreply(thefeedback);
				response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/QuestionController");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		// send back to main page (the student list)
		
	}

}
