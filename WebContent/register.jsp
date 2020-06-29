<%@page import="Tools.DBHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%
	request.setCharacterEncoding("UTF-8");
String user_register = request.getParameter("user");
String iphone_number = request.getParameter("iphone_number");
String password = request.getParameter("password");
//System.out.println(user_register + iphone_number + password);
String sql1 = "insert into person(user,iphone,password) values(?,?,?)";
if (user_register != null & iphone_number != null & password != null){
	if (DBHelper.Update(sql1, new Object[] { user_register, iphone_number, password })) {
		out.print("ok");
		//System.out.print("ok>>>>>");

	} else {
		out.print("no");
		//System.out.print("no>>>>>");
	}
}

%>
