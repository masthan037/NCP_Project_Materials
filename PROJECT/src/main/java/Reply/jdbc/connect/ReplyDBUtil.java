package Reply.jdbc.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Question.jdbc.connect.Question;
import test.jdbc.connection.Feedbacks;

	public class ReplyDBUtil {
	
	private DataSource dataSource;
	
	 public ReplyDBUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	 
		public List<Reply> listreply(String qid) throws Exception {
			
			List<Reply> feeds = new ArrayList<Reply>();
			
			Connection myConn = null;
			Statement myStmt = null;
			ResultSet myRs = null;
			
			try {
				// get a connection
				myConn = dataSource.getConnection();
				
				// create sql statement
				String sql = "select * from questionreplies where QID="+qid;
				myStmt = myConn.prepareStatement(sql);
				
				// set the param values for the student
				
				
				// execute query
				myRs = myStmt.executeQuery(sql);
				
				
				
				
				// process result set
				while (myRs.next()) {
					
					// retrieve data from result set row
					
					String Reply = myRs.getString("Reply");
					String username = myRs.getString("username");
					String date = myRs.getString("date");
					// create new student object
					int q = Integer.parseInt(qid);
					Reply temprep = new Reply(q,Reply,username,date);
					
					// add it to the list of students
					feeds.add(temprep);				
				}
				
				return feeds;		
			}
			
					
			
			finally {
				// close JDBC objects
				close(myConn, myStmt, myRs);
			}		
		}

		private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

			try {
				if (myRs != null) {
					myRs.close();
				}
				
				if (myStmt != null) {
					myStmt.close();
				}
				
				if (myConn != null) {
					myConn.close();   // doesn't really close it ... just puts back in connection pool
				}
			}
			catch (Exception exc) {
				exc.printStackTrace();
			}
		}
		
		public void addreply(Reply theQ) throws Exception {

			Connection myConn = null;
			PreparedStatement myStmt = null;
			
			try {
				// get db connection
				myConn = dataSource.getConnection();
				
				// create sql for insert
				String sql = "insert into questionreplies "
						   + "(qid,username,reply,date) "
						   + "values (?, ?, ?, ?)";
				
				myStmt = myConn.prepareStatement(sql);
				
				// set the param values for the student
				myStmt.setInt(1, theQ.getQid());
				myStmt.setString(2, theQ.getUsername());
				myStmt.setString(3, theQ.getReply());
				myStmt.setString(4, theQ.getDate());
				// execute sql insert
				myStmt.execute();
			}
			finally {
				// clean up JDBC objects
				close(myConn, myStmt, null);
			}
		}
		
		public String getquestion(String qid) throws Exception {

			Connection myConn = null;
			Statement myStmt = null;
			ResultSet myRs = null;
			
			try {
				// get db connection
				myConn = dataSource.getConnection();
				
				// create sql statement
				String sql = "select * from question where QID="+qid;
				myStmt = myConn.prepareStatement(sql);
				
				// set the param values for the student
				
				
				// execute query
				myRs = myStmt.executeQuery(sql);
				String question="";
				while (myRs.next()) {
				 question = myRs.getString("question");
				}
				return question;
			}
			finally {
				// clean up JDBC objects
				close(myConn, myStmt, null);
			}
		}
}
