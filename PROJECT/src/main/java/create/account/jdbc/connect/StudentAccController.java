package create.account.jdbc.connect;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import test.jdbc.connection.FeedbackDbUtil;

/**
 * Servlet implementation class StudentAccController
 */
@WebServlet("/StudentAccController")
public class StudentAccController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
private StudentAccDB studentAccDB;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			studentAccDB = new StudentAccDB(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
    public StudentAccController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		//read student info
		String UserName = request.getParameter("UserName");
		String Firstname = request.getParameter("Firstname");
		String Lastname = request.getParameter("Lastname");
		String Email = request.getParameter("Email");
		String Date = request.getParameter("Date");
		String Password = request.getParameter("Password");
		String ConfirmPassward = request.getParameter("ConfirmPassward");
		//create new student object
		StudentAcc newStudent = new StudentAcc(UserName,Firstname,Lastname,Email,Date,Password,ConfirmPassward);
		//add student to data base
		studentAccDB.addStudent(newStudent);
		//Re-direct to main page
		response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/");  
		
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
			// Read the parameters
			try {
				addStudent(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// List students in MVC
		
	}
	
	

}
