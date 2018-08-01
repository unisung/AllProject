package util;

import model.PagingBean;

public class Paging {
	public PagingBean getPaging(String pageNum, int pageSize, int blockSize, int count){
		PagingBean pb = new PagingBean();
		
		//파라미터로 넘어온 페이지 번호 확인 없으면 1페이지로 세팅
		if(pageNum==null||"".equals(pageNum))
			pageNum="1";
	    //현재 페이지 번호
		int currentPage = Integer.parseInt(pageNum);
		//현재 페이지의 시작번호
	    int startRow = (currentPage-1)*pageSize +1;
	    //현재 페이지의 끝 번호.
		int endRow = currentPage * pageSize;
	    //페이지 navi부분 처리
		int pageCount = count/pageSize + (count%pageSize==0?0:1);
		int startPage = (int)((currentPage-1)/blockSize)*blockSize +1;//현재 페이지가 속한 블럭의 시작 번호
		int BLOCKSIZE = blockSize;
		int endPage = startPage + BLOCKSIZE -1;//한 화면에 보여지는 블럭의 끝 페이지 번호
		
		
		pb.setBLOCKSIZE(BLOCKSIZE);
		pb.setCurrentPage(currentPage);
		pb.setStartPage(startPage);
		pb.setEndPage(endPage);
		pb.setEndRow(endRow);
		pb.setPageCount(pageCount);
		pb.setPageNum(Integer.parseInt(pageNum));
		pb.setPageSize(pageSize);
		pb.setStartRow(startRow);
		pb.setEndRow(endRow);		

		return pb;
	}

}
