package util;

import model.PagingBean;

public class Paging {
	public PagingBean getPaging(String pageNum, int pageSize, int blocksize, int count) {
		PagingBean pb = new PagingBean();

		/* 파라미터로 넘어온 페이지번호값이 없으면 무조건 page를 1로 설정 */
		if (pageNum == null || "".equals(pageNum))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		/* 현재페이지의 시작번호 */
		int startRow = (currentPage - 1) * pageSize + 1;
		/* 현재페이지의 마지막 번호 */
		int endRow = currentPage * pageSize;// 페이지 당 끝번호가 10,20,30...으로 끝남
		/* 도서리스트 번호 와 순서 초기화 */
		int number = 0;

		/* 페이지 navigation 부분 */
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int) ((currentPage - 1) / 10) * 10 + 1;// 현재페이지가 속한 시작번호
		int BLOCKSIZE = blocksize;// 한 블럭당 출력되는 페이지 수
		int endPage = startPage + BLOCKSIZE - 1;// 한 화면에 보여지는 페이지 끝 번호

		pb.setBLOCKSIZE(BLOCKSIZE);
		pb.setCurrentPage(currentPage);
		pb.setEndPage(endPage);
		pb.setEndRow(endRow);
		pb.setPageCount(pageCount);
		pb.setPageNum(Integer.parseInt(pageNum));
		pb.setPageSize(pageSize);
		pb.setStartRow(startRow);
		pb.setStartPage(startPage);

		return pb;
	}
}