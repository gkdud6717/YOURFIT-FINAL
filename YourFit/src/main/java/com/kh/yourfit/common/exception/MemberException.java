package com.kh.yourfit.common.exception;

public class MemberException extends RuntimeException {

	public MemberException() {}
	
	public MemberException(String message) {
		super("회원 에러 : " + message);
	}
}
