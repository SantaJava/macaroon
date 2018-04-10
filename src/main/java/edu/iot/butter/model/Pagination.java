package edu.iot.butter.model;

import lombok.Data;

@Data
public class Pagination {
	public final int PER_PAGE; // 1페이지당 데이터 건수
	public final int PER_BLOCK; // 1블럭당 페이지 수

	private int totalCount; // 전체 데이터 건수
	private int page; // 현재 페이지
	private int start; // 현재 페이지 시작 번호
	private int end; // 현재 페이지 끝 번호

	private int totalPage; // 전체 페이지 수
	private int startPage; // 현재 페이지 블럭에서 시작 페이지 번호
	private int endPage; // 현제 페이지 블럭에서 마지막 페이지 번호

	private int currentBlock; // 현제 페이지 블럭
	private int totalBlock; // 전체 페이지 블럭 수
	private int prevBlockPage; // 이전 페이지 블록 시작 페이지
	private int nextBlockPage; // 다음 페이지 블록 시작 페이지

	
	public Pagination(int currentPage, int totalCount) {
		this(currentPage,totalCount,10,10); //default생성자.
	}
	
	public Pagination(int currentPage, int totalCount, int perPage) {
		this(currentPage, totalCount, perPage ,10); 
	}
	
	
	public Pagination(int currentPage, int totalCount, int perPage, int perBlock) {
		this.totalCount = totalCount;
		PER_BLOCK = perBlock;
		PER_PAGE = perPage;
		//System.out.println("pagination class: " + currentPage);
		page = currentPage;
		start = (page-1)*PER_PAGE +1;
		end = start+ PER_PAGE -1;
		totalPage = (int)Math.ceil((float)totalCount/PER_PAGE);
		
		currentBlock = (int)Math.ceil((float)currentPage/PER_BLOCK);
		totalBlock = (int)Math.ceil((float)totalPage/PER_BLOCK);
		
		startPage = (currentBlock-1)*PER_BLOCK +1; //현재 블록의 시작 페이지
		endPage = startPage + PER_BLOCK -1; //블록 마지막 페이지
		
		if(endPage> totalPage) endPage = totalPage; //마지막 페이지블럭이 토탈페이지보다 크면 토탈 페이지로 하겠다.
		
		prevBlockPage = page-PER_BLOCK;
		nextBlockPage = page+PER_BLOCK;
		
		System.out.println(this.toString());
	}
}
