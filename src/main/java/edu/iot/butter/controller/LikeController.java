package edu.iot.butter.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.iot.butter.model.Like;
import edu.iot.butter.service.LikeService;
import edu.iot.butter.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class LikeController {
   @Autowired
   LikeService likeService;
   @Autowired
   ReplyService replyService;
   


   @Transactional
   @RequestMapping(value = "/likeUp", method = RequestMethod.POST)
   public int insertLike(@RequestBody Like like, HttpSession session) throws Exception {
      // RequestBody : JSON인코딩을 해석해준다.
      System.out.println("controller 호출");
      System.out.println(like);
      boolean result;
      
      if(!likeService.hasLike(like) && session.getAttribute("USER") != null){
         
         System.out.println("좋아요 없음");
         
         
         if(likeService.insertLike(like)) {
            System.out.println("insertLike 성공");
            result = replyService.increaseLikeCnt(like.getReplyId())==1;
            
            
            return 1;
         }
         
      }else {
         System.out.println("좋아요 있음");
         
         if(likeService.deleteLike(like)) {
            System.out.println("deleteLike 성공");
            result = replyService.decreaseLikeCnt(like.getReplyId())==1;
            return -1;
         }
          
      }
      return 0;
   }
}