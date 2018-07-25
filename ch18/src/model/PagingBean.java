package model;

public class PagingBean {
	private int pageSize; //한 페이지 당 출력 건수
	private int pageNum;//페이지 파라미터
	private int currentPage;//현재 페이지
	private int startRow;//현재 페이지의 시작번호
	private int endRow;//현재 페이지의 끝번호
	private int pageCount;//전체 페이지 갯수
	private int startPage;//한 블럭에 보여주는 페이지의 시작페이지 번호
	private int BLOCKSIZE;	//한번에 보여주는 페이지 블럭 단위
	private int endPage;//한 블럭에 보여주는 페이지의 끝 번호
	
	public int getPageSize() {	return pageSize;	}
	public void setPageSize(int pageSize) {	this.pageSize = pageSize;}
	public int getPageNum() {	return pageNum;	}
	public void setPageNum(int pageNum) {	this.pageNum = pageNum;	}
	public int getCurrentPage() {	return currentPage;	}
	public void setCurrentPage(int currentPage) {	this.currentPage = currentPage;	}
	public int getStartRow() {		return startRow;	}
	public void setStartRow(int startRow) {		this.startRow = startRow;	}
	public int getEndRow() {		return endRow;	}
	public void setEndRow(int endRow) {		this.endRow = endRow;	}
	public int getPageCount() {		return pageCount;	}
	public void setPageCount(int pageCount) {		this.pageCount = pageCount;	}
	public int getStartPage() {		return startPage;	}
	public void setStartPage(int startPage) {		this.startPage = startPage;	}
	public int getBLOCKSIZE() {		return BLOCKSIZE;	}
	public void setBLOCKSIZE(int bLOCKSIZE) {		BLOCKSIZE = bLOCKSIZE;	}
	public int getEndPage() {		return endPage;	}
	public void setEndPage(int endPage) {		this.endPage = endPage;	}
	
}
