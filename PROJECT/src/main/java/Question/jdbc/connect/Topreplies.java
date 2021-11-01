package Question.jdbc.connect;

public class Topreplies {
	private String username;
	private int reply;
	
	public Topreplies(String username, int reply) {
		super();
		this.username = username;
		this.reply = reply;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}
	
	
}
