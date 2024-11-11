<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<%--  
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@192.168.1.21:1521:xe?oracle.jdbc.timezoneAsRegion=false"
	driver="oracle.jdbc.driver.OracleDriver" user="scott" password="tiger" />
--%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.1.21:3306/BookMarketDB?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="root" />
	
<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member WHERE id = ?
   <sql:param value="<%=sessionId%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:import var="url" url="logoutMember.jsp" />
	<c:redirect url="resultMember.jsp" />
</c:if>

