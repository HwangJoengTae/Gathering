package com.gathering.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.gathering.dto.UserInfoVO;
import com.gathering.service.UserService;
import com.gathering.util.FindUtil;
import com.gathering.util.MailUtil;

@SessionAttributes("user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	// 메인페이지로
	@GetMapping("/main")
	public void mainView() {
		
	}
	
	// 회원가입페이지로
	@GetMapping("/user/join")
	public void joinView() {
		
	}
	
	// 로그인페이지로
	@GetMapping("/user/login")
	public void loginView() {
		
	}
	
	// 회원가입하기
	@PostMapping("/user/joinForm")
	public String joinAction(UserInfoVO vo) {
		System.out.println(vo);

		userService.insertUser(vo);
		
		return "user/login";
	}
	
	
	// 아이디 중복체크하기
	@RequestMapping("/user/id_check_form")
	public String idCheck(UserInfoVO vo, Model model) {
		
		model.addAttribute("user_id", vo.getUser_id());
		int result = 0;
		
		if(userService.getUser(vo) != null) {
			result = 1;
		} else {
			result = -1;
		}
		
		model.addAttribute("message", result);
		
		return "/user/idcheck";
	}
	
	
	// 로그인하기
	@PostMapping("/user/loginForm")
	public String loginAction(UserInfoVO vo, Model model) {
		UserInfoVO user = userService.getUser(vo);
		
		if(user != null) {
			if(vo.getPassword().equals(user.getPassword())){

				//정상로그인
				model.addAttribute("user", user);
				System.out.println("[로그인성공]" +user);

				return "redirect:/main";
				
			} else {

				model.addAttribute("message", "비밀번호를 다시 확인해주세요.");
				return "/user/login";

			}
			
		} else {
			// 아이디 없을 때
		    model.addAttribute("message", "가입되지 않은 아이디 입니다.");
			return "/user/login";
		}
		
	}
	
	// 로그아웃하기
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "redirect:/main";
	}
	
	
	
	// 아이디 비번찾기 팝업창 띄우기
	@GetMapping("/user/findUserInfoView")
	public String findUserInfoView() {
		return "/user/findUserInfo";
	}
	

	// 이메일, 비밀번호로 아이디 찾기
	@PostMapping("/user/findId")
	public String findId(UserInfoVO vo, Model model) {
		
		UserInfoVO user = userService.findId(vo);
		
		if(user != null) {
			if(vo.getPassword().equals(user.getPassword())) {
				model.addAttribute("message", "조회된 아이디 : ");
				model.addAttribute("userId", user.getUser_id());
				
			} else {
				
				model.addAttribute("message", "비밀번호를 다시 확인해주세요.");
				
			}
			
		} else {
			
			model.addAttribute("message", "이메일 주소를 다시 확인해주세요");
		
		}
		
		return "/user/findUserInfo";
		
	}
	
	
	// 아이디, 이메일로 비밀번호 찾기
	@PostMapping("/user/findPassword")
	public String findPassword(UserInfoVO vo, Model model) throws Exception {
		UserInfoVO user = userService.getUser(vo);
		
		if(user != null) {
			if(vo.getEmail().equals(user.getEmail())){
				model.addAttribute("message1", "이메일로 임시비밀번호를 보냈습니다. 확인 후 비밀번호를 변경해 주세요.");
				
				// 임시비밀번호 생성 후 DB에 업데이트
				String newPwd = FindUtil.getNewPassword();
				user.setPassword(newPwd);
				userService.createTempPassword(user);
				// 메일보내기
				String subject = "[Gathering] 임시 비밀번호 발급";
				String msg = "";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color:blue;'><strong>" + vo.getUser_id();
					msg += "님</strong>의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하세요.</h3>";
					msg += "<p>임시 비밀번호 : <strong>" + newPwd + "</strong></p></div>";
				MailUtil.sendMail(vo.getEmail(), subject, msg);	
				 
			} else {
				model.addAttribute("message1", "이메일을 바르게 입력해 주세요.");
			}
		} else {
			model.addAttribute("message1", "가입되지 않은 아이디입니다.");
		}
		model.addAttribute("a", 1);
		return "/user/findUserInfo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
