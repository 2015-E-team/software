package wine;

import javax.jdo.annotations.*;

//JDOによる永続化可能クラスと認識されるようになる
@PersistenceCapable(identityType = IdentityType.APPLICATION)

public class SampleData {
	
	//フィールド名の前につける．永続化されることを示す
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//自動割付されるID番号(Long値)プライマリーキーとして使うもの
	
	private String key;

	//プライマリキーであることを示すもの．フィールドの名の前につける
	@PrimaryKey
	private String date;
	
	@Persistent
	private double tem;
	
	@Persistent
	private int hum;
	
	public SampleData(){}
	
	public SampleData(String key, String date, double tem, int hum){
		this.key = key;
		this.date = date;
		this.tem = tem;
		this.hum = hum;
	}
	
	public String getKey(){
		return key;
	}
	
	public String getDate(){
		return date;
	}
	
	public double getTem(){
		return tem;
	}
	
	public int getHum(){
		return hum;
	}
	
	public void setKey(String key){
		this.key = key;
	}
	public void setDate(String date){
		this.date = date;
	}

	public void setTem(float tem){
		this.tem = tem;
	}
	
	public void setHum(int hum){
		this.hum = hum;
	}
	
}