package forgotpass.jdbc.connect;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
  
public class SendMail extends HttpServlet {  
public static void sendpass(String eid,String pass)  
    throws ServletException, IOException {  
  
      
      
    String to= eid;  
    String subject="Password Retrieved";  
    String msg="Dear User your PASSWORD is "+pass;  
          
    Mailer.send(to, subject, msg);  
      
    }  
  
}  
