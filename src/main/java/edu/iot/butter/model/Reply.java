package edu.iot.butter.model;

import java.util.Date;
import java.util.List;


import lombok.Data;


@Data
public class Reply {
	
	private int replyId;
	private int boardId;
	private String writer;
	private String content;
	private Date regDate;
	private int parentReply;
	private int likeCnt;
	private int replyCnt;
	private List<Reply> replies; //대댓글 list 저장할 필드
}

