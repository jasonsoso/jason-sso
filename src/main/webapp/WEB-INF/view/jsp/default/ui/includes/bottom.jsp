
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</div>
                <div id="footer" class="fl-panel fl-note fl-bevel-white fl-font-size-80">
                	<a id="jasig" href="http://www.jasonsoso.com" title="go to JasonSoSo home page"></a>
                    <div id="copyright">
                        <p>Copyright &copy; 2013 JasonSoSo, Inc. All rights reserved.</p>
                        <p>
                        
                            Powered by <a href="http://www.jasonsoso.com">JasonSoSo</a>
                            
                        </p>
                        <p>
                <%
                final String queryString = request.getQueryString() == null ? "" : request.getQueryString().replaceAll("&locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]|^locale=([A-Za-z][A-Za-z]_)?[A-Za-z][A-Za-z]", "");
                %>
                    <c:set var='query' value='<%=queryString%>' />
                    <c:set var="xquery" value="${fn:escapeXml(query)}" />
                        <form method="get" action="login?${xquery}">
                           <select name="locale">
                                <option value="">Select Languages</option>
                               <option value="en">English</option>
                               <!--<option value="es">Spanish</option> 
                               <option value="fr">French</option>
                               <option value="ru">Russian</option>
                               <option value="nl">Nederlands</option>
                               <option value="sv">Svenska</option>
                               <option value="it">Italiano</option>
                               <option value="ur">Urdu</option>-->
                               <option value="zh_CN">Chinese (Simplified)</option>
                               <option value="zh_TW">Chinese (Traditional)</option>
                               <!--<option value="de">Deutsch</option>
                               <option value="ja">Japanese</option>
                               <option value="hr">Croatian</option>
                               <option value="cs">Czech</option>
                               <option value="sl">Slovenian</option>
                               <option value="pl">Polish</option>
                               <option value="ca">Catalan</option>
                               <option value="mk">Macedonian</option>
                               <option value="fa">Farsi</option>
                               <option value="ar">Arabic</option>-->
                               <option value="pt_PT">Portuguese</option>
                               <!-- <option value="pt_BR">Portuguese (Brazil)</option> -->
                           </select>
                           <input type="submit" value="Go">
                        </form>
                     
                
                    
                        </p>
                        
                        
                
                
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="<c:url value="/js/jquery/jquery.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/jquery/jquery-ui.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/js/cas.js" />"></script>
        
    </body>
</html>

