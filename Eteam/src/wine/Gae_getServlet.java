package wine;

import java.io.*;
import java.util.List;
import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Gae_getServlet extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from " + SampleData.class.getName();
		List<SampleData> datas = (List<SampleData>) pm.newQuery(query).execute();
		Writer out = resp.getWriter();
		out.write("<table border=2>");
		out.write("<tr><th>ID</th><th>Message</th><th>Account</th><th>Date</th></tr>");
		for(SampleData data : datas){
			out.write("<tr>");
			out.write("<td>" + data.getId() + "</td>");
			out.write("<td>" + data.getMessage() + "</td>");
			out.write("<td>" + data.getAccount() + "</td>");
			out.write("<td>" + data.getDate() + "</td>");
			out.write("</tr>");
		}
		out.write("</table>");
	}
}