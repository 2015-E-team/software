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
	 
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
    google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(drawChart);

  function drawChart() {

    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Day');
    data.addColumn('number', 'Tem');

    data.addRows([
          		<%
        		PersistenceManager pm = null;
          		int i = 0;
        		try {
            		pm = PMF.get().getPersistenceManager();
            		Query query = pm.newQuery(SampleData.class);
            		List<SampleData> datas = (List<SampleData>) query.execute();
        			// すべてのエンティティの表示
        			for (SampleData da : datas) {
        		%>
              			['<%= da.getDate() %>', <%= da.getTem() %>],
        			<%
        			i++;
              	if(i == 6)
              		break;
            		}
        		} finally {
            	if (pm != null && !pm.isClosed())
               	pm.close();
        		}
        		%>
        		
    ]);

    var options = {
      chart: {
        title: 'otaru',
        subtitle: 'tem'
      },
      width: 900,
      height: 500
    };

    var chart = new google.charts.Line(document.getElementById('chart_div'));

    chart.draw(data, options);
  }
    </script>
</head>
<body>
	<a href="Kofu_tmp.jsp">トップ</a>
    <!-- グラフの id を指定して描画 -->
    <div id="chart_div"></div>


</body>
</html>