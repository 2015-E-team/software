package wine;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.jdo.Query;

@SuppressWarnings("serial")
public class Data_GetServlet extends HttpServlet{
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		PersistenceManager pm = null;
		if(pm == null)
			pm = PMF.get().getPersistenceManager();
		Query query = pm.newQuery(SampleData.class);
		List<SampleData> datas = (List<SampleData>) pm.newQuery(query).execute();
		
		req.setAttribute("_datas", datas);
		
		RequestDispatcher rd = req.getRequestDispatcher("../../war/Kofu/test.jsp");
		
		try{
			rd.forward(req, resp);
		} catch (ServletException e){
			e.printStackTrace();
		}
	}

}
