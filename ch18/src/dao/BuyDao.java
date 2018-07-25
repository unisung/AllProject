package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Bank;
import model.Buy;
import model.Cart;

/* 싱글톤 처리*/
public class BuyDao {
	private static BuyDao instance;//필드
	private BuyDao() {}//생성자
	public static BuyDao getInstance() {
		if(instance==null) instance=new BuyDao();
		return instance;
	}
	//Connection 객체 리턴 메소드
	public Connection getConnection() throws Exception {
		   Connection conn=null;
		   Context init = new InitialContext();
		   DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
		   conn = ds.getConnection();
		   return conn;
	}//getConnection()메소드 끝.
	
	//계정 정보 조회메소드
	public ArrayList<Bank> getAccount(){
		ArrayList<Bank> list = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bank order by account";
		try {
			   conn = getConnection();//DB연결 맺기
			   pstmt=conn.prepareStatement(sql);
			   rs = pstmt.executeQuery();
			   while(rs.next()) {
				   	int i=0;
				   	Bank bank = new Bank();
				      bank.setAccount(rs.getString(++i));
				      bank.setBank(rs.getString(++i));
				      bank.setName(rs.getString(++i));
				   
				   list.add(bank);
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
	}//getAccount()메소드 끝.
	 
	//구매처리 메소드
	 public int insertBuy(List<Cart> list,Buy buy){
		 int result =0;
		 Connection conn=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 String buySql="insert into buy (buy_id,buyer, book_id,book_title, buy_price, "
		 		           + " buy_count, book_image, buy_date, account, deliveryname, "
		 		           + " deliverytel, deliveryaddress) "
		 		           + " values(buy_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";//결제 입력
		 String bookcountsql ="select nvl(book_count,0) from book where book_id=?";//현재고 출력
		 String bookCountUpSql="update book set book_count=? where book_id=?";//재고 조정
		 String delCartSql="delete from cart where buyer=?";//로그인한 id로 삭제
		 
		 try {
			 	 conn = getConnection();//DB연결맺기
			 	 conn.setAutoCommit(false);// 자동 commit기능 비활성화
			 	 
			for(int j=0;j<list.size();j++) {
					Cart cart = list.get(j);
			 	 pstmt = conn.prepareStatement(buySql);
			 	 int i=0;
			 	 pstmt.setString(++i, cart.getBuyer());
			 	 pstmt.setInt(++i,     cart.getBook_id() );
			 	 pstmt.setString(++i, cart.getBook_title());
			 	 pstmt.setInt(++i,     cart.getBuy_price());
			 	 pstmt.setInt(++i,     cart.getBuy_count());
			 	 pstmt.setString(++i, cart.getBook_image());
			 	 pstmt.setDate(++i, new java.sql.Date(new java.util.Date().getTime()));///
			 	 pstmt.setString(++i, buy.getAccount());
			 	 pstmt.setString(++i, buy.getDeliveryname());
			 	 pstmt.setString(++i, buy.getDeliverytel());
			 	 pstmt.setString(++i, buy.getDeliveryaddress());

			 	  pstmt.executeUpdate();
			 	  
			 	  //상품구매처리 후 book테이블의 재고 조정
			 	  //현재고 - 구매수량 = 변경수량
			 	  pstmt.close();
			 	  pstmt = conn.prepareStatement(bookcountsql);
			 	  pstmt.setInt(1, cart.getBook_id());
			 	   rs = pstmt.executeQuery();
			 	  int currentQty=0;
			 	  if(rs.next()) {
			 		 currentQty = rs.getInt(1);//현재고 수량
			 	  }
			      //변경수량 : cruurentQty - buy.getbuy_count
			 	  pstmt.close();
			 	  pstmt = conn.prepareStatement(bookCountUpSql);
			 	  pstmt.setInt(1, currentQty - cart.getBuy_count()); 
			 	  pstmt.setInt(2, cart.getBook_id());
			 	  pstmt.executeUpdate();
			 }//list 반복문 끝.(구매테이블에 저장 처리)
			 //장바구니 비우기 처리
			  pstmt.close();
			  pstmt = conn.prepareStatement(delCartSql);
			  pstmt.setString(1, buy.getBuyer());
			  
			  pstmt.executeUpdate();
			  
			  //정상처리시 DB에 저장처리
			 	conn.commit();
			    conn.setAutoCommit(true);//자동 commit기능 활성화
			    result = 1;//정상 처리되었으면 result값을 1로 처리
		 }catch(Exception e) {
			 try {
			 conn.rollback();
			 }catch(Exception ie) {
				 System.out.println(ie.getMessage());
			 }
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
		 return result;
	 }//insertBuy()메소드 끝.
	 
	 //구매건수 확인 메소드
	 public  int getBuyListCount(String buyer){
		  int count=0;
		  Connection conn=null;
		  PreparedStatement pstmt=null;
		  ResultSet rs = null;
		  String sql = "select count(*) from buy where buyer=?";
		 try {
			     conn = getConnection();//DB연결 맺기
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
		 }//finally 끝.
		  return count;
	 }//getBuyListCount()메소드 끝.
	 
	 //구매목록 정보 리스트 구하기 메소드
	 public  ArrayList<Buy> getBuyList( String buyer){
		 ArrayList<Buy> list = new ArrayList<>();
		 Connection conn=null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 String sql = "select buy_id, book_id, book_title, buy_price, buy_count, "
		 		       + " book_image, sanction from buy where buyer=?";
		 try {
			 	   conn = getConnection();//DB연결 맺기
			 	   pstmt = conn.prepareStatement(sql);
			 	   pstmt.setString(1, buyer);
			 	   rs = pstmt.executeQuery();
			 	   while(rs.next()) {
			 		   int i=0;

			 		   Buy buy = new Buy();
			 		   buy.setBuy_id(rs.getInt(++i));
			 		   buy.setBook_id(rs.getInt(++i));
			 		   buy.setBook_title(rs.getString(++i));
			 		   buy.setBuy_price(rs.getInt(++i));
			 		   buy.setBuy_count(rs.getInt(++i));
			 		   buy.setBook_image(rs.getString(++i));
			 		   buy.setSanction(rs.getString(++i));
			 		   
			 		    list.add(buy);
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
	 }//getBuyList()메소드 끝.
	 
	 
	 //구매목록 정보 리스트 구하기 메소드
	 public  ArrayList<Buy> getBuyList( String buyer,int startRow,int endRow){
		 ArrayList<Buy> list = new ArrayList<>();
		 Connection conn=null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 String sql = "select buy_id, book_id, book_title, buy_price, buy_count,"
		 		       + " book_image, sanction"  
		 		       + " from " 
		 		       +" (select rownum rn, a.* from " 
		 		       +" (select * from buy where buyer=? order by buy_id)a) " 
		 		       +" where rn between ? and ?";
		 try {
			 	   conn = getConnection();//DB연결 맺기
			 	   pstmt = conn.prepareStatement(sql);
			 	   pstmt.setString(1, buyer);
			 	   pstmt.setInt(2, startRow);
			 	   pstmt.setInt(3, endRow); 
			 	   rs = pstmt.executeQuery();
			 	   while(rs.next()) {
			 		   int i=0;

			 		   Buy buy = new Buy();
			 		   buy.setBuy_id(rs.getInt(++i));
			 		   buy.setBook_id(rs.getInt(++i));
			 		   buy.setBook_title(rs.getString(++i));
			 		   buy.setBuy_price(rs.getInt(++i));
			 		   buy.setBuy_count(rs.getInt(++i));
			 		   buy.setBook_image(rs.getString(++i));
			 		   buy.setSanction(rs.getString(++i));
			 		   
			 		    list.add(buy);
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
	 }//getBuyList()메소드 끝.
	 
	 
	   //Admin영역에서 조회하는 구매목록 정보 리스트 구하기 메소드
		 public  ArrayList<Buy> getBuyList(int startRow,int endRow){
			 ArrayList<Buy> list = new ArrayList<>();
			 Connection conn=null;
			 PreparedStatement pstmt = null;
			 ResultSet rs = null;
			 String sql = "select buy_id, book_id, book_title, buy_price, buy_count,"
			 		       + " book_image, sanction"  
			 		       + " from " 
			 		       +" (select rownum rn, a.* from " 
			 		       +" (select * from buy order by buy_id)a) " 
			 		       +" where rn between ? and ?";
			 try {
				 	   conn = getConnection();//DB연결 맺기
				 	   pstmt = conn.prepareStatement(sql);
				 	   pstmt.setInt(1, startRow);
				 	   pstmt.setInt(2, endRow); 
				 	   rs = pstmt.executeQuery();
				 	   while(rs.next()) {
				 		   int i=0;

				 		   Buy buy = new Buy();
				 		   buy.setBuy_id(rs.getInt(++i));
				 		   buy.setBook_id(rs.getInt(++i));
				 		   buy.setBook_title(rs.getString(++i));
				 		   buy.setBuy_price(rs.getInt(++i));
				 		   buy.setBuy_count(rs.getInt(++i));
				 		   buy.setBook_image(rs.getString(++i));
				 		   buy.setSanction(rs.getString(++i));
				 		   
				 		    list.add(buy);
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
		 }//getBuyList()메소드 끝.
		 
		 
	 //전체 구매 건수 조회 메소드
	 public int getBuyListCount(){
		 int count =0;
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 String sql = "select count(*) from buy order by buy_id,book_id";
		 try {
			      conn = getConnection();//DB연결 맺기
			      pstmt = conn.prepareStatement(sql);
			      rs = pstmt.executeQuery();
			      if(rs.next())
			    	  count = rs.getInt(1);//전체 구매 건수 값 
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
		 return count;
	 }//getBuyListCount() 메소드 끝.
	 
	 //전체 구매리스트 내역 조회 메소드
	 public ArrayList<Buy> getBuyList(){
		 ArrayList<Buy> list = new ArrayList<>();//
		 Connection conn=null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 String sql ="select * from buy order by buy_id,book_id";
		 try {
			     conn = getConnection();//DB연결 맺기
			     pstmt =conn.prepareStatement(sql);
			     rs = pstmt.executeQuery();
			    while(rs.next()) {
			    	int i=0;
			    	Buy buy = new Buy();
			    	
			    	 buy.setBuy_id(rs.getInt(++i));
			    	 buy.setBuyer(rs.getString(++i));
			    	 buy.setBook_id(rs.getInt(++i));
			    	 buy.setBook_title(rs.getString(++i));
			    	 buy.setBuy_price(rs.getInt(++i));
			    	 buy.setBuy_count(rs.getInt(++i));
			    	 buy.setBook_image(rs.getString(++i));
			    	 buy.setBuy_date(rs.getDate(++i));
			    	 buy.setAccount(rs.getString(++i));
			    	 buy.setDeliveryname(rs.getString(++i));
			    	 buy.setDeliverytel(rs.getString(++i));
			    	 buy.setDeliveryaddress(rs.getString(++i));
			    	 buy.setSanction(rs.getString(++i));
			    	 
			    	list.add(buy); 
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
	 }//getBuyList()메소드 끝.
	 
	 //상품 배송 상태 처리 메소드
	 public  int updateOrderStatus(int buy_id, String status){
		  int result = 0;
		  Connection conn = null;
		  PreparedStatement pstmt =null;
		  String sql = "update buy set sanction=? where buy_id=?";
		  try {
			  		conn = getConnection();//DB연결 맺기
			  		pstmt = conn.prepareStatement(sql);
			  		pstmt.setString(1, status);
			  		pstmt.setInt(2, buy_id);
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
	 }//updateOrderStatus() 메소드 끝.
}









