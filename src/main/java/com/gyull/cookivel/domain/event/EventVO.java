package com.gyull.cookivel.domain.event;

import lombok.Data;

@Data
public class EventVO {

	private int event_idx;
	private int member_idx;
	private String mem_authority;
	private String event_title;
	private String event_writer;
	private String event_content;
	private String event_regDate;
	
	private String event_startDate;
	private String event_endDate;
}
