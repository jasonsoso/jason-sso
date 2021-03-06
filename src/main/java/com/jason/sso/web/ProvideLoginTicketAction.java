package com.jason.sso.web;

import javax.servlet.http.HttpServletRequest;  
import javax.validation.constraints.NotNull;

import org.jasig.cas.util.UniqueTicketIdGenerator;
import org.jasig.cas.web.support.WebUtils;  
import org.springframework.webflow.action.AbstractAction;  
import org.springframework.webflow.execution.Event;  
import org.springframework.webflow.execution.RequestContext;  


/**  
 * Opens up the CAS web flow to allow external retrieval of a login ticket.  
 *   
 */  
public class ProvideLoginTicketAction extends AbstractAction{   
	 /** 3.5.1 - Login tickets SHOULD begin with characters "LT-" */
    private static final String PREFIX = "LT";
    
	@NotNull
    private UniqueTicketIdGenerator ticketIdGenerator;
    
	@Override  
    protected Event doExecute(RequestContext context) throws Exception {   
        final HttpServletRequest request = WebUtils.getHttpServletRequest(context);   
        //Event event = context.getCurrentEvent();  
        
        if (request.getParameter("get-lt") != null && request.getParameter("get-lt").equalsIgnoreCase("true")) {   
        	 final String loginTicket = this.ticketIdGenerator.getNewTicketId(PREFIX);
             this.logger.debug("Generated login ticket " + loginTicket);
             WebUtils.putLoginTicket(context, loginTicket);
        	return result("loginTicketRequested");   
        }   
        return result("continue");   
    }   
    
	public void setTicketIdGenerator(final UniqueTicketIdGenerator generator) {
        this.ticketIdGenerator = generator;
    }
}   
// 如果参数中包含 get-lt 参数，则返回 loginTicketRequested 执行流，并跳转至 loginTicket 生成页，否则 则跳过该flow，并按照原始login的流程来执行。