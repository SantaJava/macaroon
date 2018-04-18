package edu.iot.butter.dao;

import edu.iot.butter.model.Like;

public interface LikeDao extends BaseDao<Like, Integer> {
   int getCount(Like like) throws Exception;
   int delete(Like like) throws Exception;
   //BaseDao insert
}
  