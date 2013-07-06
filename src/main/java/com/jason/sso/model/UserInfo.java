package com.jason.sso.model;

import java.io.Serializable;

/**
 * @author Jason
 * @data 2013-6-27 下午11:24:46
 */
public class UserInfo  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	//protected long id;
	
	private String username;
	
	//private String truename;
	
	private String password;
	
	//private String email;
	
	private boolean accountNonLocked = false;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	
}
