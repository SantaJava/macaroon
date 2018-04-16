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
		boolean replyHasParent;
		boolean result = true;
		// RequestBody : JSON인코딩을 해석해준다.
		System.out.println(reply);
		System.out.println("컨트롤러 동작");
		
		if(reply.getParentReply() != 0) {
			result = service.create(reply, true);
		}else {
			result = service.create(reply, false);
			
		}
		System.out.println(result);
		return result;
	}

	@RequestMapping(value = "/{replyId}", method = RequestMethod.GET)
	public List<Reply> getList(@PathVariable int replyId) {
		System.out.println("json getList 동작");
		List list = null;
		try {
			list = service.getReplyList(replyId);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Transactional
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public boolean delete(@PathVariable int id) throws Exception {
		Reply reply = service.getReply(id);
		return service.delete(reply);
	}

	@Transactional
	@RequestMapping(value = "/", method = RequestMethod.PUT)
	public boolean update(@RequestBody Reply reply) throws Exception {
		Reply newReply = service.getReply(reply.getReplyId());
		newReply.setContent(reply.getContent());
		System.out.println(newReply);
		return service.update(newReply);
	}
}