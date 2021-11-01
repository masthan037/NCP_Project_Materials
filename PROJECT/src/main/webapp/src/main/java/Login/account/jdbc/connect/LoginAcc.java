package Login.account.jdbc.connect;

public class LoginAcc {

	private String UserName;
	private String Password;
	
	public LoginAcc(String userName, String password) {
		super();
		UserName = userName;
		Password = password;
	}
	
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassward(String password) {
		Password = password;
	}
	
	

}
