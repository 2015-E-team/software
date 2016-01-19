package wine;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@SuppressWarnings("serial")
public class GetDataServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		PersistenceManager pm = null;
		// 更新日付が新しい順に上から表示する
		String query = "select from " + SampleData.class.getName() + " order by updateTime desc";

		if (pm == null) {
		pm = PMF.get().getPersistenceManager();
		}

		List<SampleData> datas = (List<SampleData>) pm.newQuery(query).execute();

		req.setAttribute("datas", datas);

		RequestDispatcher rd = req.getRequestDispatcher("./kofu/test.jsp");

		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}
}