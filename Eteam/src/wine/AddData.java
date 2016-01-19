package wine;

import wine.PMF;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.jdo.PersistenceManager;

public class AddData extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		try {
			//ファイルを読み込む
			FileReader fr = new FileReader("/kkihome/home/t13cs051/git/software/Eteam/war/data.csv");
			BufferedReader br = new BufferedReader(fr);

			//読み込んだファイルを１行ずつ処理する
			String line;
			StringTokenizer token;
			String key = null, date = null;
			double tem = 0;
			int hum = 0;
			while ((line = br.readLine()) != null) {
				//区切り文字","で分割する
				token = new StringTokenizer(line, ",");

				//分割した文字を画面出力する
				while (token.hasMoreTokens()) {
//					System.out.println(token.nextToken());
					for(int i = 0; i < 4; i++){
						if(i == 0)
						    key = token.nextToken();
						else if(i == 1)
							date = token.nextToken();
						else if(i == 2)
							tem = Double.parseDouble(token.nextToken());
						else if(i == 3)
							hum = Integer.parseInt(token.nextToken());
					}
					SampleData data = new SampleData(key, date, tem, hum);
					
			    	PersistenceManager pm = PMF.get().getPersistenceManager();
		        	try {
		        		pm.makePersistent(data);
		        	} finally {
		        		pm.close();
		        	}
				}
//				System.out.println("**********");
			}

			//終了処理
			br.close();

		} catch (IOException ex) {
			//例外発生時処理
			ex.printStackTrace();
		}
	}
}
