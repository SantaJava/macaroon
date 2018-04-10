package edu.iot.butter.model;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Password {
	@NotEmpty(message = "User-id is required.")
	private String userId;
	@NotEmpty(message = "password is required.")
	private String oldPassword;
	@NotEmpty(message = "password is required.")
	private String newPassword;
}
