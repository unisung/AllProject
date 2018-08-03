package dao;

import java.util.ArrayList;
import java.util.List;

import model.Receiver;
import service.ReceiverService;

public class ReceiverDao extends DaoManger implements ReceiverService {
     private static ReceiverDao instance;
     private ReceiverDao() {}
	 public static ReceiverDao getInstance() {
		 if(instance==null) instance=new ReceiverDao();
		return instance;
	}

	@Override
	public int insertReceiverInfo(Receiver receiver) {
		String sql = "insert into receiver "
				   + " (id,seq,nickname, name, "
				   + " zipno,address1,address2,"
				   + " tel1,tel2,tel3,regdate) "
				   + " values(?,?,?,?,?,?,?,?,?,?,sysdate)";
		String sql1 = "select nvl(max(seq),0)+1 from receiver where id=?";
		int seq =0;
		int result=0;
		String nickName = "";
		try {
			 conn = getConnection();
			 pstmt = conn.prepareStatement(sql1);
			 pstmt.setString(1, receiver.getId());
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 seq = rs.getInt(1);
				 nickName +=String.valueOf(seq);
			 }
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, receiver.getId());
			 pstmt.setInt(2, seq);
			 pstmt.setString(3, nickName);
			 pstmt.setString(4, receiver.getName());
			 pstmt.setString(5,receiver.getZipno());
			 pstmt.setString(6,receiver.getAddress1());
			 pstmt.setString(7,receiver.getAddress2());
			 pstmt.setString(8,receiver.getTel1());
			 pstmt.setString(9,receiver.getTel2());
			 pstmt.setString(10,receiver.getTel3());
			  result =pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return result;
	}//insertReceiverInfo() 메소드 끝.

	@Override
	public List<Receiver> getReceiverList(String id) {
		List<Receiver> list = new ArrayList<>();
		Receiver receiver = null;
		String sql = "select id,seq,nickname,name,zipno,address1,address2,tel1,tel2,tel3 "
	               + "  from receiver "
	               + " where id = ? "
	               + " order by seq";		
		 try {
			   pstmt= getConnection().prepareStatement(sql);
			   pstmt.setString(1,id);
			   rs = pstmt.executeQuery();
			   while(rs.next()) {
				   receiver = new Receiver();
				   
				   receiver.setId(rs.getString(1));
				   receiver.setSeq(rs.getInt(2));
				   receiver.setNickname(rs.getString(3));
				   receiver.setName(rs.getString(4));
				   receiver.setZipno(rs.getString(5));
				   receiver.setAddress1(rs.getString(6));
				   receiver.setAddress2(rs.getString(7));
				   receiver.setTel1(rs.getString(8));
				   receiver.setTel2(rs.getString(9));
				   receiver.setTel3(rs.getString(10));
				   
				   list.add(receiver);
			   }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 close(conn, pstmt, rs);
		 }
		 return list;
	}//getReceiverList(String id) 메소드 끝.

	@Override
	public Receiver getReceiverInfo(String id, int seq) {
		  Receiver receiver = new Receiver();
		String sql = "select id,seq,'기본주소',name,zipno,address1,address2,tel1,tel2,tel3 "
	               + "  from receiver "
	               + " where id = ? and seq =? "
	               + "  union "
	               + " select id,1,'기본주소',name,zipno,address1,address2,tel1,tel2,tel3 "
	               + " from member "
	               + " where id =  ? ";		
		 try {
			   pstmt= getConnection().prepareStatement(sql);
			   pstmt.setString(1,id);
			   pstmt.setInt(2, seq);
			   pstmt.setString(3, id);
			   rs = pstmt.executeQuery();
			   while(rs.next()) {
				   receiver.setId(rs.getString(1));
				   receiver.setSeq(rs.getInt(2));
				   receiver.setNickname(rs.getString(3));
				   receiver.setName(rs.getString(4));
				   receiver.setZipno(rs.getString(5));
				   receiver.setAddress1(rs.getString(6));
				   receiver.setAddress2(rs.getString(7));
				   receiver.setTel1(rs.getString(8));
				   receiver.setTel2(rs.getString(9));
				   receiver.setTel3(rs.getString(10));
			   }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 close(conn, pstmt, rs);
		 }
		return receiver;
	}//getReceiverInfo(String id, int seq) 메소드 끝.

	@Override
	public int updateReceiverInfo(Receiver receiver, int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReceiverInfo(Receiver receiver, int seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
