package edu.iot.butter.model;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	
	private int replyId;
	private int boardId;
	private String writer;
	private String content;
	private Date regDate;
	private int parentReply;
	private int likeCnt;
	private int replyCnt;
	private List<Reply> replies;
	private boolean clickedHeart;
}

