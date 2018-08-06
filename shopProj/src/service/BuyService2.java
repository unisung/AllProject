package service;

import java.util.ArrayList;
import java.util.List;
import model.Bank;
import model.Buy;
import model.Cart;

//구매 처리 인터페이스
public interface BuyService2 {
   //계정 정보 조회 메소드
	public ArrayList<Bank> getAccount();
	//구매 처리 메소드
	public int insertBuy(List<Cart> list,Buy buy);
	//구매건수 확인메소드
	public int getBuyListCount(String buyer);
	//구매목록 정보 리스트 구하기 메소드
	public ArrayList<Buy> getBuyList(String buyer);
	//구매목록 정보 리스트 구하기 페이징
	public ArrayList<Buy> getBuyList(String buyer, int startRow, int endRow);
	//Admin영역에서 조회하는 구매목록 정보 리스트 구하기
	public ArrayList<Buy> getBuyList(int startRow, int endRow);
	//전체 구매 건수 조회 메소드
	public int getBuyListCount();
	//전체 구매 리스트 내역 조회메소드
	public ArrayList<Buy> getBuyList();
	//배송처리 상태 메소드
	public int updateOrderStatus(int buy_id, String status);
	
	
	
	
	
	
	
	
	
	
	
 
}
