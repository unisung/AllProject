package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Member;

public class MemberDao {
	Connection  conn;
	DataSource ds;
	private Connection getConnection() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}//getConnection()끝.

	public int insertMember(Member member){
 /*       		System.out.println(member.getId());
        		System.out.println(member.getName());
        		System.out.println(member.getPassword());
        		System.out.println(member.getReg_date());*/
	 int result=0;  
	//1.db 연결맺기 	
	 conn = getConnection();
	 PreparedStatement pstmt = null;
	 String sql = "insert into members(id,password,name,reg_date) values(?,?,?,sysdate)";
	 try {
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, member.getId());
		    pstmt.setString(2, member.getPassword());
		    pstmt.setString(3, member.getName());
		    //pstmt.setDate(4, member.getReg_date());
		    //insert처리되면 insert된 행의수가 리턴.
		    result = pstmt.executeUpdate();
	 }catch(Exception e) {
		 System.out.println(e.getMessage());
	 }finally {
		 try {
				 pstmt.close();
				 conn.close();
		 }catch(Exception e) {}
	 }
	 return result;
	}//insertMember() 끝.
	
	//result 가 1이면 id,패스워드 존재, 0이면 패스워드가 틀림, -1이면 id가 없음.
	public int userCheck(String id,String password){
		int result=0;
		//db연결
		conn = getConnection();
		String sql = "select password from members where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			//rs.next()가 참이면(id와 패스워드가 존재하면)
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					 result = 1;//패스워드와 id가 일치하는 경우
				}else {
					 result = 0;
				}
			}else {//id도 없는 경우
				result = -1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}//userCheck() 끝.
	
	//아이디 중복체크
	public int conFirmId(String id) {
		int result=-1;
		String sql="select count(*) from members where id=?";
		try {
			 conn=getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);
			 ResultSet rs = pstmt.executeQuery();
			 if(rs.next()) {
				 result = rs.getInt(1);
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}//conFirmId()메소드 끝.
}