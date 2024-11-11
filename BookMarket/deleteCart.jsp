<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.spring.bookmarket.dto.Book"%>
<%@ page import="com.spring.bookmarket.dao.BookRepository"%>
<%
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}

	session.invalidate();
	response.sendRedirect("cart.jsp");
%>
