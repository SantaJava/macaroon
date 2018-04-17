package edu.iot.butter.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iot.butter.model.Image;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Password;
import edu.iot.butter.service.ImageService;
import edu.iot.butter.service.MemberService;

@Controller
@RequestMapping("/member")
public class ProfileController {

   @Autowired
   MemberService service;

   public void setMember(HttpSession session, Model model) throws Exception {
      Member m = (Member) session.getAttribute("USER");
      // regDate와 수정 Date를 가져오기 위해 DB에서 가져온 모델 객체를 전달한다.
      Member member = service.getMember(m.getUserId());
      model.addAttribute("member", member);
   }

   @RequestMapping("/profile")
   public void profile(HttpSession session, Model model) throws Exception {
      setMember(session, model);
   }

   @RequestMapping(value = "/edit", method = RequestMethod.GET)
   public void editForm(HttpSession session, Model model) throws Exception {
      setMember(session, model);
   }

   @RequestMapping(value = "/edit", method = RequestMethod.POST)
   public String editSubmit(@Valid Member member, HttpSession session, BindingResult result) throws Exception {

      if (!service.update(member)) {
         result.reject("updateFail", "password does not match.");
         return "member/edit";
      }
      session.setAttribute("USER", member);
      return "redirect:profile";
   }

   @RequestMapping(value = "/changepassword", method = RequestMethod.GET)
   public void chagePasswordForm(Password password) throws Exception {

   }

   @RequestMapping(value = "/changepassword", method = RequestMethod.POST)
   public String changePasswordSubmit(Password password, BindingResult result) throws Exception {
         
      System.out.println(password);
      if (!service.changePassword(password)) {
         result.reject("updateFail", "Password dosn't match.");
         return "member/changepassword";
      }
      return "redirect:profile";
   }
   
   @RequestMapping(value="/avata/{userId}", method = RequestMethod.GET)
   public String image(@PathVariable String userId, Model model) throws Exception {
      
      System.out.println(userId);
      String path = service.IMAGE_DIR + "/" + userId+".png";
      model.addAttribute("type", "image/png");
      model.addAttribute("path", path);
      return "fileView"; //사용자 정의 뷰.
   }
}