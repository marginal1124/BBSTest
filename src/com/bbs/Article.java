package com.bbs;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

//封装一个实体类
public class Article {

	//自己的id
	private  int id;
	//父类id
	private  int pid;
	
	private  int rootId;
	private  String title;
	private  String count;
	private  Date pdate;
	private int grade;
	private  boolean  isLeaf;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getRootId() {
		return rootId;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public boolean isLeaf() {
		return isLeaf;
	}
	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public  void innitFormRs(ResultSet rs){
		
		try {
			setId(rs.getInt("id"));
			setPid(rs.getInt("pid"));
			setRootId(rs.getInt("rootid"));
			setTitle(rs.getString("title"));
			setLeaf(rs.getInt("isleaf")==0?true:false);
			setPdate(rs.getTimestamp("pdate"));
			setCount(rs.getString("cont"));
			setGrade(0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

