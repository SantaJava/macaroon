package edu.iot.butter.dao;

import edu.iot.butter.model.Board;

public interface BoardDao extends BaseDao<Board, Integer>{
	int deleteByUser(Board board) throws Exception;	
	int increaseReadCnt(int boardId)throws Exception;
}
