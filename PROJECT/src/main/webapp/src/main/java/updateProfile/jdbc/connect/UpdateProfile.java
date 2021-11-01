package updateProfile.jdbc.connect;

public class UpdateProfile {
	private String Firstname;
	private String Lastname;
	private String Email;
	private String Date;
	public UpdateProfile(String firstname, String lastname, String email, String date) {
		super();
		Firstname = firstname;
		Lastname = lastname;
		Email = email;
		Date = date;
	}
	public UpdateProfile(String firstname, String email, String date) {
		super();
		Firstname = firstname;
		Email = email;
		Date = date;
	}
	public String getFirstname() {
		return Firstname;
	}
	public void setFirstname(String firstname) {
		Firstname = firstname;
	}
	public String getLastname() {
		return Lastname;
	}
	public void setLastname(String lastname) {
		Lastname = lastname;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	
	
	
}
