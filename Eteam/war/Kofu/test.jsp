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
<title>otaru_tem</title>

	<!--Load the AJAX API-->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
   	<script type="text/javascript">
   	
	// corechart パッケージを読み込む
  	google.load('visualization', '1.0', {'packages':['corechart']});
	
  	// このページが読み込まれた時に drawChart を呼び出す
  	google.setOnLoadCallback(drawChart);
  	
 	// drawChart 関数
 	function drawChart() {
         // データテーブルの生成と、要素の代入
        var data = new google.visualization.DataTable([]);
        data.addColumn('date', 'ひづけ');
        data.addColumn('tem', 'おんど');
        
        data.addRows([
		<%
		PersistenceManager pm = null;
		try {
    		pm = PMF.get().getPersistenceManager();
    		Query query = pm.newQuery(SampleData.class);
    		List<SampleData> datas = (List<SampleData>) query.execute();
			// すべてのエンティティの表示
			for (SampleData data : datas) {
		%>
      			['<%= data.getDate() %>', <%= data.getTem() %>],
			<%
    		}
		} finally {
    	if (pm != null && !pm.isClosed())
       	pm.close();
		}
		%>

        ]);
                
       	 // グラフのタイトル、サイズなどの option 設定
        var options = {'title':'otaru_tem',
                       'width':400,
                       'height':300};
      	 // グラフの実体 chart を生成。id は chart_div
     	 var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      	 // draw() メソッドは必ず呼ぶ
        chart.draw(data, options);
 	 }
 	</script>

</head>
<body>

    <!-- グラフの id を指定して描画 -->
    <div id="chart_div"></div>

</p>

</body>
</html>