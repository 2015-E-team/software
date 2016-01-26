package wine;

import java.util.Date;

import javax.jdo.annotations.*;

//JDOによる永続化可能クラスと認識されるようになる
@PersistenceCapable(identityType = IdentityType.APPLICATION)

public class SampleData {
	
	//フィールド名の前につける．永続化されることを示す
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	//自動割付されるID番号(Long値)プライマリーキーとして使うもの
	private Long key;
	
	@Persistent
	private String name;

	//プライマリキーであることを示すもの．フィールドの名の前につける
	@Persistent
	private String date;
	
	@Persistent
	private double tem;
	
	@Persistent
	private int hum;
	
	@Persistent
	private Date r_date;
	
	public SampleData(){}
	
	public SampleData(String name, String date, double tem, int hum, Date r_date){
		this.name = name;
		this.date = date;
		this.tem = tem;
		this.hum = hum;
		this.r_date = r_date;
	}
	
	public String getName(){
		return name;
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
	
	public Date getR_Date(){
		return r_date;
	}
	
	public void setName(String name){
		this.name = name;
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
	
	public void setR_Date(Date r_date){
		this.r_date = r_date;
	}
}

