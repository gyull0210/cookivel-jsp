package com.gyull.cookivel.domain.pagination;

public class BookCriteria {

	private int pageNum;
	private int amount;
	private int skip;
	private int book_idx;
	
	private String chapter_sort;
	
	public BookCriteria() {
		this(1, 10, 0, null);
		this.skip = 0;
		this.book_idx = 0;
	}
	
	public BookCriteria(int pageNum, int amount, int book_idx, String chapter_sort) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
		this.book_idx = book_idx;
		this.chapter_sort = chapter_sort;
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
	
	public String getChapter_sort() {
		return chapter_sort;
	}

	public void setChapter_sort(String chapter_sort) {
		this.chapter_sort = chapter_sort;
	}

	@Override
	public String toString() {
		return "BookCriteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", book_idx="+ book_idx + ", chapter_sort" + chapter_sort+"]";
	}
	
}