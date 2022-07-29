package com.gyull.cookivel.service.api.subscribe;

/**
 * 구독 api
 * 구독 추가 / 취소 / 읽은 회차 업데이트
 * @author mkht0
 *
 */
public interface SubscribeService {

	public String post();
	
	public String update();
	
	public String delete();
}
