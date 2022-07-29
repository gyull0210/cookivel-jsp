package com.gyull.cookivel.domain.pagination;

public class Criteria {

	private int pageNum;
	private int amount;
	private int skip;
	
	private String sort;
	private String genre;
	
	public Criteria() {
		this(1, 10, null, null);
		this.skip = 0;
	}
	
	public Criteria(int pageNum, int amount, String sort, String genre) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
		this.sort = sort;
		this.genre = genre;
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
	
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", sort=" + sort + ", genre=" + genre + "]";
	}
	
}