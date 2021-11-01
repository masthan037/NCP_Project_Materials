package Question.jdbc.connect;

public class Question {
	private int qid;
	private String username;
	private String question;
	private String date;
	
	public Question(String username, String question, String date) {
		super();
		this.username = username;
		this.question = question;
		this.date = date;
	}
	
	public Question(int qid,String username, String question, String date) {
		super();
		this.qid = qid;
		this.username = username;
		this.question = question;
		this.date = date;
	}

	public int getQid() {
		return qid;
	}

	public void setQid(int qid) {
		this.qid = qid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Question [qid=" + qid + ", username=" + username + ", question=" + question + ", date=" + date + "]";
	}
	
	
	
	
}
