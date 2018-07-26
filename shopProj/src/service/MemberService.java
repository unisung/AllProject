package service;

import java.util.ArrayList;

import model.Member;

public interface MemberService {
	//id 체크
	int userCheck(String id);
	//email 체큳
	int emailCheck(String email);
	//회원등록
	int insertMember(Member member);
	//회원정보 조회
	Member selectMember(String memberId);
	//회원정보 수정
	int updateMember(Member member);
	//회원탈퇴 
	int deleteMember(String id);
	//회원리스트
	ArrayList<Member> getMemberList();
	//회원id,password체크
	int userCheck(String id, String password);
}
