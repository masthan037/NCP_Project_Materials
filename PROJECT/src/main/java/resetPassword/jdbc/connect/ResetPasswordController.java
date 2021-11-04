package resetPassword.jdbc.connect;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import create.account.jdbc.connect.StudentAccDB;

/**
 * Servlet implementation class ResetPasswordController
 */
@WebServlet("/ResetPasswordController")
public class ResetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

private ResetPasswordDB resetPassworddb;
	
	@Resource(name="jdbc/placement_prep_db")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		// create our student db util ... and pass in the conn pool / datasource
		try {
			resetPassworddb = new ResetPasswordDB(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {

		try {
			updatePassword(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void updatePassword(HttpServletRequest request, HttpServletResponse response) 
	throws IOException {
		// TODO Auto-generated method stub
		
		String NewPassword = request.getParameter("NewPassword");
		String ConfirmNewPassword = request.getParameter("ConfirmNewPassword");
//		System.out.println(NewPassword);
//		System.out.println(ConfirmNewPassword);
		
		
		
		if(NewPassword.equals(ConfirmNewPassword) && NewPassword.length()<6) {
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/resetpassword.jsp?errors=Enter stronger Password(Atleast 6* char) ");	
		}
		else if(!NewPassword.equals(ConfirmNewPassword)) {
			
			
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/resetpassword.jsp?errors=Ensure Password matches with confirm Password");	
			
		}
		else {
			
			HttpSession session = request.getSession(false);
			String userinfo = String.valueOf(session.getAttribute("userinfo"));
			String[] temp = userinfo.split("\\+");
			
			ResetPassword resetPassword = new ResetPassword(NewPassword,ConfirmNewPassword);
			
			try {
				resetPassworddb.ResetPassword(resetPassword, NewPassword, temp[1]);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Done DB update");
			response.sendRedirect("http://localhost:8080/Placement_Preparation_Portal/HomePage/Profile.jsp?errors=PASSWORD RESET DONE!!");	
			
		}
		
	}

}
