package updateProfile.jdbc.connect;

import java.io.IOException;

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



/**
 * Servlet implementation class UpdateProfileContoller
 */
@WebServlet("/UpdateProfileContoller")
public class UpdateProfileContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
private UpdateProfileDB updateProfileDB;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			updateProfileDB = new UpdateProfileDB(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	
    public UpdateProfileContoller() {
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

		try {
			Updateprofile(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	private void Updateprofile(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String Firstname = request.getParameter("Firstname");
		String Lastname = request.getParameter("Lastname");
		String Email = request.getParameter("email");
		String Date = request.getParameter("Date");
		
		HttpSession session = request.getSession(false);
		String userinfo = String.valueOf(session.getAttribute("userinfo"));
		String[] temp = userinfo.split("\\+");
		
		UpdateProfile updateProfile = new UpdateProfile(Firstname,Lastname,Email,Date);

		
		try {

			updateProfileDB.UpdateDetails(updateProfile,temp[1],Firstname,Lastname,Email,Date);
			
			 String error = "Update Success...";
			 
		        request.setAttribute("error", error);
		 
 RequestDispatcher requestDispatcher = request.getRequestDispatcher("/HomePage/Profile.jsp");
		 
		        requestDispatcher.forward(request, response);
					
				//response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/Profile.jsp?errors=Update Success!!...");  
			
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
