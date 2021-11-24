package apptitude.jdbc.connect;

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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import apptitude.jdbc.connect.apptitude;
import apptitude.jdbc.connect.apptitudeDBUtil;

/**
 * Servlet implementation class apptitudeServletController
 */
@WebServlet("/apptitudeServletController")
public class apptitudeServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private apptitudeDBUtil appDbUtil;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			appDbUtil = new apptitudeDBUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
    public apptitudeServletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			listmcqs(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		String userinfo = String.valueOf(session.getAttribute("userinfo"));
		if(userinfo.length()==4) {
			
            response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/apptitudeServletController?error=Please Login to Check Your ANSWERS!!");
		}
		else {
			//response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/DoubtClearance/questions.jsp?error=Posted");
			try {
				checkScore(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	private void listmcqs(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			PrintWriter out = response.getWriter();
			// get students from db util
			List<apptitude> feeds = appDbUtil.getmcqs();
			
			// add students to the request
			request.setAttribute("ANS", feeds);
			
			//System.out.println(feed_count.toString());	
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Resources/apptitude.jsp");
			dispatcher.forward(request, response);
		}
	
	private void checkScore(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			PrintWriter out = response.getWriter();
			// get students from db util
			List<apptitude> feeds = appDbUtil.getmcqs();
			
			int count=0,total=feeds.size();
			
			for(int i=0;i<total;++i) {
				String ans = request.getParameter(String.valueOf(feeds.get(i).getMcqID()));
				
				if(ans.equals(feeds.get(i).getAns())) {
					System.out.println(ans);
					count+=1;
				
				}
			}
			
			 response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/apptitudeServletController?error=You got "+count+" Out of "+total+" Question Correct!!");
		}
}
