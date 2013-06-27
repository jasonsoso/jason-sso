package com.jason.sso.adaptors.jdbc;



import org.jasig.cas.adaptors.jdbc.AbstractJdbcUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.handler.AuthenticationException;
import org.jasig.cas.authentication.principal.UsernamePasswordCredentials;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;

import com.jason.sso.authentication.handler.AccountNonLockedException;
import com.jason.sso.model.UserInfo;


import javax.validation.constraints.NotNull;


/**
 * 重构 适合本项目的验证
 * @author Jason
 * @data 2013-6-27 下午11:19:14
 */
public class SearchModeSearchDatabaseAuthenticationHandler extends
    AbstractJdbcUsernamePasswordAuthenticationHandler implements InitializingBean {

	private static final Logger LOGGER = LoggerFactory.getLogger(SearchModeSearchDatabaseAuthenticationHandler.class);
	
    //private static final String SQL_PREFIX = "Select count('x') from ";
	private static final String SQL_PREFIX = "Select * from ";
	
    @NotNull
    private String fieldUser;

    @NotNull
    private String fieldPassword;

    @NotNull
    private String tableUsers;

    private String sql;

	@SuppressWarnings("deprecation")
	protected final boolean authenticateUsernamePasswordInternal(final UsernamePasswordCredentials credentials) throws AuthenticationException {
        final String transformedUsername = getPrincipalNameTransformer().transform(credentials.getUsername());
        final String encyptedPassword = getPasswordEncoder().encode(credentials.getPassword());
        
        UserInfo userInfo = null;
        try {
        	userInfo = getJdbcTemplate().queryForObject(this.sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class),
            		new String[]{transformedUsername,encyptedPassword});
		} catch (EmptyResultDataAccessException e) {
			LOGGER.error(String.format("用戶 %s 查詢沒有或者多條記錄！登陸失敗！", transformedUsername));
		}
		 
        //final int count = getJdbcTemplate().queryForInt(this.sql,transformedUsername, encyptedPassword);
        if(null != userInfo){
        	//判断该用户是否锁定，如果锁定 则抛出自定义错误AccountNonLockedException
        	if(!userInfo.isAccountNonLocked()){
        		throw new AccountNonLockedException();
        	}
        	return true;
        }else{
        	return false;
        }
    }

    public void afterPropertiesSet() throws Exception {
        this.sql = SQL_PREFIX + this.tableUsers + " Where " + this.fieldUser
        + " = ? And " + this.fieldPassword + " = ?"; 
    }

    public final void setFieldPassword(final String fieldPassword) {
        this.fieldPassword = fieldPassword;
    }

    public final void setFieldUser(final String fieldUser) {
        this.fieldUser = fieldUser;
    }
    public final void setTableUsers(final String tableUsers) {
        this.tableUsers = tableUsers;
    }
}