package edu.iot.butter.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Password;
import edu.iot.butter.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {

	@Autowired
	MemberService service;

	@RequestMapping("/list")
	public void list(@RequestParam(value = "page", defaultValue = "1") int page, Model model) throws Exception {
		Pagination pagination = service.getPagination(page);
		System.out.println(pagination);
		List<Member> list = service.getList(pagination);
		System.out.println(list);
		model.addAttribute("pagination", pagination);
		model.addAttribute("list", list);

		model.addAttribute("today", new Date());
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createForm(Member member) {

	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createSubmit(@Valid Member member, BindingResult result) throws Exception {
		if (result.hasErrors() || !service.create(member))
			return "admin/member/create";

		return "redirect:list";
	}

	@RequestMapping(value = "/view/{userId}", method = RequestMethod.GET)
	public String view(@PathVariable String userId, Model model) throws Exception {
		Member member = service.getMember(userId);
		model.addAttribute("member", member);
		return "admin/member/view";
	}

	@RequestMapping(value = "/edit/{userId}", method = RequestMethod.GET)
	public String editForm(@PathVariable String userId, Model model) throws Exception {
		Member member = service.getMember(userId);
		model.addAttribute("member", member);
		return "admin/member/edit";
	}

	@RequestMapping(value = "/edit/{userId}", method = RequestMethod.POST)
	public String editSubmit(@Valid Member member, @RequestParam(value = "page", defaultValue = "1") int page,
			BindingResult result, HttpSession session) throws Exception {
		if (result.hasErrors())
			return "admin/member/edit";

		// Admin Password Check
		Member admin = (Member) session.getAttribute("USER");
		if (!admin.getPassword().equals(member.getPassword())) {
			result.reject("passwordNotMatch", "Edit failed.");
			return "admin/member/edit";
		}

		if (!service.updateByAdmin(member)) {
			result.reject("updateFail", "update has failed.");
			return "admin/member/edit";
		}
		return "redirect:/admin/member/view/" + member.getUserId() + "?page=" + page; // null이라는 문자열이 들어감.
	}

	@RequestMapping(value = "/changepassword/{userId}", method = RequestMethod.GET)
	public String changePasswordForm(Password password, @PathVariable String userId) throws Exception {
		password.setUserId(userId);
		return "admin/member/changepassword";
	}

	@RequestMapping(value = "/changepassword/{userId}", method = RequestMethod.POST)
	public String changePasswordSubmit(@Valid Password password,
			@RequestParam(value = "page", defaultValue = "1") int page, BindingResult result,
			HttpSession session) throws Exception {

		if (result.hasErrors())
			return "admin/member/changepassword";

		Member admin = (Member) session.getAttribute("USER");

		if (!admin.getPassword().equals(password.getOldPassword())) {
			result.reject("passwordNotMatch", "ChangePassword failed_password doesn't match.");
			return "admin/member/changepassword";
		}

		if (!service.changePasswordByAdmin(password)) {
			result.reject("updateFail", "changePassword has failed.");
			return "admin/member/changepassword";
		}
		return "redirect:/admin/member/view/" + password.getUserId() + "?page=" + page;
	}
}
