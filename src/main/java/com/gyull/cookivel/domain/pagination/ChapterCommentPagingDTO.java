package com.gyull.cookivel.domain.pagination;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ChapterCommentPagingDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private ChapterCommentCriteria cccri;
	
	public ChapterCommentPagingDTO(ChapterCommentCriteria cccri, int total) {
		this.cccri = cccri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cccri.getPageNum()/10.0))*10;
		this.startPage = this.endPage - 9;
				
		int realEnd = (int)(Math.ceil((total*1.0)/cccri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
