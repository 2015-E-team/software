<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="wine.PMF" %>
<%@ page import="wine.SampleData" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="javax.jdo.Query" %>
<%@ page import="java.text.MessageFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
	<% 
	int start = 0;
	int h_end = 0; 

	String h_str = request.getParameter("h_end");
	String h_next = request.getParameter("h_next");
	String h_pre = request.getParameter("h_pre");

	String h_year = request.getParameter("h_year");
	String h_month = request.getParameter("h_month");
	String h_day = request.getParameter("h_day");
	String h_hour = request.getParameter("h_hour");

	
	if(h_year != null && h_month != null && h_day != null && h_hour != null){
		h_end = (Integer.parseInt(h_day) - 1) * 24 + Integer.parseInt(h_hour);
		if(h_end >= 738)
			h_end = 738;
	}

	if( h_str != null && h_next != null ){
		if(Integer.parseInt(h_str) < 732)
			h_end = Integer.parseInt(h_str) + 6;
		else 
			h_end = 738;
	}

	if( h_str != null && h_pre != null ){
		if(Integer.parseInt(h_str) >= 7)
			h_end = Integer.parseInt(h_str) - 6;
		else 
			h_end = 0;
	}
	%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小樽</title>

	<!--Load the AJAX API-->

	
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    var windowWidth = (window.innerWidth||document.documentElement.clientWidth||0);
        
    google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
    	var data = new google.visualization.DataTable();
    	data.addColumn('string', ' ');
    	data.addColumn('number', '小樽')
    	data.addColumn('number', 'アスティ');
    	data.addRows([
    	          		<%
    	          		PersistenceManager pm = null;
    	          		int count = 0;
    	          		//一時的に、温度を格納する配列
    	          		ArrayList<Integer> asti_hum= new ArrayList<Integer>();
    	          		
    	          		try {
    	            		pm = PMF.get().getPersistenceManager();
    	            		Query ast_query = pm.newQuery(SampleData.class);
    	            		ast_query.setFilter("name == " + "'asti'");           		
    	            		ast_query.setOrdering("r_date asc");
    	            		List<SampleData> ast_datas = (List<SampleData>) ast_query.execute();
    	        			// すべてのエンティティの表示
    	        			for (SampleData ast_da : ast_datas)
    							asti_hum.add(ast_da.getHum());
    	        				    	        			
    	            		Query ota_query = pm.newQuery(SampleData.class);
    	            		ota_query.setFilter("name == " + "'otaru'");           		
    	            		ota_query.setOrdering("r_date asc");
    	            		List<SampleData> ota_datas = (List<SampleData>) ota_query.execute();
    	                						
    	            		for(SampleData ota_da: ota_datas){
    	            			if(count == h_end + 6)
    	            				break;
    							if(count >= h_end){%>
    								['<%= ota_da.getDate() %>', <%=ota_da.getHum()%>, <%=asti_hum.get(count)%>],
    							<%
    							System.out.println(count);}
    	       			count++;
    	            		}
    	        		} finally {
    	            	if (pm != null && !pm.isClosed())
    	               	pm.close();
    	        		}
    	        		%>
        		
    	]);
	    
	    var options = {
	    		chart: {title: ' ', subtitle: ' '},
        		width: 0.9 * windowWidth + 'px',
        		height: 600,
				axes: {
					y: {
						0: {label: '湿度（％）'}
	    			}
				}
        		};
	    var chart = new google.charts.Line(document.getElementById('hum_div'));

	    chart.draw(data, options);
    }
    
    </script>

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

<script type="text/javascript">
    function ファイル読込(農家の地名,比較地名,selectedyear,selectedmonth) {
    	例１(農家の地名,比較地名,selectedyear,selectedmonth);
    }
</script>

