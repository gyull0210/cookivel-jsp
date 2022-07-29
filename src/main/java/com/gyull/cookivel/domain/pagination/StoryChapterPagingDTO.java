package com.gyull.cookivel.domain.pagination;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class StoryChapterPagingDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private StoryChapterCriteria sccri;
	
	public StoryChapterPagingDTO(StoryChapterCriteria sccri, int total) {
		this.sccri = sccri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(sccri.getPageNum()/10.0))*10;
		this.startPage = this.endPage - 9;
				
		int realEnd = (int)(Math.ceil((total*1.0)/sccri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
