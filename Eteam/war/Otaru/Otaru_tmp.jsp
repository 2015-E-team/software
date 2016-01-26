<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小樽</title>

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
	<a href="../index.html">
	<button class="button_linktop" type="submit">トップ</button>
	</a>
	<tr>
		<th>
		<button class="button_nolink" type="submit" disabled="disabled">小樽</button>
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
		
		<th><a href="../help/help_top.jsp">
		<button class="button_linkhelp" type="submit">ヘルプ</button>
		</a></th>
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

					<SCRIPT LANGUAGE="JavaScript">
					<!--
						mydate = new Date();
						Ye = mydate.getFullYear() + "年";
						Mo = mydate.getMonth() + 1 + "月";
						Da = mydate.getDate() + "日";
						Day = mydate.getDay();
						Day2 = new Array(7);
						Day2[0] = "日";
						Day2[1] = "月";
						Day2[2] = "火";
						Day2[3] = "水";
						Day2[4] = "木";
						Day2[5] = "金";
						Day2[6] = "土";
						document
								.write("<FONT style='font-size : 16px; color : #666666'>");
						document.write("本日は" + Ye + Mo + Da + "（" + Day2[Day]
								+ "）");
						document.write("です</FONT>");
					//-->
					</SCRIPT>
				<form name="date">
					<select name="year" size="1" onChange="PutMoveTime()">
						<OPTION VALUE="">
							------------
							<%
							for (int i = 2016; i < 2100; i++) {
						%>
						
						<option value="<%= i%>"><%= i%>
							<% }%>
						
					</select> 年 <select name="month" size="1" onChange="PutMoveTime()">
						<OPTION VALUE="">
							------------
							<% for(int i = 1; i <= 12; i++) {%>
						
						<option value="<%= i%>"><%= i%>
							<% }%>
						
					</select> 月 の稼働状況<br> アスティの気候データに合わせています<br> <br>

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

				        
				        var danbou_h = 行列[0][0];
						 var danbou_m = 行列[0][1];
						 var reibou_h = 行列[0][2];
						 var reibou_m = 行列[1][0];
						 var joshitsu_h = 行列[1][1];
						 var joshitsu_m = 行列[1][2];
						 var kashitsu_h = 行列[2][0];
						 var kashitsu_m = 行列[2][1];
						 
				        var 表示内容_data = "　暖房稼働合計　：　" + String(danbou_h) + "時間" + String(danbou_m) +"分" + "<br>" +
						　 						"　冷房稼働合計　：　" + String(reibou_h) + "時間" + String(reibou_m) + "分" + "<br>" +
						   						"　加湿器稼働合計：　" + String(joshitsu_h) + "時間" + String(joshitsu_m) + "分" + "<br>" +
						   						"　除湿機稼働合計：　" + String(kashitsu_h) + "時間" + String(kashitsu_m) + "分";
				        
				        
				        /*var 表示内容_data = "";
				        
				        for (i = 0; i < 行数; i++) {
				            for (j = 0; j < 最大列数; j++) {
				                表示内容_data +=  "行列[" + i + "][" + j + "]=" + 行列[i][j] + ", ";
				            }
				            表示内容_data +=  "<br>";
				        }*/
				        document.getElementById("例１表示場所").innerHTML = 表示内容_data;
				    }
				</script>

					<!--
				<p><input type="button" value="例１表示"
				    onClick="ファイル読込('../plain_csv.csv', '例１')"></input></p>
				<div id="例１表示場所"></div>
				-->
				<script>
				function PutMoveTime(){
					
					if(    document.date.year.selectedIndex == 0 ||
							document.date.month.selectedIndex == 0){
						var 表示内容_nodata = "表示する年と月を指定してください"
					    document.getElementById("例１表示場所").innerHTML = 表示内容_nodata;
					}
					else{
						//表示内容_nodata = document.date.year.selectedIndex + 2015 + "年" + document.date.month.selectedIndex + "月";
						var ファイル名 = "../plain";
						if(document.date.month.selectedIndex == 1){
							ファイル名+= "1.csv";
						}
						else{
							ファイル名+= "2.csv";
						}
						ファイル読込(ファイル名, '例１');
					}
					
				}
				</script>
					<div id="例１表示場所">
					</div>
					
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