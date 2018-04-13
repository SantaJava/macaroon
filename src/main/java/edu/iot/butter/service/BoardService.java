package edu.iot.butter.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.model.Attachment;
import edu.iot.butter.model.Board;
import edu.iot.butter.model.Pagination;

public interface BoardService {
	Pagination getPagination(int page) throws Exception;
	List<Board> getList(Pagination pagination) throws Exception;
	public Board getBoard(int boardId)throws Exception;
	public boolean create(Board board, List<MultipartFile> fileList)throws Exception;
	public boolean update(Board board, List<MultipartFile> fileList)throws Exception;
	
	public boolean deleteAttachment(int boardId)throws Exception; // attachment 까지 관리해야함. 
	public boolean delete(Board board)throws Exception;
	Attachment getAttachment(int attachmentId) throws Exception;
}
