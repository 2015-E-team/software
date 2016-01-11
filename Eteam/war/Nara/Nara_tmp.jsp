<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>奈良</title>

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
	margin: 0px;
	padding: 0px;
	width: 700px;
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
	height: 400px;
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
</style>

<script type="text/javascript">
    function ファイル読込(ファイル名, 読込後処理名) {
        var 読込後処理
            =  new Function("引数", "return " + 読込後処理名 + "(引数)");   
        var httpObj = new XMLHttpRequest();
        httpObj.open("GET", ファイル名, true);
        httpObj.onreadystatechange = function() {
            if (httpObj.readyState == 4) {
                読込文 = httpObj.responseText;
                読込後処理(読込文);
            }
        }
        httpObj.send(null);
    }
</script>

</head>
<body>
	<a href="../index.html">トップ</a>
	<tr>
		<th><a href="../Otaru/Otaru_tmp.jsp">小樽</a></th>
		<th><a href="../Nigata/Nigata_tmp.jsp">新潟</a></th>
		<th><a href="../Kofu/Kofu_tmp.jsp">甲府</a></th>
		<th>奈良</th>
		<th><a href="../Naha/Naha_tmp.jsp">那覇</a></th>
		<th><a href="../help/help_top.jsp">ヘルプ</a></th>
	</tr>
	<tr>

		<div class="tabbox">
			<p class="tabs">
				<a href="#tab1" class="tab1"
					onclick="ChangeTab('tab1'); return false;">温度</a> <a href="#tab2"
					class="tab2" onclick="ChangeTab('tab2'); return false;">湿度</a> <a
					href="#tab3" class="tab3"
					onclick="ChangeTab('tab3'); return false;">稼働状況</a>
			</p>

			<div id="tab1" class="tab">
				<p>(タブ1の中身。何でも記述できます。)</p>
			</div>

			<div id="tab2" class="tab">
				<p>(タブ2の中身。HTMLタグも記述可能です。)</p>
			</div>

			<div id="tab3" class="tab">
				<p>
				<form>
					<select name="product" size="1" onChange="change(this)">
						<OPTION VALUE="">------------
						<% for(int i = 2016; i < 2100; i++) {%>
						<option value="<%= i%>"><%= i%>
						<% }%>
					</select>
					年
						
					<select name="product" size="1" onChange="change(this)">
					<OPTION VALUE="">------------
					<% for(int i = 1; i <= 12; i++) {%>
					<option value="<%= i%>"><%= i%>
					<% }%>
					</select>
					月　の稼働状況<br>
					
					アスティの気候データに合わせています<br><br>
					
					<script type="text/javascript">

				    function 例１(読込文) {
				        var 行列 = new Array();
				        //var 行 = null;
				        if (読込文.match(/\r/)){
				        	var 行 = 読込文.split("\r\n");
				        }// Ａ
				        else{
				        	行 = 読込文.split("\n");
				         }

				        var 行数 = 行.length;
				        for (var i = 0; i < 行数; i++) {
				            行列[i] = new Array();                              // Ｂ
				        }

				        var 最大列数 = 0;
				        for (i = 0; i < 行数; i++) {
				            var 列 = 行[i].split(",");                          // Ｃ
				            var 列数 = 列.length;
				            for (var j = 0; j < 列数; j++) {
				                行列[i][j] = 列[j];                             // Ｄ
				            }
				            if (列数 > 最大列数) 最大列数 = 列数;               // Ｅ
				        }

				        /*
				        var 表示内容 = "";
				        for (i = 0; i < 行数; i++) {
				            for (j = 0; j < 最大列数; j++) {
				                表示内容 +=  "行列[" + i + "][" + j + "]=" + 行列[i][j] + ", ";
				            }
				            表示内容 +=  "<br>";
				        }
				        document.getElementById("例１表示場所").innerHTML = 表示内容;*/
				    }
				</script>

				<!--
				<p><input type="button" value="例１表示"
				    onClick="ファイル読込('../plain_csv.csv', '例１')"></input></p>
				<div id="例１表示場所"></div>
				-->
					
					暖房稼働合計：　＊＊時間＊＊分<br>
					冷房稼働合計：　＊＊時間＊＊分<br>
					加湿器稼働合計：＊＊時間＊＊分<br>
					除湿機稼働合計：＊＊時間＊＊分<br>
	
				</form>
				
				</p>
			</div>

		</div>

		<script type="text/javascript">
		<!--
			// デフォルトのタブを選択
			ChangeTab('tab1');
		// -->
		</script>

	</tr>
</body>
</html>