package com.kh.yourfit.common.exception;

public class DtBoardException extends RuntimeException {
	
	public DtBoardException() {}
	
	public DtBoardException(String message) {
		super("게시글 에러 : " + message);
		
	}

}
