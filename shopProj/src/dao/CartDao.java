package dao;

import java.util.ArrayList;
import java.util.List;

import model.Cart;
import service.CartService;

public class CartDao extends DaoManger implements CartService {
	 public static CartDao instance;
	 private CartDao() {}
	 public static CartDao getInstance() {
		 if(instance==null) instance = new CartDao();
		 return instance;
	 }
	 
	//[장바구니담기]처리 메소드
	@Override
	public int insertCart(Cart cart) {
		int result=0;
		String sql="select count(*) from cart where buyer=? and book_id=?";
		String sql2="update cart set buy_count=buy_count+? where buyer=? and book_id=?";
		String sql3=" insert into cart(" + 
				   " cart_id," + 
				   " buyer," + 
				   " book_id," + 
				   " book_title," + 
				   " buy_price," + 
				   " buy_count," + 
				   " book_image " + 
				   " ) values(cart_seq.nextval,?,?,?,?,?,?)"; 
		try {
			 conn = getConnection();
			 conn.setAutoCommit(false);
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, cart.getBuyer());
			 pstmt.setInt(2, cart.getBook_id());
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 if(rs.getInt(1)>0) {//장바구니에 상품이 있으면 update
					 pstmt = conn.prepareStatement(sql2);
					 pstmt.setInt(1, cart.getBuy_count());
					 pstmt.setString(2, cart.getBuyer());
					 pstmt.setInt(3, cart.getBook_id());
					 result = pstmt.executeUpdate();
				 }else {//장바구니에 상품이 없으면 insert
					 pstmt = conn.prepareStatement(sql3);
					 pstmt.setString(1, cart.getBuyer());//구매자 id
					 pstmt.setInt(2, cart.getBook_id());//book_id
					 pstmt.setString(3, cart.getBook_title());//북 타이틀
					 pstmt.setInt(4,cart.getBuy_price());//구매가격
					 pstmt.setInt(5, cart.getBuy_count());//구매수량
					 pstmt.setString(6, cart.getBook_image());//표지 이미지
					 result = pstmt.executeUpdate();
				 }
			 }
				conn.commit(); 
		}catch(Exception e) {
			try{conn.rollback();}catch(Exception e1) {e1.printStackTrace();}
			e.printStackTrace();
		}finally {
			try{conn.setAutoCommit(true);}catch(Exception e2) {e2.printStackTrace();}
			close(conn, pstmt, rs);
		}
		return result;
	}//insertCart() 메소드 끝.

	 //해당 id(buyer)로 담은 카트 리스트 건수 구하기
	@Override
	public int getListCount(String buyer) {
		int count =0;
		String sql ="select count(*) from cart where buyer=?";
	try {
		   pstmt = getConnection().prepareStatement(sql);
		   pstmt.setString(1, buyer);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   count = rs.getInt(1);
		   }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return count;
	}//getListCount() 메소드 끝.

	//해당 id(buyer)로 담은 카트 리스트 구하기
	@Override
	public List<Cart> getCartList(String buyer) {
		List<Cart> list = new ArrayList<>();
		String sql ="select * from cart where buyer=?";
		try {
			   pstmt = getConnection().prepareStatement(sql);
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
				  
				  //리스트에 카트상품 정보 담기
				  list.add(cart);
			   }
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(conn, pstmt, rs);
			}
		return list;
	}//getCartList() 메소드 끝.

	//cart상품 수량 수정 메소드
	@Override
	public int updateCount(int cart_id, int buy_count) {
		int result=0;
		String sql ="update cart set buy_count=? where cart_id=?";
		try {
			 conn=getConnection();
			 conn.setAutoCommit(false);
		     pstmt = conn.prepareStatement(sql);
		     pstmt.setInt(1, buy_count);
		     pstmt.setInt(2, cart_id);
		     result = pstmt.executeUpdate();
		     conn.commit();
		}catch(Exception e) {
			 try{conn.rollback();}catch(Exception e1){e1.printStackTrace();}
			e.printStackTrace();
		}finally {
			try{conn.setAutoCommit(true);}catch(Exception e2){e2.printStackTrace();}
			close(conn,pstmt);
		}
		return result;
	}//updateCount() 메소드 끝.

	//장바구니 전체 비우기
	@Override
	public int deleteAll(String buyer) {
		int count=0;
		String sql ="delete from cart where buyer=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buyer);
			count = pstmt.executeUpdate();
		}catch(Exception e) {
		  e.printStackTrace();	
		}finally {
			close(conn,pstmt);
		}
		return count;
	}//deleteAll() 메소드

	@Override
	public int deleteCart(int list) {
		// TODO Auto-generated method stub
		return 0;
	}

}
