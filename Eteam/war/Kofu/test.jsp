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
    <meta http-equiv="Content-Type" content="text/html; utf-8" />
  <title>PersonalData Index</title>
  
</head>

<%
	List<SampleData> datas = (List<SampleData>) request.getAttribute("datas");
%>

<body>
	<a href="Kofu_tmp.jsp">甲府</a>
<!-- 	    <form action="/getdata" method="post" enctype="multipart/form-data"></form> -->
	
<center>

<h2>一覧表示</h2>
<div class="tbl_center">
<div style="width: 750; text-align: left; margin: auto;">
	<a href="/">トップページへ</a>
</div>
<table class="sample-tbl html5jp-tbldeco" style="font-size: 0.8em; text-align: center;">
	<thead>
		<tr>
			<th style="width: 150px;">地域</th>
			<th style="width: 300px;">日</th>
			<th style="width: 150px;">温度</th>
			<th style="width: 150px;">湿度</th>
		</tr>
	</thead>
	<tbody>
<%
	for (SampleData data : datas) {
%>
		<tr>
			<td><%= data.getKey() %></td>
			<td><%= data.getDate() %></td>
			<td><%= data.getTem() %></td>
			<td><%= data.getHum() %></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</div>
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
	
	 <div id="curve_chart" style="width: 900px; height: 500px"></div> -->
	 </center>
</body>

</html>