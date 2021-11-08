package create.account.jdbc.connect;

public class StudentAcc {
	private String UserName;
	private String Firstname;
	private String Lastname;
	private String Email;
	private String Date;
	private String Password;
	private String ConfirmPassward;
	private String Gender;
	
	

	public StudentAcc(String userName, String firstname, String lastname, String email, String date, String password,
			String confirmPassward, String gender) {
		super();
		UserName = userName;
		Firstname = firstname;
		Lastname = lastname;
		Email = email;
		Date = date;
		Password = password;
		ConfirmPassward = confirmPassward;
		Gender = gender;
	}



	public StudentAcc(String userName, String firstname, String email, String date, String password,
			String confirmPassward, String gender) {
		super();
		UserName = userName;
		Firstname = firstname;
		Email = email;
		Date = date;
		Password = password;
		ConfirmPassward = confirmPassward;
		Gender = gender;
	}



	public String getUserName() {
		return UserName;
	}



	public void setUserName(String userName) {
		UserName = userName;
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



	public String getPassword() {
		return Password;
	}



	public void setPassword(String password) {
		Password = password;
	}



	public String getConfirmPassward() {
		return ConfirmPassward;
	}



	public void setConfirmPassward(String confirmPassward) {
		ConfirmPassward = confirmPassward;
	}



	public String getGender() {
		return Gender;
	}



	public void setGender(String gender) {
		Gender = gender;
	}



	@Override
	public String toString() {
		return "StudentAcc [UserName=" + UserName + ", Firstname=" + Firstname + ", Lastname=" + Lastname + ", Email="
				+ Email + ", Date=" + Date + ", Password=" + Password + ", ConfirmPassward=" + ConfirmPassward
				+ ", Gender=" + Gender + "]";
	}
	
	
	
	
		
}
