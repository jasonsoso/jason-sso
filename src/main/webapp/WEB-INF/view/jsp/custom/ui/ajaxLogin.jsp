<%@ page contentType="text/html; charset=UTF-8"%>  
<html>  
    <head>  
        <title>正在登录....</title>  
    </head>  
    <body>  
        <script type="text/javascript">  
            <%  
                Boolean isFrame = (Boolean)request.getAttribute("isFrame");  
                Boolean isLogin = (Boolean)request.getAttribute("isLogin");  
                
                String service = (String)request.getParameter("service");
                String ticket = (String)request.getAttribute("ticket");
                // 登录成功  
                if(isLogin){
                    if(isFrame){
                    	response.sendRedirect(service+"?ticket="+ticket);
                    %>  
                        //parent.location.replace('${service}?ticket=${ticket}')  
                    <%} else{
                    	response.sendRedirect(service+"?ticket="+ticket);
                    %>  
                        //location.replace('${service}?ticket=${ticket}')  
                    <%}  
                }else{
                	response.sendRedirect("http://admin.jasonsoso.com:8087/login?code=1");
                %>
                        //location.replace('http://admin.jasonsoso.com:8087/login?code=1');
                <%}
            %>  
            
            // 回调  
            //${callback}({'login':${isLogin ? '"success"': '"fails"'}, 'msg': ${isLogin ? '""': '"用户名或密码错误！"'}})  
        </script>  
    </body>  
</html>
<%
/* Boolean isLogin = (Boolean)request.getAttribute("isLogin");
String ticket = (String)request.getAttribute("ticket");

String service = (String)request.getParameter("service");
String callbackName = request.getParameter("callback");

String login = isLogin?"success":"fails";
String msg = isLogin?"":"账号或密码不正确";

String jsonData = "{\"login\":\"" + login + "\",\"ticket\":\"" + ticket + "\",\"service\":\"" + service + "\",\"msg\":\"" + msg + "\"}";  
String jsonp = callbackName + "(" + jsonData + ")";  

response.setContentType("application/javascript");  
response.getWriter().write(jsonp); 
 */
%>


