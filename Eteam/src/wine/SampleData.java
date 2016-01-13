package wine;

import java.util.Date;
import javax.jdo.annotations.*;

//JDOによる永続化可能クラスと認識されるようになる
@PersistenceCapable(identityType = IdentityType.APPLICATION)

public class SampleData {

	//プライマリキーであることを示すもの．フィールドの名の前につける
	@PrimaryKey
	
	//フィールド名の前につける．永続化されることを示す
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//自動割付されるID番号(Long値)プライマリーキーとして使うもの
	private Long id;
	
	//簡単なメッセージを保管するもの
	@Persistent
	private String message;
	
	//メッセージを記入した人のアカウント名を保管するもの
	@Persistent
	private String account;
	
	//メッセージを保管した日時を保管するもの
	@Persistent
	private Date date;
	
	public SampleData(){}
	
	public SampleData(String message, String account, Date date){
		this.message = message;
		this.account = account;
		this.date = date;
	}
	

	public Long getId(){
		return id;
	}
	
	public String getMessage(){
		return message;
	}
	
		public void setMessage(String message){
		this.message = message;
	}

	public String getAccount(){
		return account;
	}
	
	public void setAccount(String account){
		this.account = account;
	}
	
	public Date getDate(){
		return date;
	}
}

