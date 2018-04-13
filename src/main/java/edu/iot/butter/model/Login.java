package edu.iot.butter.model;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Login {
	@NotEmpty(message = "user-id is required.")
	private String userId;
	
	@NotEmpty(message = "password is required.")
	private String password;
	
	private String url; //with this, after login, move to : url. 
}