</head>
<body>
	<a href="../top.jsp">
	<button class="button_linktop" type="submit">トップ</button>
	</a>
	<tr>
		<th>
		<button class="button_nolink" type="submit" disabled="disabled">小樽</button>
		</a></th>
			
		<th><a href="../Nigata/Nigata_tmp.jsp">
		<button class="button_link" type="submit">新潟</button>
		</a></th>
	
		<th><a href="../Kofu/Kofu_tmp.jsp">
		<button class="button_link" type="submit">甲府</button>
		</th>
		
		
		<th><a href="../Nara/Nara_tmp.jsp">
		<button class="button_link" type="submit">奈良</button>
		</a></th>
		
		<th><a href="../Naha/Naha_tmp.jsp">
		<button class="button_link" type="submit">那覇</button>
		</a></th>
		
		<th><a href="../upload/upload.jsp">
		<button class="button_link" type="submit">アップロード</button>
		</a></th>
		
		<th><a href="../help/help_tem_kadou.jsp">
		<button class="button_linkhelp" type="submit">ヘルプ</button>
		</a></th>
	</tr>
	<tr>
		<div class="tabbox">
			<p class="tabs">
				<a href="Otaru_tmp.jsp" class="tab1" type="submit">温度</a>
				<a href="#tab2" class="tab2" onclick="ChangeTab('tab2'); return false;">湿度</a>
				<a href="#tab3" class="tab3" onclick="ChangeTab('tab3'); return false;">稼働状況</a>
			</p>

			<div id="tab1" class="tab">
			</div>

			<div id="tab2" class="tab">
								<p>
				<form name="f">
					<input type="hidden" name="start" value="<%=start%>">
					<select name="h_year" size="1" onChange="change(this)">
						<OPTION VALUE="">------------
						<% for(int year = 2010; year < 2100; year++){%>
						<option value="<%= year%>"><%= year%>
					<% }%>
					</select>
					年
						
					<select name="h_month" size="1" onChange="change(this)">
					<OPTION VALUE="">------------
					<% for(int month = 1; month <= 12; month++) {%>
					<option value="<%= month%>"><%= month%>
					<% }%>
					</select>	
					月
					
					<select name="h_day" size="1" onChange="change(this)">
					<OPTION VALUE="">------------
					<% for(int day = 1; day <= 31; day++) {%>
					<option value="<%= day%>"><%= day%>
					<% }%>
					</select>	
					日
					
					<select name="h_hour" size="1" onChange="change(this)">
					<OPTION VALUE="">------------
					<% for(int hour = 0; hour <= 23; hour++) {%>
					<option value="<%= hour%>"><%= hour%>
					<% }%>
					</select>	
					時					
					
					<input type="submit" value="move" name="move">
				</form>
				</p>
			    <!-- グラフの id を指定して描画 -->
              <div id="hum_div"></div>			
					<form name="f">
						<input type="hidden" name="h_end" value="<%=h_end%>">
						<input type="submit" value="pre" name="h_pre">
						<input type="submit" value="next" name="h_next">
					</form>
				</p>
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
							for (int i = 2010; i < 2100; i++) {
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

				    function 例１(農家の地名,比較地名,selectedyear,selectedmonth) {
				    	
			        	var 表示内容_data = null;
			        	
			        	var 農家気温 = new Array();
			        	var 農家湿度  = new Array();
			        	var 比較地気温  = new Array();
			        	var 比較地湿度  = new Array();

			        	var 暖房稼働時間 = 0;
			        	var 冷房稼働時間 = 0;
			        	var 加湿器稼働時間 = 0;
			        	var 除湿器稼働時間 = 0;
			        	
			        	var 暖房稼働時間_分 = 0;
			        	var 暖房稼働時間_時間 = 0;
			        	var 冷房稼働時間_分 = 0;
			        	var 冷房稼働時間_時間 = 0;
			        	var 加湿器稼働時間_分 = 0;
			        	var 加湿器稼働時間_時間 = 0;
			        	var 除湿器稼働時間_分 = 0;
			        	var 除湿器稼働時間_時間 = 0;
			        	
			        	var データ位置 = 0;
			        	
			        	var 農家init = null;
			        	var 比較地init = null;
			        	
			        	var i = 0;
			        	var j = 0;
			        				        	
			        	var 表示内容_data = null;
			        	<%PersistenceManager _pm = null;
		          		
		        		try {
		            		_pm = PMF.get().getPersistenceManager();
		            		Query query = _pm.newQuery(SampleData.class);
		            		query.setOrdering("r_date asc");
		            		List<SampleData> datas = (List<SampleData>) query.execute();
		            		
		        			// すべてのエンティティの表示
		        			for (SampleData da : datas) {%>
		        				if(<%=da.getName().equals("otaru")%>){
	        				
        							if(農家init == null){
        								農家init = データ位置;
        							}
        				
        						農家気温[i] = <%=da.getTem()%>;
        						農家湿度[i] = <%=da.getHum()%>;
        						i++;
        						}
        						if(<%=da.getName().equals("asti")%>) {
        					
        							if(比較地init == null){
        								比較地init = データ位置;
        							}
        					
		        					比較地気温[j] = (5/9)*(<%=da.getTem()%>-32);
		        					比較地湿度[j] =<%=da.getHum()%>;
		        				j++;
        						}
        					データ位置++;
		        			<%}%>
		        			var 比較地データ位置 = 0;
		        			if(selectedyear != 2014 || selectedmonth != 1){
		        				表示内容_data =　"データがありません";
		        			}
		        			else{
		        				for(var i = 0;i < mydate.getDate() *24-1; i++){
		        					if(農家気温[i] - 比較地気温[i] > 0){
		        						冷房稼働時間 += (農家気温[i] - 比較地気温[i])/0.4;
		        					}
		        					else{
		        						暖房稼働時間 += (比較地気温[i] - 農家気温[i])/0.4;
		        					}
		        					
		        					if(農家湿度[i] - 比較地湿度[i] > 0){
		        						除湿器稼働時間 += (農家湿度[i] - 比較地湿度[i])/1;
		        					}
		        					else{
		        						加湿器稼働時間 += (比較地湿度[i] - 農家湿度[i])/1;
		        					}
		        				}
		        				
		        				暖房稼働時間_時間 = parseInt(暖房稼働時間/60);
		        				暖房稼働時間_分 = parseInt(暖房稼働時間 % 60);
		        				
		        				冷房稼働時間_時間 = parseInt(冷房稼働時間/60);
		        				冷房稼働時間_分 = parseInt(冷房稼働時間 % 60);
		        				
		        				除湿器稼働時間_時間 = parseInt(除湿器稼働時間/60);
		        				除湿器稼働時間_分 = parseInt(除湿器稼働時間 % 60);
		        				
		        				加湿器稼働時間_時間 = parseInt(加湿器稼働時間/60);
		        				加湿器稼働時間_分 = parseInt(加湿器稼働時間 % 60);
		        				
			        			表示内容_data = "暖房稼働合計:　" + 暖房稼働時間_時間 + "時間" + 暖房稼働時間_分 +"分<br>"
       							 + "冷房稼働合計:　" + 冷房稼働時間_時間 + "時間" + 冷房稼働時間_分 +"分<br>"
       							 + "除湿器稼働合計:　" + 除湿器稼働時間_時間 + "時間" + 除湿器稼働時間_分 +"分<br>"
       							 + "加湿器稼働合計:　" + 加湿器稼働時間_時間 + "時間" + 加湿器稼働時間_分 +"分<br>";
		        			}
		        					        			
		        		<%} finally {
		            	if (_pm != null && !_pm.isClosed())
		               	_pm.close();
		        		}%>
			        	
		        		
				        document.getElementById("例１表示場所").innerHTML = 表示内容_data;
				    }
				</script>

				<script>
				function PutMoveTime(){
					
					if(    document.date.year.selectedIndex == 0 ||
							document.date.month.selectedIndex == 0){
						var 表示内容_nodata = "表示する年と月を指定してください";
					    document.getElementById("例１表示場所").innerHTML = 表示内容_nodata;
					}
					else{
						var 表示内容_data = null;
			        	
			        	表示内容_data = "a"
			        	
			        		document.getElementById("例１表示場所").innerHTML = 表示内容_data;
						ファイル読込("otaru","asti",document.date.year.selectedIndex+2009,document.date.month.selectedIndex);
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
			ChangeTab('tab2');
		// -->
		</script>

	</tr>
</body>
</html>