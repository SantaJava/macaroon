package edu.iot.butter.dao;

import java.util.List;

import edu.iot.butter.model.Attachment;

public interface AttachmentDao{

	Attachment selectOne(int attachmentId) throws Exception;

	List<Attachment> selectList(int boardId) throws Exception;

	int insert(Attachment attachment) throws Exception;

	int delete(int attachmentId) throws Exception;

	int deleteByBoardId(int boardId) throws Exception;

}
