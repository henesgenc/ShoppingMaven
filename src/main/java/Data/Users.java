package Data;

import java.sql.Date;

public class Users {
	private int ID;
	private String username;
	private String user_password;
	private String user_name;
	private String user_surname;
	private Date user_birthdate;
	public Users(int ID,String username,String user_password,String user_name,String user_surname,Date user_birthdate) {
		this.ID = ID;
		this.username = username;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_surname = user_surname;
		this.user_birthdate = user_birthdate;
	}
	public int getID(){
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserPassword() {
		return user_password;
	}
	public void setUserPassword(String user_password) {
		this.user_password = user_password;
	}
	public String getUserName() {
		return user_name;
	}
	public void setUserName(String user_name) {
		this.user_name = user_name;
	}
	public String getUserSurname() {
		return user_surname;
	}
	public void setUserSurname(String user_surname) {
		this.user_surname = user_surname;
	}
	public Date getBirthdate() {
		return user_birthdate;
	}
	public void setBirthdate(Date user_birthdate) {
		this.user_birthdate = user_birthdate;
	}
}	
