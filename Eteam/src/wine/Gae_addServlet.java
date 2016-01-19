package wine;

import javax.jdo.*;
import java.io.IOException;
import java.util.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Gae_addServlet extends HttpServlet {

	public void doGet(HttpServletRequest req,
			HttpServletResponse resp)
					throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("can not access!!");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse resp)
					throws IOException {
		request.setCharacterEncoding("UTF-8");
		String message = request.getParameter("message");
		String account = request.getParameter("account");
		Date date = Calendar.getInstance().getTime();
//		SampleData data = new SampleData(message,account,date);
		
		//PMF.getを呼び出し、MersistenceManagerFactoryインスタンスを取得
		//ここから一切に永続化の操作を行うPersistenceManagerクラスのインスタンスを取り出す
		PersistenceManagerFactory pmf = PMF.get();
		PersistenceManager pm = pmf.getPersistenceManager();
		
		//保存する
		try {
//			pm.makePersistent(data);
		} finally {
			pm.close();
		}
		resp.sendRedirect("./Kofu/test.jsp");
	}
}