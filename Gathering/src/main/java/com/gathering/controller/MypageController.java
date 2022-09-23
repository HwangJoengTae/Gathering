package com.gathering.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.InterestGroupVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.paging.Criteria;
import com.gathering.paging.PageMakerDTO;
import com.gathering.service.GroupService;
import com.gathering.service.MypageService;
import com.gathering.service.UserService;

@SessionAttributes("user")
@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GroupService groupService;
	
	
	
	// 내 정보관리로 이동
	@GetMapping("/mypage/myInfo")
	public void myInfoView() {
		
	}
	
	// 회원정보 수정하기
	@PostMapping("/mypage/userUpdateForm")
	public String updateUserAction(UserInfoVO vo, Model model) {
				
		mypageService.updateUser(vo);
		model.addAttribute("user", vo);
		
		System.out.println("[정보수정완료]" + vo);
		
		return "/mypage/interestGroupList";
	}
	
	
	// 회원탈퇴페이지로 이동
	@GetMapping("/mypage/deleteUser")
	public void deleteUserView() {
		
	}
	
	// 회원탈퇴하기
	@PostMapping("/mypage/userDeleteForm")
	public String deleteUserAction(UserInfoVO vo, SessionStatus status, Model model) throws Exception {
		UserInfoVO user = userService.getUser(vo);
		
		
		if(user != null && vo.getUser_id().equals(user.getUser_id()) && vo.getPassword().equals(user.getPassword())) {
			mypageService.deleteUser(vo);
			status.setComplete();
			
			return "/alerts/deleteUserAlert";
		} else {
			model.addAttribute("message", "아이디 또는 비밀번호가 틀렸습니다.");
			return "/mypage/deleteUser";
		} 
		
	}
	
	
	
	// 내가 만든 모임 페이지로 이동
	@GetMapping("/mypage/ownedGroup")
	public void ownedGroupView(HttpSession session, Criteria cri, Model model) {

		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		List<Integer> group_seqs = mypageService.getGroupSeqForOwnedGroup(user.getUser_id());
		
		List<GroupInfoVO> groupList = new ArrayList<>();
		int total = 0;
		
		for(int group_seq : group_seqs) {
			cri.setGroup_seq(group_seq);
			groupList.add(mypageService.getGroupListForMypage(cri));
			total++;
		}
		System.out.println(groupList);
		model.addAttribute("groupList", groupList); //리스트객체 만들어서 add로 리스트 줄 세우고  그 리스트를 모델객체에 담아서 넘김
		
		System.out.println(total);
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
	
	}
	
	// 내가 가입한 모임 페이지로 이동
	@GetMapping("/mypage/joinedGroup")
	public void joinedGroupView(HttpSession session, Criteria cri, Model model) {
			
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		List<Integer> group_seqs = mypageService.getGroupSeqForJoinedGroup(user.getUser_id());
		
		List<GroupInfoVO> groupList = new ArrayList<>();
		
		for(int group_seq : group_seqs) {
			cri.setGroup_seq(group_seq);
			groupList.add(mypageService.getGroupListForMypage(cri));
		}
		System.out.println(groupList);
		model.addAttribute("groupList", groupList);
		
		int total = mypageService.getTotalGroupListForMypage(cri);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	// 관심있는 모임 페이지로 이동
	@GetMapping("/mypage/interestGroupList")
	public void interestGroupView(HttpSession session, Criteria cri, Model model) {
			
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		List<Integer> group_seqs = mypageService.getGroupSeqForInterestGroup(user.getUser_id());
		
		List<GroupInfoVO> groupList = new ArrayList<>();
		
		for(int group_seq : group_seqs) {
			cri.setGroup_seq(group_seq);
			groupList.add(mypageService.getGroupListForMypage(cri));
		}
		System.out.println(groupList);
		model.addAttribute("groupList", groupList);
		
		int total = mypageService.getTotalGroupListForMypage(cri);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	
	// 마이페이지 찜삭제
	@PostMapping("/mypage/deleteInterest")
	public String deleteInterest(@RequestParam("group_seq") int[] group_seq,InterestGroupVO vo, HttpSession session, Model model) {
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			
			for(int i=0; i<group_seq.length; i++) {
				vo.setUser_id(user.getUser_id());
				vo.setGroup_seq(group_seq[i]);
				groupService.deleteInterestGroup(vo);
			}
			
			/*
			if(groupService.getInterestGroup(vo) != null) {
				model.addAttribute("check", "checked");// 찜함
				System.out.println("찜한거");
			} else {
				model.addAttribute("check", "unchecked"); // 찜안함
			}
			
			return "redirect:/group/groupDetail?group_seq=" + vo.getGroup_seq();
			}
			*/
			
			return "redirect:/mypage/interestGroupList";
			
		}
	
	}
	
	
	
	
	
	
	
}
