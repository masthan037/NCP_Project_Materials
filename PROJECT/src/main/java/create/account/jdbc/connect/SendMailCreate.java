package create.account.jdbc.connect;



import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import create.account.jdbc.connect.*;
import forgotpass.jdbc.connect.Mailer;  
  
public class SendMailCreate extends HttpServlet {  
public static void succesfullCreation(String user,String eid)  
    throws ServletException, IOException {  
  
      
      
    String to= eid;  
    String subject="Account Creation--Successfull";  
    String msg="Hello "+ user+"\nYour account was successfully created!!!"+"\nFun Learning\nPlacement Guiders";  
          
    Mailer.send(to, subject, msg);  
      
    }  
  
}  

