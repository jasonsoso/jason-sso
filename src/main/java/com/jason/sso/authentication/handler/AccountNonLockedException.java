package com.jason.sso.authentication.handler;

import org.jasig.cas.authentication.handler.BadCredentialsAuthenticationException;

/**
 * 用户非锁定异常
 * @author Jason
 * @data 2013-6-27 下午11:24:46
 */
public class AccountNonLockedException extends BadCredentialsAuthenticationException{
	public static final AccountNonLockedException ERROR = new AccountNonLockedException();
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 用户已锁定，请联系管理员
	 */
	public static final String CODE = "error.authentication.credentials.accountNonLocked";
	
	public AccountNonLockedException(){
		super(CODE);
	}
	
	public AccountNonLockedException(final Throwable throwable){
		super(CODE, throwable);
	}
	
	public AccountNonLockedException(final String code){
		super(code);
	}
	
	public AccountNonLockedException(final String code,final Throwable throwable){
		super(code, throwable);
	}
}
