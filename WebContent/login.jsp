<%@page import="Tools.DBHelper"%>
<%@page import="Tools.Phone"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<%
    String user_mysql = null;
    String iphone_mysql = null;
    String password_mysql = null;

%>
<%
    String user_lgoin = new String(request.getParameter("user").getBytes("iso-8859-1"), "UTF-8");
    String password_login = new String(request.getParameter("password").getBytes("iso-8859-1"), "UTF-8");
    if (Phone.isPhone(user_lgoin)) {
        System.out.println(user_lgoin);
        String sql = "select *from person where iphone=? and password=?";
        List<HashMap<String, Object>> list = DBHelper.getList(sql, new Object[]{user_lgoin, password_login});
        for (HashMap<String, Object> map : list) {
            user_mysql = map.get("iphone").toString();
            password_mysql = map.get( "password").toString();
        }
        if (user_lgoin.equals(user_mysql) && password_login.equals(password_mysql)) {
            out.print("ok");
        } else {
            out.print("no");
        }
    } else {
        String sql = "select *from person where user=? and password=?";
        List<HashMap<String, Object>> list = DBHelper.getList(sql, new Object[]{user_lgoin, password_login});
        for (HashMap<String, Object> map : list) {
            user_mysql = map.get("user").toString();
            password_mysql = map.get("password").toString();
        }
        if (user_lgoin.equals(user_mysql) && password_login.equals(password_mysql)) {
            out.print("ok");
        } else {
            out.print("no");
        }
    }

%>
