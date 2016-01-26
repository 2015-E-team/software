<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	int end = 744; 
	String str = request.getParameter("end");
	String next = request.getParameter("next");
	String pre = request.getParameter("pre");
	
	String _year = request.getParameter("year");
	String _month = request.getParameter("month");
	String _day = request.getParameter("day");
	String _hour = request.getParameter("hour");
		
	if(_year != null && _month != null && _day != null && _hour != null){
 		end = (Integer.parseInt(_day) - 1) * 24 + Integer.parseInt(_hour) + 744;
 		if(end >= 1482)
			end = 1482;
	}
		
	if( str != null && next != null )
		if(Integer.parseInt(str) < 1482)
			end = Integer.parseInt(str) + 6;
		else 
			end = 1482;
	
	if( str != null && pre != null ){
		if(Integer.parseInt(str) >= 750)
			end = Integer.parseInt(str) - 6;
		else 
			end = 744;
	}
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>otaru_tem</title>

	<!--Load the AJAX API-->

	
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        
    google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
    	var data = new google.visualization.DataTable();
    	data.addColumn('string', 'Day');
    	data.addColumn('number', 'Otaru_Tem')
    	data.addColumn('number', 'Asti_Tem');
    	data.addRows([
          		<%
          		PersistenceManager pm = null;
          		int i = 0;
          		//一時的に格納した、温度を取り出すときに回す変数
          		int tem_count = 0;
          		//一時的に、温度を格納する配列
          		ArrayList<Double> asti_tem= new ArrayList<Double>();
          		
          		try {
            		pm = PMF.get().getPersistenceManager();
            		Query query = pm.newQuery(SampleData.class);
            		query.setOrdering("r_date asc");
            		List<SampleData> datas = (List<SampleData>) query.execute();
        			// すべてのエンティティの表示
        			for (SampleData da : datas) {
                	if(i == end + 6)
              		break;
					if(da.getName().equals("asti")){
						double tmp = (da.getTem() - 32) / 1.8;
						asti_tem.add(tmp);
					}
                	
                	if(da.getDate() == "2014/1/1 00:00:00")
                		end = 744;                		
					

					if(i >= end){
						if(da.getName().equals("otaru")){%>
							['<%= da.getDate() %>', <%=asti_tem.get(tem_count)%>, <%=da.getTem()%>],
							<%tem_count++;
						}
					}

       			i++;
            		}
        		} finally {
            	if (pm != null && !pm.isClosed())
               	pm.close();
        		}
        		%>
        		
    	]);
	    
	    var options = {
	    		chart: {title: ' ', subtitle: ' '},
        		width: 1259,height: 700,
        		vAxis: {minValue: -20, maxValue: 50}
        		};

	    var chart = new google.charts.Line(document.getElementById('chart_div'));

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
	margin: 0px;
	padding: 0px;
	width: 1263px;
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


p.tabs b {
	display: block;
	width: 5em;
	float: left;
	margin: 0px 1px 0px 0px;
	padding: 3px;
	text-align: center;
	border-radius: 12px 12px 0px 0px; /* 角を丸くする */
}

p.tabs b.tab1 {
	background-color: gray;
	color: black;
}

g.tabs b.tab2 {
	background-color: gray;
	color: black;
}

p.tabs a:hover {
	color: yellow;
}

/* タブ中身のボックス */
div.tab {
	height: 815px;
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

div#tab4 {
	border: 2px solid gray;
	background-color: gray;
}

div#tab5 {
	border: 2px solid gray;
	background-color: gray;
}


div.tab p {
	margin: 0.5em;
}
-->

    
</style>

</head>
<body>
	<a href="../index.html">トップ</a>
	<tr>
		<th><a href="../Otaru/Otaru_tmp.jsp">小樽</a></th>
		<th><a href="../Nigata/Nigata_tmp.jsp">新潟</a></th>
		<th>甲府</th>
		<th><a href="../Nara/Nara_tmp.jsp">奈良</a></th>
		<th><a href="../Naha/Naha_tmp.jsp">那覇</a></th>
		<th><a href="../help/help_top.jsp">ヘルプ</a></th>
	</tr>
	<tr>
		<div class="tabbox">
			<p class="tabs">
				<a href="#tab1" class="tab1" onclick="ChangeTab('tab1'); return false;">温度</a>
				<a href="#tab2" class="tab2" onclick="ChangeTab('tab2'); return false;">湿度</a>
				<a href="#tab3" class="tab3" onclick="ChangeTab('tab3'); return false;">稼働状況</a>
			</p>

			<div id="tab1" class="tab">
				<p>(タブ1の中身。何でも記述できます。)</p>
				<p>
				<form name="f">
					<input type="hidden" name="start" value="<%=start%>">
					<select name="year" size="1" onChange="change(this)">
						<OPTION VALUE="">------------
						<% int year = 2014;%>
						<option value="<%= year%>"><%= year%>

					</select>
					年
						
					<select name="month" size="1" onChange="change(this)">
					<OPTION VALUE="">------------
					<% for(int month = 1; month <= 12; month++) {%>
					<option value="<%= month%>"><%= month%>
					<% }%>
					</select>	
					月
					
					<select name="day" size="1" onChange="change(this)">
					<OPTION VALUE="">------------
					<% for(int day = 1; day <= 31; day++) {%>
					<option value="<%= day%>"><%= day%>
					<% }%>
					</select>	
					日
					
					<select name="hour" size="1" onChange="change(this)">
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
              <div id="chart_div"></div>			
					<form name="f">
						<input type="hidden" name="end" value="<%=end%>">
						<input type="submit" value="pre" name="pre">
						<input type="submit" value="next" name="next">
					</form>
				</p>
			</div>

			<div id="tab2" class="tab">
			<p>(タブ2の中身。HTMLタグも記述可能です。)</p>
			</div>

			<div id="tab3" class="tab">
				<p>
				<form name = "y">
					<select name="product" size="1" onChange="change(this)">
						<OPTION VALUE="">------------
						<% for(int j = 2016; j < 2100; j++) {%>
						<option value="<%= j%>"><%= j%>
						<% }%>
					</select>
					年
						
					<select name="product" size="1" onChange="change(this)">
					<OPTION VALUE="">------------
					<% for(int j = 1; j <= 12; j++) {%>
					<option value="<%= j%>"><%= j%>
					<% }%>
					</select>
					月　の稼働状況<br>					
					アスティの気候データに合わせています<br><br>
					
				</form>
				</p>
			</div>
	
			<script type="text/javascript">
			// デフォルトのタブを選択
			ChangeTab('tab1');
			</script>
		</div>	
	</tr>
</body>
</html>