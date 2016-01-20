<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="wine.PMF" %>
<%@ page import="wine.SampleData" %>

<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="javax.jdo.Query" %>
<%@ page import="java.text.MessageFormat" %>
<%@ page import="java.util.List" %>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>甲府</title>

</head>
<body>
	<a href="../index.html">トップ</a>
	
     <form action="/data_add" method="post" enctype="multipart/form-data">

		<input type="file" name="file" /><br /> 
		<input type="submit"value="アップロード" />

	</form>
<!-- <h1>Add Data.</h1>
	<table>
		<form method="post" action="/gae_add">
			<tr><td>Message:</td><td>
			<textarea name="message" cols="30" rows="3">
        	</textarea></td></tr>

			<tr><td>Account:</td><td>
				<input type="text" name="account" /></td></tr>
			<tr><td></td><td>
				<input type="submit" /></td></tr>
		</form>
	</table>
	
	 <table>
		<form action="/gae_del">
			<tr><td>Delete</td><td>
			<tr><td></td><td>
				<input type="submit" /></td></tr>
		</form>
	</table>
	-->

</body>
</html>