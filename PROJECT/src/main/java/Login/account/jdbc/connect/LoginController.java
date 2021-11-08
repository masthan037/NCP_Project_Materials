package Login.account.jdbc.connect;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import create.account.jdbc.connect.StudentAcc;
import create.account.jdbc.connect.StudentAccDB;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
private LoginDB Logindb;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			Logindb = new LoginDB(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			String usercount = Logindb.CountUser();
			request.setAttribute("USER_COUNTS", usercount);	
			
			
			
			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/HomePage/HomePage.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userName = request.getParameter("UserName");
	        String password = request.getParameter("Password");
	 
	        LoginAcc Loginacc = new LoginAcc(userName, password); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.
	 
	        Loginacc.setUserName(userName); //setting the username and password through the loginBean object then only you can get it in future.
	        Loginacc.setPassward(password);
	 
	        //LoginDB Logindb = new LoginDB(); //creating object for LoginDao. This class contains main logic of the application.
	 
	        String userValidate = Logindb.authenticateUser(Loginacc); //Calling authenticateUser function
	        String[] temp = userValidate.split("\\+");
	        if(temp[0].equals("SUCCESS")) //If function returns success string then user will be rooted to Home page
	         {
	        	String userreplies="";
	        	String userq="";
				try {
					userreplies = Logindb.CountReplies(temp[1]);
					userq = Logindb.CountQ(temp[1]);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				userValidate = userValidate+userreplies+userq;	
	        	
	        	 HttpSession session = request.getSession(true);
	        	 //System.out.println(userValidate);
	        	 session.setAttribute("userinfo", userValidate);//with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
	             
	             response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/Profile.jsp");//RequestDispatcher is used to send the control to the invoked page.
	           //  response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/main/webapp/AfterLogIn/AfterLogin.jsp");
	         }
	         else
	         {
	             request.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
	             response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/HomePage.jsp?error=Invalid Username or Password");//forwarding the request
	         }

	}

}
