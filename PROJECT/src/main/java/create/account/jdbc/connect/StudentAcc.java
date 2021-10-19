package create.account.jdbc.connect;

public class StudentAcc {
	private String UserName;
	private String Firstname;
	private String Lastname;
	private String Email;
	private String Date;
	private String Password;
	private String ConfirmPassward;
	
	
	
	public StudentAcc(String UserName, String Firstname, String Lastname, String Email, String Date, String password,
			String ConfirmPassward) {
		super();
		this.UserName = UserName;
		this.Firstname = Firstname;
		this.Lastname = Lastname;
		this.Email = Email;
		this.Date = Date;
		this.Password = password;
		this.ConfirmPassward = ConfirmPassward;
	}
	
	
	//Last Name is can be null
	public StudentAcc(String UserName, String Firstname, String Email, String Date, String password,
			String ConfirmPassward) {
		super();
		this.UserName = UserName;
		this.Firstname = Firstname;
		this.Email = Email;
		this.Date = Date;
		this.Password = password;
		this.ConfirmPassward = ConfirmPassward;
	}



	public String getUserName() {
		return UserName;
	}
	public void setUserName(String UserName) {
		this.UserName = UserName;
	}
	public String getFirstname() {
		return Firstname;
	}
	public void setFirstname(String Firstname) {
		this.Firstname = Firstname;
	}
	public String getLastname() {
		return Lastname;
	}
	public void setLastname(String Lastname) {
		this.Lastname = Lastname;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String Email) {
		this.Email = Email;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String Date) {
		this.Date = Date;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getConfirmPassward() {
		return ConfirmPassward;
	}
	public void setConfirmPassward(String ConfirmPassward) {
		this.ConfirmPassward = ConfirmPassward;
	}
	
}
