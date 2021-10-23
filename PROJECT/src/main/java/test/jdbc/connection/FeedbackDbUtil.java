package test.jdbc.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class FeedbackDbUtil {
	
	private DataSource dataSource;

	public FeedbackDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}
	
	public List<Feedbacks> getFeedbacks() throws Exception {
		
		List<Feedbacks> feeds = new ArrayList<Feedbacks>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select * from feedbacks where thumbs='like' order by date desc limit 6";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				
				String name = myRs.getString("username");
				String email = myRs.getString("emailID");
				String thumbs = myRs.getString("thumbs");
				String heading = myRs.getString("heading");
				String content = myRs.getString("comment");
				String date = myRs.getString("date");
				// create new student object
				Feedbacks tempFeed = new Feedbacks(name,email,thumbs,heading,content,date);
				
				// add it to the list of students
				feeds.add(tempFeed);				
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

	public List<Integer> getFeedbackCount() throws Exception {
		
		List<Integer> feed_count = new ArrayList<Integer>();
		
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;
		
		try {
			// get a connection
			myConn = dataSource.getConnection();
			
			// create sql statement
			String sql = "select count(*) as Total, count(case when thumbs = 'like' then 1 else null end) as likes, count(case when thumbs = 'unlike' then 1 else null end) as unlikes from feedbacks";
			
			myStmt = myConn.createStatement();
			
			// execute query
			myRs = myStmt.executeQuery(sql);
			
			// process result set
			while (myRs.next()) {
				
				// retrieve data from result set row
				
				int Total = myRs.getInt("Total");
				int likes = myRs.getInt("likes");
				int unlikes = myRs.getInt("unlikes");
				
				// add it to the list 
				feed_count.add(Total);
				feed_count.add(likes);
				feed_count.add(unlikes);
			}
			
			return feed_count;		
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
	public void addFeedbacks(Feedbacks theFeedback) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		try {
			// get db connection
			myConn = dataSource.getConnection();
			
			// create sql for insert
			String sql = "insert into feedbacks "
					   + "(date,username,emailID,thumbs,heading,comment) "
					   + "values (?,?, ?, ?, ?, ?)";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values for the student
			myStmt.setString(1, theFeedback.getDate());
			myStmt.setString(2, theFeedback.getName());
			myStmt.setString(3, theFeedback.getEmail());
			myStmt.setString(4, theFeedback.getThumbs());
			myStmt.setString(5, theFeedback.getHeader());
			myStmt.setString(6, theFeedback.getContent());
			// execute sql insert
			myStmt.execute();
		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
	
	
}
