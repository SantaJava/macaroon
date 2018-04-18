package edu.iot.butter.service;

import edu.iot.butter.model.Like;

public interface LikeService {
   
   
   public boolean hasLike(Like like) throws Exception;

   public boolean insertLike(Like like) throws Exception;

   public boolean deleteLike(Like like) throws Exception;

}