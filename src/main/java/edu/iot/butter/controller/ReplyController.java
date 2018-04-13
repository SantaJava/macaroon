package edu.iot.butter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value = "/addTop", method = RequestMethod.POST)
	public boolean insertTopReply(@RequestBody Reply reply) throws Exception {
		// RequestBody : JSON인코딩을 해석해준다.
		System.out.println(reply);
		return service.create(reply, false);
	}

}
