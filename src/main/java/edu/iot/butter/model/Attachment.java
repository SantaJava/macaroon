package edu.iot.butter.model;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Attachment {
	private int attachmentId;
	private int boardId;
	private String fileName;
	private String location; // 서버에서 파일명
	private Date regDate;

	public Attachment(int boardId, String fileName, String location) {
		super();
		this.boardId = boardId;
		this.fileName = fileName;
		this.location = location;
	}
}
