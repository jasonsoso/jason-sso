<jsp:directive.include file="includes/top.jsp" />
<!-- 
<c:if test="${not pageContext.request.secure}">
<div id="msg" class="errors">
    <h2>Non-secure Connection</h2>
    <p>You are currently accessing CAS over a non-secure connection.  Single Sign On WILL NOT WORK.  In order to have single sign on work, you MUST log in over HTTPS.</p>
</div>
</c:if>
 -->
  <div class="box fl-panel" id="login">
			<form:form method="post" id="fm1" cssClass="fm-v clearfix" commandName="${commandName}" htmlEscape="true">
                  <form:errors path="*" id="msg" cssClass="errors" element="div" />
                <!-- <spring:message code="screen.welcome.welcome" /> -->
                    <h2><spring:message code="screen.welcome.instructions" /></h2>
                    <div class="row fl-controls-left">
                        <label for="username" class="fl-label"><spring:message code="screen.welcome.label.netid" /></label>
						<c:if test="${not empty sessionScope.openIdLocalId}">
						<strong>${sessionScope.openIdLocalId}</strong>
						<input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}" />
						</c:if>

						<c:if test="${empty sessionScope.openIdLocalId}">
						<spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
						<form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" />
						</c:if>
                    </div>
                    <div class="row fl-controls-left">
                        <label for="password" class="fl-label"><spring:message code="screen.welcome.label.password" /></label>
						<%--
						NOTE: Certain browsers will offer the option of caching passwords for a user.  There is a non-standard attribute,
						"autocomplete" that when set to "off" will tell certain browsers not to prompt to cache credentials.  For more
						information, see the following web page:
						http://www.geocities.com/technofundo/tech/web/ie_autocomplete.html
						--%>
						<spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
						<form:password cssClass="required" cssErrorClass="error" id="password" size="25" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                    </div>
                    <div class="row check" style="display: none;">
                        <input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code="screen.welcome.label.warn.accesskey" />" type="checkbox" />
                        <label for="warn"><spring:message code="screen.welcome.label.warn" /></label>
                    </div>
                    <div class="row btn-row">
						<input type="hidden" name="lt" value="${loginTicket}" />
						<input type="hidden" name="execution" value="${flowExecutionKey}" />
						<input type="hidden" name="_eventId" value="submit" />

                        <input class="btn-submit" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
                        <input class="btn-reset" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
                    </div>
            </form:form>
          </div>
            <div id="sidebar">
				<div class="sidebar-content">
                    <!-- <p class="fl-panel fl-note fl-bevel-white fl-font-size-80"><spring:message code="screen.welcome.security" /></p> -->
				    <c:choose>
                     <c:when test="${not empty requestScope['isMobile'] and not empty mobileCss}">
                        
                     </c:when>
                     <c:otherwise>
                         <%-- <div class="container">
                            <div id="slides">
                              <img style="max-height: 470px;max-width: 800px" src="<c:url value="/images/example-slide-1.jpg" />" alt="" />
                            </div>
                          </div> --%>
                     </c:otherwise>
                </c:choose>
				    
				</div>
				
            </div>
<jsp:directive.include file="includes/bottom.jsp" />