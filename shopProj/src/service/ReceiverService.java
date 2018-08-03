package service;

import java.util.List;
import model.Receiver;

public interface ReceiverService {
	//새송지 추가
 public int insertReceiverInfo(Receiver receiver);
 //배송지 리스트
 public List<Receiver> getReceiverList(String id);
 //배송지 정보
 public Receiver getReceiverInfo(String id, int seq);
 //배송지 수정
 public int updateReceiverInfo(Receiver receiver, int seq);
 //배송지 삭제
 public int deleteReceiverInfo(Receiver receiver,int seq);
 
}
