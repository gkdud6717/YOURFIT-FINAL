package com.kh.yourfit.common.exception;

public class ProductException extends RuntimeException {
	
	public ProductException() {}
	
	public ProductException(String message) {
		super("상품 에러 : "+ message);
	}
}
