package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Cart;
/* 싱글톤 처리 */
public class CartDao {	
	private static CartDao instance;
	private CartDao() {}
	public static CartDao getInstance() {
		if(instance==null) instance=new CartDao();
		return instance;
	}
	//DB접속 메소드
	public Connection getConnection() throws Exception{
		   Connection conn=null;
		   Context init = new InitialContext();
		   DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
		   conn = ds.getConnection();
		   return conn;
	}//DB연결 메소드 끝.
	
	//[장바구니 담기]처리 메소드
	public int insertCart(Cart cart){
		int result = 0;
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql2 = "select count(*) from cart where buyer=? and book_id=?";
		String sql3="update cart set buy_count=buy_count+? where buyer=? and book_id=?";
		String sql = "insert into "
				      + " cart(cart_id,book_id, buyer,book_title,buy_price,"
				      + "        buy_count,book_image) "
				      + " values(cart_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			   conn = getConnection();//DB연결 맺기
			   //동일상품 존재 여부확인
			   pstmt = conn.prepareStatement(sql2);
			   pstmt.setString(1, cart.getBuyer());
			   pstmt.setInt(2,cart.getBook_id());
			   rs = pstmt.executeQuery();
			   if(rs.next()) {
				   if(rs.getInt(1)>0) {
					   pstmt = conn.prepareStatement(sql3);
					   
					   pstmt.setInt(1, cart.getBuy_count());
					   pstmt.setString(2, cart.getBuyer());
					   pstmt.setInt(3, cart.getBook_id());
					   
					   result = pstmt.executeUpdate();
				   }else {
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, cart.getBook_id());//book_id
			   pstmt.setString(2, cart.getBuyer());//구매자 id
			   pstmt.setString(3, cart.getBook_title());//제목
			   pstmt.setInt(4, cart.getBuy_price());//구매가격
			   pstmt.setInt(5, cart.getBuy_count());//구매수량
			   pstmt.setString(6, cart.getBook_image());//표지 이미지
			   result = pstmt.executeUpdate();//입력처리 실행 결과 리턴
				   }
			   }
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally 끝.
		return result;
	}//insertCart()메소드 끝.
	
	//구매건수 확인 메소드
	public int getListCount(String buyer){
		int count = 0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "select count(*) from cart where buyer=?";
		try {
			      conn=getConnection();//DB연결 맺기
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setString(1,buyer);
			      rs = pstmt.executeQuery();
			      if(rs.next())
			    	  count = rs.getInt(1);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally  끝.
		return count;
	}//getListCount()메소드 끝.
	
	//카트 리스트 구하기
	public ArrayList<Cart> getCartList(String buyer){
		ArrayList<Cart> list = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql="select * from cart where buyer=?";
		try {
			    conn = getConnection();//DB연결 맺기
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, buyer);
			    rs = pstmt.executeQuery();
			    while(rs.next()) {
			    	int i=0;
			    	
			    	Cart cart = new Cart();
			    	cart.setCart_id(rs.getInt(++i));
			    	cart.setBuyer(rs.getString(++i));
			    	cart.setBook_id(rs.getInt(++i));
			    	cart.setBook_title(rs.getString(++i));
			    	cart.setBuy_price(rs.getInt(++i));
			    	cart.setBuy_count(rs.getInt(++i));
			    	cart.setBook_image(rs.getString(++i));
			    	
			    	list.add(cart);
			    }
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally 끝.
		return list;
	}//getCartList()메소드 끝.
	
	//cart상품 수량 수정 메소드
	public int updateCount(int cart_id,int buy_count){
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = "update cart set buy_count = ? where cart_id=?";
		try {
				conn = getConnection();//DB연결맺기
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, buy_count);
				pstmt.setInt(2, cart_id);
				result =pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally 끝.
		return result;
	}//updateCount() 메소드 끝.
	
	//카트 전체내용비우기 메소드
	public int deleteAll(String buyer){
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql = "delete from cart where buyer=?";
		try {
			      conn=getConnection();//DB연결맺기
			      pstmt = conn.prepareStatement(sql);
			      pstmt.setString(1, buyer);
			      result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally 끝.
		return result;
	}//deleteAll() 메소드 끝.
	
	//특정 카트번호의 정보삭제처리 메소드
	public int deleteCart(int list){
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from cart where cart_id=?";
		try {
				conn=getConnection();//DB연결 맺기
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, list);
				result=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally 끝.
		return result;
	}//deleteCart()메소드 끝.
	
}
