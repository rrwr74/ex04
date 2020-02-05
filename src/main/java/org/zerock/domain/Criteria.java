package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int realPageNum;
	private int amount;
	private String type;
	private String keyword;
	
	public Criteria() {
		this.pageNum = 1;
		this.amount = 10;
		this.realPageNum = 0; 
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.realPageNum = ((pageNum - 1) < 0 ? 0 :  (pageNum - 1) ) * amount;
	}
	
	
	public Criteria(int pageNum, int amount, int realPageNum) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.realPageNum = realPageNum; 
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
				
	}
}
