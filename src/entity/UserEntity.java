package entity;

import javax.persistence.*;

@Entity
@Table(name = "Users")
public class UserEntity {
	@Id
	@Column(name = "Username")
	private String Username;
	@Column(name = "Password")
	private String Password;
	@Column(name = "Fullname")
	private String Fullname;

	public UserEntity(String username, String password, String fullname) {

		Username = username;
		Password = password;
		Fullname = fullname;
	}

	public UserEntity() {

	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getFullname() {
		return Fullname;
	}

	public void setFullname(String fullname) {
		Fullname = fullname;
	}

}
