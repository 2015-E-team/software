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

<script type="text/javascript">
<!--
	function ChangeTab(tabname) {
		// 全部消す
		document.getElementById('tab1').style.display = 'none';
		document.getElementById('tab2').style.display = 'none';
		document.getElementById('tab3').style.display = 'none';
		// 指定箇所のみ表示
		document.getElementById(tabname).style.display = 'block';
	}
// -->
</script>

<style type="text/css">
<!-- /* 表示領域全体 */
div.tabbox {
	margin: 10px;
	padding: 10px;
	width: windowWidth + px;
}

/* タブ部分 */
p.tabs {
	margin: 0px;
	padding: 0px;
}

p.tabs a {
	display: block;
	width: 5em;
	float: left;
	margin: 0px 1px 0px 0px;
	padding: 3px;
	text-align: center;
	border-radius: 12px 12px 0px 0px; /* 角を丸くする */
}

p.tabs a.tab1 {
	background-color: blue;
	color: white;
}

p.tabs a.tab2 {
	background-color: #aaaa00;
	color: white;
}

p.tabs a.tab3 {
	background-color: red;
	color: white;
}

p.tabs a:hover {
	color: yellow;
}

/* タブ中身のボックス */
div.tab {
	height: windowHeight + px;
	overflow: auto;
	clear: left;
}

div#tab1 {
	border: 2px solid blue;
	background-color: #ccffff;
}

div#tab2 {
	border: 2px solid #aaaa00;
	background-color: #ffffcc;
}

div#tab3 {
	border: 2px solid red;
	background-color: #ffcccc;
}

div.tab p {
	margin: 0.5em;
}
-->

button.button_nolink {
    /* 文字サイズを1.4emに指定 */
    font-size: 1.0em;

    /* 文字の太さをboldに指定 */
    font-weight: bold;

    /* 縦方向に10px、
     * 横方向に30pxの余白を指定 */
    padding: 5px 10px;
    
    /* 背景色を濃い青色に指定 */
    background-color: #cccccc;
    
    /* 文字色を白色に指定 */
    color: #000;
    
    /* 角丸の指定 */
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
}

button.button_link {
    /* 文字サイズを1.4emに指定 */
    font-size: 1.0em;

    /* 文字の太さをboldに指定 */
    font-weight: bold;

    /* 縦方向に10px、
     * 横方向に30pxの余白を指定 */
    padding: 5px 10px;
    
    /* 背景色を濃い青色に指定 */
    background-color: #ffe666;
    
    /* 角丸の指定 */
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
}
button.button_link:hover {
    /* 背景色を明るい青色に指定 */
    background-color: #ffd500;
}

button.button_linktop {
    /* 文字サイズを1.4emに指定 */
    font-size: 1.0em;

    /* 文字の太さをboldに指定 */
    font-weight: bold;

    /* 縦方向に10px、
     * 横方向に30pxの余白を指定 */
    padding: 5px 10px;
    
    /* 背景色を濃い青色に指定 */
    background-color: #00d5ff;
    
    /* 角丸の指定 */
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
}
button.button_linktop:hover {
    /* 背景色を明るい青色に指定 */
    background-color: #66b3ff;
}

button.button_linkhelp {
    /* 文字サイズを1.4emに指定 */
    font-size: 1.0em;

    /* 文字の太さをboldに指定 */
    font-weight: bold;

    /* 縦方向に10px、
     * 横方向に30pxの余白を指定 */
    padding: 5px 10px;
    
    /* 背景色を濃い青色に指定 */
    background-color:#ff9966;
    
    /* 角丸の指定 */
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
}
button.button_linkhelp:hover {
    /* 背景色を明るい青色に指定 */
    background-color: #ffc1b3;
}

</style>

</head>
<body>

	<a href="../top.jsp">
	<button class="button_linktop" type="submit">トップ</button>
	</a>
	<tr>
		<th><a href="../Otaru/Otaru_tmp.jsp">
		<button class="button_link" type="submit">小樽</button>
		</th>
		
		<th><a href="../Nigata/Nigata_tmp.jsp">
		<button class="button_link" type="submit">新潟</button>
		</a></th>
		
		<th><a href="../Kofu/Kofu_tmp.jsp">
		<button class="button_link" type="submit">甲府</button>
		</a></th>
		
		<th><a href="../Nara/Nara_tmp.jsp">
		<button class="button_link" type="submit">奈良</button>
		</a></th>
				
		<th><a href="../Naha/Naha_tmp.jsp">
		<button class="button_link" type="submit">那覇</button>
		</a></th>

		<th>
		<button class="button_nolink" type="submit" disabled="disabled">アップロード</button>
		</a></th>
		
		<th><a href="../help/help_up.jsp">
		<button class="button_linkhelp" type="submit">ヘルプ</button>
		</a></th>
	</tr>
	
     <form action="/data_add" method="post" enctype="multipart/form-data">

		<input type="file" name="file" /><br /> 
		<input type="submit"value="アップロード" />

	</form>

		<script type="text/javascript">
		<!--
			// デフォルトのタブを選択
			ChangeTab('tab1');
		// -->
		</script>

</body>
</html>