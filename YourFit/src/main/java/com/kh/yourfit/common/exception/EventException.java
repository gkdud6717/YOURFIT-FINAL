package com.kh.yourfit.common.exception;

public class EventException extends RuntimeException {
	
	public EventException() {}
	
	public EventException(String message) {
		super("게시글 에러 : " + message);
		
	}

}
