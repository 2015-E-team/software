package wine;

import java.io.FileReader;
import java.io.BufferedReader;
import java.util.StringTokenizer;
import java.io.IOException;

public class ReadData {

	public static void main(String args[]) {

		try {
			//ファイルを読み込む
			FileReader fr = new FileReader("/kkihome/home/t13cs051/git/software/Eteam/war/data.csv");

			BufferedReader br = new BufferedReader(fr);

			//読み込んだファイルを１行ずつ処理する
			String line;
			StringTokenizer token;
			while ((line = br.readLine()) != null) {
				//区切り文字","で分割する
				token = new StringTokenizer(line, ",");

				//分割した文字を画面出力する
				while (token.hasMoreTokens()) {
					System.out.println(token.nextToken());
				}
				System.out.println("**********");
			}

			//終了処理
			br.close();

		} catch (IOException ex) {
			//例外発生時処理
			ex.printStackTrace();
		}
	}

}
