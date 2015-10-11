<%@ page contentType="text/html; charset=UTF-8"%>
<%
if (request.getParameter("get-lt") != null && request.getParameter("get-lt").equalsIgnoreCase("true")) {
	String callbackName = request.getParameter("callback");
	String jsonData = "{\"lt\":\"" + request.getAttribute("loginTicket") + "\", \"execution\":\"" + request.getAttribute("flowExecutionKey") + "\"}";  
	String jsonp = callbackName + "(" + jsonData + ")";  
	
	response.setContentType("application/javascript");  
	response.getWriter().write(jsonp); 
}
%>
