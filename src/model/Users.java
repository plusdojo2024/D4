package model;
import java.io.Serializable;
import java.sql.Date;

public class Users implements Serializable {
	private int users_id;
	private String mail;
	private String password;
	private int grow_point;
	private Date last_login_date;
	
	//引数がないコンストラクタ
	public Users() {
		
	}
	
	//引数があるコンストラクタ
	public Users(int users_id, String mail, String password,
				 int grow_point, Date last_login_date) {
		super();
		this.users_id = users_id;
		this.mail = mail;
		this.password = password;
		this.grow_point = grow_point;
		this.last_login_date = last_login_date;
	}

	public int getUsers_id() {
		return users_id;
	}

	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getGrow_point() {
		return grow_point;
	}

	public void setGrow_point(int grow_point) {
		this.grow_point = grow_point;
	}

	public Date getLast_login_date() {
		return last_login_date;
	}

	public void setLast_login_date(Date last_login_date) {
		this.last_login_date = last_login_date;
	}
	
}
