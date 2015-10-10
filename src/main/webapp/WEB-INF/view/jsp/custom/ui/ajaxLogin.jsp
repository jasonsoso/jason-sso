<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
Boolean isLogin = (Boolean)request.getAttribute("isLogin");
String ticket = (String)request.getAttribute("ticket");

String service = (String)request.getParameter("service");
String callbackName = request.getParameter("callback");

String login = isLogin?"success":"fails";
String msg = isLogin?"":"账号或密码不正确";

String jsonData = "{\"login\":\"" + login + "\",\"ticket\":\"" + ticket + "\",\"service\":\"" + service + "\",\"msg\":\"" + msg + "\"}";  
String jsonp = callbackName + "(" + jsonData + ")";  

response.setContentType("application/javascript");  
response.getWriter().write(jsonp); 

%>


