package com.gyull.cookivel.domain.pagination;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class StoryPagingDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private StoryCriteria scri;
	
	public StoryPagingDTO(StoryCriteria scri, int total) {
		this.scri = scri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(scri.getPageNum()/10.0))*10;
		this.startPage = this.endPage - 9;
				
		int realEnd = (int)(Math.ceil((total*1.0)/scri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
