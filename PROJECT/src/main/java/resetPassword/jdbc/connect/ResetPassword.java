package resetPassword.jdbc.connect;

public class ResetPassword {
	
	private String NewPassword;
	private String ConfirmNewPassword;
	public ResetPassword(String newPassword, String confirmNewPassword) {
		super();
		NewPassword = newPassword;
		ConfirmNewPassword = confirmNewPassword;
	}
	public String getNewPassword() {
		return NewPassword;
	}
	public void setNewPassword(String newPassword) {
		NewPassword = newPassword;
	}
	public String getConfirmNewPassword() {
		return ConfirmNewPassword;
	}
	public void setConfirmNewPassword(String confirmNewPassword) {
		ConfirmNewPassword = confirmNewPassword;
	}
	
	
}
