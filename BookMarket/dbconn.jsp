<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 
<%
	Connection conn = null;	

	try {
		String url = "jdbc:mysql://192.168.1.21:3306/BookMarketDB?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
		String user = "root";
		String password = "root";
		
//		String url = "jdbc:oracle:thin:@192.168.1.21:1521:xe?oracle.jdbc.timezoneAsRegion=false";
//		String user = "scott";
//		String password = "tiger";

		Class.forName("com.mysql.cj.jdbc.Driver");
//		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
		
%>