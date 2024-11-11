<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>

<%--  
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@192.168.1.21:1521:xe?oracle.jdbc.timezoneAsRegion=false"
	driver="oracle.jdbc.driver.OracleDriver" user="scott" password="tiger" />
--%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://192.168.1.21:3306/BookMarketDB?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="root" />
	
<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM member WHERE ID=? and password=?  
   <sql:param value="<%=id%>" />
   <sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="resultMember.jsp?msg=2" />
</c:forEach>

<c:redirect url="loginMember.jsp?error=1" />
