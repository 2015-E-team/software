package wine;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@SuppressWarnings("serial")
public class AddDataServlet extends HttpServlet {

	// インスタンス保持用
	// このためクローズ処理を書いていないのだが
	// いいのだろうか？
	private PersistenceManager pm;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		ServletFileUpload fileUpload = new ServletFileUpload();
		try {
			FileItemIterator itemIterator = fileUpload.getItemIterator(req);
			while (itemIterator.hasNext()) {
				FileItemStream itemStream = itemIterator.next();
				InputStream inputStream = itemStream.openStream();
				String contentType = itemStream.getContentType();
				if (contentType == null) {
					contentType = "";
				}
				// 画像ファイルの時はそのまま書き出し処理
				if (contentType.contains("image")) {
					resp.setContentType(contentType);
					BufferedInputStream bi = new BufferedInputStream(
							inputStream);
					int len;
					while ((len = bi.read()) != -1) {
						resp.getOutputStream().write(len);
					}
					// テキストファイルの場合またはファイル名の拡張子が".csv"の場合
				} else if (contentType.contains("text")
						|| itemStream.getName().endsWith(".csv")) {
					resp.setContentType("text/html");
					BufferedReader buffer = new BufferedReader(new InputStreamReader(inputStream, "SJIS"));
					String line = null;
					int i = 0;
					while ((line = buffer.readLine()) != null) {
						String[] split = line.split(",");

						if (split != null && split.length == 4 && split[1].startsWith("2")) {
							// csvから日付の取り出し
							String key = split[0].trim();
							String date = split[1].trim();
							// csvから温度の取り出し
							double tem = Double.parseDouble(split[2].trim());
							// csvから湿度の取り出し
							int hum = Integer.parseInt(split[3].trim());

						//	System.out.println("地点: " + key + "日付: "+ date + "気温: " + tem + "hum: " + hum);
							
							// 登録するモデル
							SampleData data = new SampleData(key, date, tem, hum);
							if (pm == null) {
								pm = PMF.get().getPersistenceManager();
							}
							pm.makePersistent(data);
							i++;
						}
					}
					resp.setCharacterEncoding("UTF-8");
					resp.getWriter().write(i + "件登録しました。");
				} else {
					resp.setContentType("text/html");
					resp.setCharacterEncoding("UTF-8");
					resp.getWriter().write("ファイルを認識できません。");
				}
			}
		} catch (FileUploadException e) {
			resp.sendError(500);
		}
		resp.sendRedirect("./Kofu/test.jsp");
	}
}