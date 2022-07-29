package com.gyull.cookivel.domain.pagination;

public class ChapterCommentCriteria {
	private int pageNum;
	private int amount;
	private int skip;
	private int book_idx;
	private int chapter_idx;
	
//	private String comment_sort;
	
	public ChapterCommentCriteria() {
		this(1, 10, 0, 0/* , null */);
		this.skip = 0;
		this.book_idx = 0;
		this.chapter_idx = 0;
	}
	
	public ChapterCommentCriteria(int pageNum, int amount, int book_idx, int chapter_idx/*, String comment_sort*/) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
		this.book_idx = book_idx;
		this.chapter_idx = chapter_idx;
		/* this.comment_sort = comment_sort; */
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNum-1)*amount;		
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	public int getBook_idx() {
		return book_idx;
	}

	public void setBook_idx(int book_idx) {
		this.book_idx = book_idx;
	}
	
	public int getChapter_idx() {
		return chapter_idx;
	}

	public void setChapter_idx(int chapter_idx) {
		this.chapter_idx = chapter_idx;
	}

//	public String getComment_sort() {
//		return comment_sort;
//	}
//
//	public void setComment_sort(String comment_sort) {
//		this.comment_sort = comment_sort;
//	}

	@Override
	public String toString() {
		return "ChapterCriteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", book_idx="+ book_idx + ", chapter_idx="+ chapter_idx +/*+ ", comment_sort" + comment_sort+*/"]";
	}
	
}
