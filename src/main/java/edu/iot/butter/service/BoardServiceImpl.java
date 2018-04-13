package edu.iot.butter.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.dao.AttachmentDao;
import edu.iot.butter.dao.BoardDao;
import edu.iot.butter.model.Attachment;
import edu.iot.butter.model.Board;
import edu.iot.butter.model.Pagination;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Autowired
	AttachmentDao attachmentDao;

	
	
	@Override
	public Pagination getPagination(int page) throws Exception {
		int total = dao.getCount();
		Pagination pagination = new Pagination(page, total);
		return pagination;
	}

	@Override
	public List<Board> getList(Pagination pagination) throws Exception {
		return dao.selectList(pagination);
	}

	@Transactional
	@Override
	public Board getBoard(int boardId) throws Exception {
		dao.increaseReadCnt(boardId); // 조회수 올리기 (이부분이 update에 해당하기 때문에 Transactional이 필요.)
		Board board = dao.selectOne(boardId); // 선택한 board반환.
		board.setAttachments(attachmentDao.selectList(boardId)); // setAttachments.
		return board;
	}
	
	@Transactional
	@Override
	public boolean create(Board board, List<MultipartFile> fileList) throws Exception {
		// boardId 를 아직 전달받지 못했기 때문에 boardID는 0.
		int result = dao.insert(board);
		upload(board.getBoardId(), fileList);
		return result == 1;
	}
	
	@Transactional
	@Override
	public boolean update(Board board, List<MultipartFile> fileList) throws Exception {
		int result = dao.update(board);
		upload(board.getBoardId(), fileList);
		return result == 1;
	}
	


	public boolean upload(int boardId, List<MultipartFile> fileList) throws Exception {
		for (MultipartFile file : fileList) {
			if (!file.isEmpty()) {
				Attachment attachment = save(boardId, file);
				attachmentDao.insert(attachment);
			}
		}
		return true;
	}

	public Attachment save(int boardId, MultipartFile file) throws Exception {
		long fileNo = System.currentTimeMillis();
		String fname = file.getOriginalFilename();
		String newName = fileNo + "_" + fname;
		String path = "C:/temp/upload/" + newName;
		System.out.println(path);
		file.transferTo(new File(path));
		return new Attachment(boardId, fname, newName);
	}

	@Override
	public boolean delete(Board board) throws Exception {
		return dao.deleteByUser(board)==1;		
	}
	
	@Override
	public Attachment getAttachment(int attachmentId) throws Exception{
		return attachmentDao.selectOne(attachmentId);
	}
	
	@Transactional
	@Override
	public boolean deleteAttachment(int attachmentId) throws Exception {
		return attachmentDao.delete(attachmentId)==1;
	}
}
