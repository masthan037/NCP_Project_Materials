package create.account.jdbc.connect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import create.account.jdbc.connect.*;
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
			// Read the parameters
			
				try {
					addStudent(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 
			// List students in MVC
		
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
		String ConfirmPassword = request.getParameter("ConfirmPassword");
		String Gender = request.getParameter("gender");
		
		if(studentAccDB.CheckUsernameExists(UserName)) {
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/signUp.jsp?errors=UserName Already exist!!");
		}
		else if(UserName.length()<5 ) {
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/signUp.jsp?errors=Ensure UserName should be more than 5 characters");
		}
		
		else if(Password.equals(ConfirmPassword) && Password.length()<6) {
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/signUp.jsp?errors=Enter stronger Password(Atleast 6* char) ");
		}
		
		else if(!Password.equals(ConfirmPassword)) {
			
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/signUp.jsp?errors=Ensure Password matches with confirm Password");	
			
		}
		//create new student object
		
//		PrintWriter out = response.getWriter();

		else {
		StudentAcc newStudent = new StudentAcc(UserName,Firstname,Lastname,Email,Date,Password,ConfirmPassword,Gender);
//		out.println(newStudent.toString());
		
		try {
//		out.println(newStudent.toString());
			
				//add student to data base
					studentAccDB.addStudent(newStudent);
				//Re-direct to main page
		//			request.setAttribute("Created", "Account Created");
		//			RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
		//			rd.include(request, response);;
					//SendMailCreate.succesfullCreation(UserName,Email);	
				response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/signUp.jsp?errors=Account Created successful...Please Login");  
			
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	}
}
