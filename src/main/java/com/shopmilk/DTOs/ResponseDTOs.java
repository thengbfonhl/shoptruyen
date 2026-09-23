package com.shopmilk.DTOs;

import lombok.Data;

// sorry cái này chắc phài cài lại, nó chưa gen ra đc getter setter
@Data

public class ResponseDTOs {
	private String code;
	
	private String message;
	public ResponseDTOs(String code, String message) {
		super();
		this.code = code;
		this.message = message;
	}
	public ResponseDTOs() {
		
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
