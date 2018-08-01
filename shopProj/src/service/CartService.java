package service;

import java.util.List;
import model.Cart;

public interface CartService {
	//[장바구니담기]처리 메소드
	public int insertCart(Cart cart);
	//구매건수 확인 메소드
	public int getListCount(String buyer);
	//카트 리스트 구하기
	public List<Cart> getCartList(String buyer);
	//cart상품 수량 수정 메소드
	public int updateCount(int cart_id, int buy_count);
	//카트 전체 내용 비우기 메소드
	public int deleteAll(String buyer);
	//특정 카트번호의 정보삭제처리 메소드
	public int deleteCart(int list);

}
