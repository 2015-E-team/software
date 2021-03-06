<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="wine.PMF"%>
<%@ page import="wine.SampleData"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="javax.jdo.Query"%>
<%@ page import="java.text.MessageFormat"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Top Page</title>
<!-- 上部のボタン設定 -->
<style type="text/css">
button.button_nolink { /* 文字サイズを1.4emに指定 */
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

button.button_link { /* 文字サイズを1.4emに指定 */
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

button.button_link:hover { /* 背景色を明るい青色に指定 */
	background-color: #ffd500;
}

button.button_linktop { /* 文字サイズを1.4emに指定 */
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

button.button_linktop:hover { /* 背景色を明るい青色に指定 */
	background-color: #66b3ff;
}

button.button_linkhelp { /* 文字サイズを1.4emに指定 */
	font-size: 1.0em;
	/* 文字の太さをboldに指定 */
	font-weight: bold;
	/* 縦方向に10px、
* 横方向に30pxの余白を指定 */
	padding: 5px 10px;
	/* 背景色を濃い青色に指定 */
	background-color: #ff9966;
	/* 角丸の指定 */
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

button.button_linkhelp:hover { /* 背景色を明るい青色に指定 */
	background-color: #ffc1b3;
}
</style>

<script src="https://www.google.com/jsapi"></script>


<script>
	google.load('visualization', '1', {
		packages : [ 'geochart' ]
	});
	google.setOnLoadCallback(graphChart);
	function graphChart() {

		//本日の日付をデータ参照用に保持する変数
		/****************************************/
<%String today;
	
	Date hid =new Date(); 
	int da = hid.getDate();
	//system.out.println(da);
	
	int ho = hid.getHours()+9;
	if(ho > 23)
		ho= ho-24;
	
	if(ho < 10)
		today = "2014/1/"+ String.valueOf(da)+" 0"+String.valueOf(ho)+":00:00";
	else
		today = "2014/1/"+String.valueOf(da)+" "+String.valueOf(ho)+":00:00";%>
	/*************************************/
		var data = new google.visualization.DataTable();
		data.addColumn('string', '場所');
		data.addColumn('number', '気温(℃)')
		data.addColumn('number', '湿度(%)');
		data
				.addRows([
<%PersistenceManager pm = null;
//一時的に、温度を格納する配列
ArrayList<Double> tival_tem= new ArrayList<Double>();
try {
	pm = PMF.get().getPersistenceManager();
	// すべてのエンティティの表示
	Query day_query = pm.newQuery(SampleData.class);
	day_query.setFilter("date == '" + today+"'");
	//da.getName().equals("asti")
	day_query.setOrdering("r_date asc");
	List<SampleData> day_datas = (List<SampleData>) day_query.execute();
	for(SampleData day_da: day_datas){
		if( day_da.getName().equals("otaru") ){%>
	[
								'小樽',
<%=day_da.getTem()%>
	,
<%=day_da.getHum()%>
	],
<%}
		else if(day_da.getName().equals("kofu")){%>
	['甲府',
<%=day_da.getTem()%>
	,
<%=day_da.getHum()%>
	],
<%}
		else if(day_da.getName().equals("nigata")){%>
	['新潟',
<%=day_da.getTem()%>
	,
<%=day_da.getHum()%>
	],
<%}
		else if(day_da.getName().equals("naha")){%>
	['那覇',
<%=day_da.getTem()%>
	,
<%=day_da.getHum()%>
	],
<%}
		else if(day_da.getName().equals("nara")){%>
	['奈良',
<%=day_da.getTem()%>
	,
<%=day_da.getHum()%>
	],
<%}
	}
} finally {
	if (pm != null && !pm.isClosed())
	pm.close();
}%>
	]);
		//ウィンドウサイズの取得
		var windowWidth = (window.innerWidth
				|| document.documentElement.clientWidth || 0);

		//グラフ表示の設定
		var option = {
			region : 'JP', //表示する地図を日本に指定
			width : windowWidth + 'px',
			displayMode : 'markers', //表示方式の設定
			legend : 'none',//凡例の非表示
			sizeAxis : {minValue:10, maxValue:10},
			colorAxis :{colors:['#4374e0','#4374e0']}
		};

		var graph = new google.visualization.GeoChart(document
				.getElementById('drawChart'));
		graph.draw(data, option);

		//クリック時のイベント処理の設定
		google.visualization.events.addListener(graph, 'select', function(e) {
			var item = graph.getSelection()[0];
			var str = data.getFormattedValue(item.row, 0);//地域名の取得
			if (str == "小樽")
				location.href = "./Otaru/Otaru_tmp.jsp";
			else if (str == "新潟")
				location.href = "./Nigata/Nigata_tmp.jsp";
			else if (str == "奈良")
				location.href = "./Nara/Nara_tmp.jsp";
			else if (str == "那覇")
				location.href = "./Naha/Naha_tmp.jsp";
			else if (str == "甲府")
				location.href = "./Kofu/Kofu_tmp.jsp";
		});
	}
</script>

</head>
<body>
	<!-- 上部のボタン配置 -->
	<a href="./top.jsp">
		<button class="button_nolink" type="submit" disabled="disabled">トップ</button>
	</a>
	<tr>
		<th><a href="./Otaru/Otaru_tmp.jsp">
				<button class="button_link" type="submit">小樽</button>
		</a></th>
		<th><a href="./Nigata/Nigata_tmp.jsp">
				<button class="button_link" type="submit">新潟</button>
		</a></th>
		<th><a href="./Kofu/Kofu_tmp.jsp">
				<button class="button_link" type="submit">甲府</button>
		</a></th>
		<th><a href="./Nara/Nara_tmp.jsp">
				<button class="button_link" type="submit">奈良</button>
		</a></th>
		<th><a href="./Naha/Naha_tmp.jsp">
				<button class="button_link" type="submit">那覇</button>
		
		</a></th>
		<th><a href="../upload/upload.jsp">
				<button class="button_link" type="submit">アップロード</button>
		
		</a></th>
		<th><a href="./help/help_top.jsp">
				<button class="button_linkhelp" type="submit">ヘルプ</button>
		</a></th>
	</tr>



	<script>
		//今日の日付データを変数hidukeに格納
		var hiduke = new Date();
		//年・月・日・曜日を取得する
		var year = hiduke.getFullYear();
		var month = hiduke.getMonth() + 1;
		var week = hiduke.getDay();
		var day = hiduke.getDate();
		var hour = hiduke.getHours();
		var minute = hiduke.getMinutes();
		var yobi = new Array("日", "月", "火", "水", "木", "金", "土");
		document.open();
		document.write("<br><br>");
		document.write("西暦" + year + "年" + month + "月" + day + "日 "
				+ yobi[week] + "曜日");
		document.write("<br>");
		document.write(hour + "時" + minute + "分<br>");
		document.close();
	</script>



	<div id="drawChart"></div>

</body>
</html>