package dao;

import java.util.ArrayList;
import java.util.List;

import model.Bank;
import model.Buy;
import model.Cart;
import service.BuyService;

public class BuyDao extends DaoManger implements BuyService {
	//싱글톤 처리
	public static BuyDao instance;
	private BuyDao() {}//기본 생성자를 private로 처리
	public static BuyDao getInstance() {//객체 호출시 getInstance()로 호출 처리.
		if(instance==null) instance = new BuyDao();
		return instance;
	}

	//결제 계좌 정보 추출
	@Override
	public ArrayList<Bank> getAccount() {
		ArrayList<Bank> list = new ArrayList<>();
	    String sql = "select * from bank order by account";
	    try {
	    	 conn = getConnection();
	    	 pstmt = conn.prepareStatement(sql);
	    	 rs = pstmt.executeQuery();
	    	 while(rs.next()) {
	    		 //bank객체 생성
	    		 Bank bank = new Bank();
	    		 //bank객체 값 설정
	    		 bank.setAccount(rs.getString(1));
	    		 bank.setBank(rs.getString(2));
	    		 bank.setName(rs.getString(3));
	    		 //list에 add하기
	    		 list.add(bank);
	    	 }
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }finally {
	    	close(conn, pstmt, rs);
	    }
		return list;//결제계좌 정보 리스트 리턴
	}//getAccount() 메소드 끝.

	//***  구매 처리 메소드 **//
	@Override
	public int insertBuy(List<Cart> list, Buy buy) {
		int result =0;
		String sql = "insert into buy(buy_id,buyer,book_id,book_title, "
				   + " buy_price, buy_count,book_image,buy_date,account, "
				   + " deliveryname,deliverytel,deliveryaddress) "
				   + " values(buy_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
		String sql_trg_disable="alter trigger cart_trg_d disable";
		String sql_trg_enable="alter trigger cart_trg_d enable";
		String sql_cart_del="delete from cart where buyer=?";
		try {
			 conn = getConnection();
			 conn.setAutoCommit(false);
			 //trigger disable시킴
			 pstmt = conn.prepareStatement(sql_trg_disable);
			 pstmt.executeUpdate();

			//매개변수로 넘어온 cart데이타리스트 처리
			for( int j=0;j<list.size();j++) {
				Cart cart = list.get(j);
				pstmt = conn.prepareStatement(sql);
				int i=0;
				pstmt.setString(++i,cart.getBuyer());
				pstmt.setInt(++i, cart.getBook_id());
				pstmt.setString(++i, cart.getBook_title());
				pstmt.setInt(++i, cart.getBuy_price());
				pstmt.setInt(++i, cart.getBuy_count());
				pstmt.setString(++i, cart.getBook_image());
				pstmt.setDate(++i, new java.sql.Date(new java.util.Date().getTime()));
				pstmt.setString(++i, buy.getAccount());
				pstmt.setString(++i, buy.getDeliveryname());
				pstmt.setString(++i, buy.getDeliverytel());
				pstmt.setString(++i, buy.getDeliveryaddress());
				
                 pstmt.executeUpdate();
                     
			}
			   pstmt = conn.prepareStatement(sql_cart_del);
			   pstmt.setString(1,buy.getBuyer());//구매자 id
			   //카트 삭제 처리
			   pstmt.executeUpdate();
			   conn.commit();
			   //삭제 트리거 활성화
				 pstmt = conn.prepareStatement(sql_trg_enable);
				 pstmt.executeUpdate();
		}catch(Exception e) {
			try{conn.rollback();}catch(Exception e1) {e1.printStackTrace();}
			e.printStackTrace();
		}finally {
			try {conn.setAutoCommit(true);}catch(Exception e){e.printStackTrace();}
		   close(conn,pstmt);	
		}
		return result;
	}//insertBuy() 메소드 끝.

	@Override
	public int getBuyListCount(String buyer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Buy> getBuyList(String buyer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Buy> getBuyList(String buyer, int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Buy> getBuyList(int startRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getBuyListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Buy> getBuyList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateOrderStatus(int buy_id, String status) {
		// TODO Auto-generated method stub
		return 0;
	}

}
