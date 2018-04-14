package edu.iot.butter.service;

import edu.iot.butter.model.Reply;

public interface ReplyService {
   public Reply getReply(int replyId)throws Exception;
   public boolean create(Reply reply)throws Exception;
   public boolean update(Reply reply)throws Exception;
   public boolean delete(Reply reply)throws Exception;
   public boolean delete(int boardId)throws Exception;
   boolean create(Reply reply, boolean hasParent) throws Exception;
}   
