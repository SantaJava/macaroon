package edu.iot.butter.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.iot.butter.exception.LoginFailException;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AccountController {

	@Autowired
	MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm(Login login) {
		return "account/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSubmit(@Valid Login login, BindingResult result, HttpSession session) throws Exception {

		if(result.hasErrors()) return "account/login";
		
		Member member = service.checkLogin(login);
//		if(member ==null) {
//			result.reject("failLogin", "user-id or password is incorrect.");
//			return "account/login";
//		}		
		session.setAttribute("USER", member);
		//System.out.println(member);
		return "home";
	}
	
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	

	// 이경우 Ajox가 하는 거고 JSON으로 응답해야 하기 때문에 try/ catch필요.
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public boolean checkId(@RequestParam("userId") String userId) {
		try {
			return service.checkUserId(userId);

		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String form(Member member) {

		return "account/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String submit(@Valid Member member, BindingResult result, RedirectAttributes ra) throws Exception {
		
		//join troubles.
		if (result.hasErrors())
			return "account/join";
		
		//join succeeded.
		service.create(member);
		
		//save it in the session and when redirected, send it and then when you refresh the page, it gets removes when request is changed.
		ra.addFlashAttribute("member",member);	
		return "redirect:/join_success";
	}
	
	@RequestMapping(value = "/join_success", method = RequestMethod.GET)
	public String joinSuccess() {
		return "account/join_success";
	}

	@ExceptionHandler({ SQLException.class, DataAccessException.class })
	public String handleError() {
		return "error/database_error";
	}

	@ExceptionHandler(LoginFailException.class)
	public String handleLoginException(HttpServletRequest request, Exception e) {
		
		request.setAttribute("login", new Login());
		request.setAttribute("error", e.getMessage());
		return "account/login";
	}
}
