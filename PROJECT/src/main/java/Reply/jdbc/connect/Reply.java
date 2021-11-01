package Reply.jdbc.connect;

public class Reply {
	private int qid;
	private String reply;
	private String username;
	private String date;
	private String qq;
	public Reply(int qid, String reply, String username, String date) {
		super();
		this.qid = qid;
		this.reply = reply;
		this.username = username;
		this.date = date;
		
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}

		
	
	
}
