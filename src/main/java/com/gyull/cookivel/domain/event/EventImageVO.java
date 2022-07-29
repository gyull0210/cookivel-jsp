package com.gyull.cookivel.domain.event;

import lombok.Data;

@Data
public class EventImageVO {

	private int eventImage_idx;
	private int event_idx;
	private String eventImg_name;
	private String eventImg_Url;
	private String eventImg_thumbUrl;
	private String eventImg_Uuid;
	private String eventImg_regDate;
}
