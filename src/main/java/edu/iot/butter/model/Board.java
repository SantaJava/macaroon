package edu.iot.butter.model;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Board {
	private int boardId;
	@NotEmpty(message = "Title is needed.")	
	private String title;
	@NotEmpty(message = "Writer is needed.")	
	private String writer;
	@NotEmpty(message = "Password is needed")
	private String content;
	private int readCnt;
	private List<Reply> replies; //board_id 로 조인되는 replies 테이블의 결과가 들어오는 곳. 
	private int replyCnt; //달린 댓글 수 
	private List<Attachment> attachments; //board_id 로 조인되는 테이블의 결과가 들어오는 곳.
	private Date regDate;
	private Date updateDate;
}
