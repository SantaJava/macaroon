package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Reply;

public interface ReplyService {
   public Reply getReply(int replyId)throws Exception;
   public List<Reply> getReplyList(int replyId)throws Exception;
   public boolean create(Reply reply)throws Exception;
   public boolean update(Reply reply)throws Exception;
   public boolean delete(Reply reply)throws Exception;
   public boolean delete(int boardId)throws Exception;
   int create(Reply reply, boolean hasParent) throws Exception;
   public int increaseLikeCnt(int replyId) throws Exception;
   public int decreaseLikeCnt(int replyId) throws Exception;
}   
