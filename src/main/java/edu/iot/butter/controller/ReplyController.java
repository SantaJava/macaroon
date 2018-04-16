package edu.iot.butter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.iot.butter.model.Reply;
import edu.iot.butter.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
   @Autowired
   ReplyService service;


   @RequestMapping(value = "/add", method = RequestMethod.POST)
   public boolean insertReply(@RequestBody Reply reply) throws Exception {
      // RequestBody : JSON인코딩을 해석해준다.
      System.out.println(reply);
      return service.create(reply, true);
   }
   
   @Transactional   
   @RequestMapping(value = "/addTop", method = RequestMethod.POST)
   public boolean insertTopReply(@RequestBody Reply reply) throws Exception {
      // RequestBody : JSON인코딩을 해석해준다.
      System.out.println(reply);
      System.out.println("컨트롤러 동작");
      boolean result = service.create(reply, false);
      System.out.println(result);
      return result;
   }
   
   @RequestMapping(value = "/{replyId}", method = RequestMethod.GET)
   public List<Reply> getList(@PathVariable int replyId){
	   System.out.println("json getList 동작");
	   List list = null;
	   try {
	   list =  service.getReplyList(replyId);
	   System.out.println(list);
	   }
	   catch(Exception e) {
		   e.printStackTrace();
	   }
	   return list;
   }
}