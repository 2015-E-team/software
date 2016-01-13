package wine;

import java.io.*;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Gae_delServlet extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		String query = "select from " + SampleData.class.getName();
		List<SampleData> datas = (List<SampleData>) pm.newQuery(query).execute();

		pm.deletePersistent(datas);
	}
}