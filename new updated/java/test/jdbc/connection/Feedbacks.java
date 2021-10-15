package test.jdbc.connection;

public class Feedbacks {
	private String name;
	private String email;
	private String thumbs;
	private String header;
	private String content;
	private String date;
	
	public Feedbacks(String name, String email, String thumbs, String header, String content, String date) {
		super();
		this.name = name;
		this.email = email;
		this.thumbs = thumbs;
		this.header = header;
		this.content = content;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getThumbs() {
		return thumbs;
	}

	public void setThumbs(String thumbs) {
		this.thumbs = thumbs;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Feedbacks [name=" + name + ", email=" + email + ", thumbs=" + thumbs + ", header=" + header
				+ ", content=" + content + ", date=" + date + "]";
	}
	
	
	
		
	
}
