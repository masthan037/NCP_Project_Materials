package Question.jdbc.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import test.jdbc.connection.Feedbacks;

public class QuestionDBUtil {
	private DataSource dataSource;
	
	

	public QuestionDBUtil(DataSource theDataSource) {
	dataSource = theDataSource;
	}
	
	public List<Question> getQuestions() throws Exception {
		
		List<Question> qs = new ArrayList<Question>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from question order by date desc";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				int qid = myRs.getInt("QID");
				String username = myRs.getString("username");
				String question = myRs.getString("question");
				String date = myRs.getString("date");
				// create new student object
				Question tempQ = new Question(qid,username,question,date);
				
				// add it to the list of students
				qs.add(tempQ);				
			}
			
			return qs;		
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
	
	public void addFeedbacks(Question theQ) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create sql for insert
			String sql = "insert into question "
					   + "(username,question,date) "
					   + "values (?, ?, ?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values for the student
			myStmt.setString(1, theQ.getUsername());
			myStmt.setString(2, theQ.getQuestion());
			myStmt.setString(3, theQ.getDate());
			// execute sql insert
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
public List<String> getReplyCount() throws Exception {
		
		List<String> rep_count = new ArrayList<String>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select count(*) as reply, username from questionreplies group by username order by reply desc limit 5";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				
				int repcount = myRs.getInt("reply");
				String username = myRs.getString("username");
				
				// add it to the list 
				//Topreplies tempRep = new Topreplies(username,repcount);
				
				// add it to the list of students
				rep_count.add(String.valueOf(repcount));
				rep_count.add(username);
				
			}
			
			return rep_count;		
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}
}
