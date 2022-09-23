package com.gathering.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gathering.dto.CrewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.InterestGroupVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.paging.Criteria;
import com.gathering.paging.PageMakerDTO;
import com.gathering.service.GroupService;
import com.gathering.service.UserService;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private UserService userService;
	
	
	// 모임만들기 페이지로 이동
	@GetMapping("/group/createGroup")
	public String createGroupView(HttpSession session) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			return "/group/createGroup";
		}
	}
	
	// 모임 만들기 
	@PostMapping("/group/creatNewGroup")
	public String createGroupAction(GroupInfoVO vo, Model model, HttpSession session) {
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			groupService.createNewGroup(vo);
			GroupInfoVO group = groupService.getGroupByGroupName(vo);
			
			model.addAttribute("group_seq", group.getGroup_seq());
			System.out.println(group);
			return "/group/joinForLeader";
		}	
	}
	@PostMapping("/group/joinForLeader") // 모임장사진 등록
	public String joinForLeader(CrewVO vo, HttpSession session, @RequestParam(value="group_seq") int group_seq, @RequestParam("image") MultipartFile uploadFile, Model model) {

		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setCrew_image(fileName);
			
			String image_path = session.getServletContext().getRealPath("/images/");
			
			try {
				uploadFile.transferTo(new File(image_path + fileName));
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		
		vo.setUser_id(user.getUser_id());
		vo.setGroup_seq(group_seq);
		vo.setType("1");
		
		groupService.insertCrewLeader(vo);
		System.out.println(vo);
		model.addAttribute("group_seq", group_seq);
		
		return "/alerts/createGroupComplete";
	}
	
	
	
	
	
	// 모임명 중복체크하기
	@RequestMapping("/group/groupName_check_form")
	public String groupNameCheck(GroupInfoVO vo, Model model) {
		
		
		int result = 0;
			
		if(groupService.getGroupByGroupName(vo) != null) {
			result = 1;
		} else {
			result = -1;
		}
		model.addAttribute("group_name", vo.getGroup_name());
		model.addAttribute("message", result);
		
		return "/group/groupNameCheck";
	}
	
	
	// 활동중인모임리스트로 이동
	@GetMapping("/group/groupList")
	public String getGroupList(Model model, Criteria cri) {
		cri.setAmount(9);
		List<GroupInfoVO> groupList = groupService.getGroupListPaging(cri);
		
		model.addAttribute("groupList", groupList);
		
		int total = groupService.getTotalCount(cri);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/group/groupList";		
	}
	
	
	// 모임상세보기로 이동
	@GetMapping("/group/groupDetail")
	public void getGroupDetail(CrewVO vo, Model model, HttpSession session) {
		
		
		model.addAttribute("group", groupService.getGroupDetail(vo.getGroup_seq()));
		model.addAttribute("jungmoList", groupService.getGroupJungmo(vo.getGroup_seq()));
		model.addAttribute("crewList", groupService.getGroupCrews(vo.getGroup_seq()));
		
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		if(user != null) {
			vo.setUser_id(user.getUser_id());
			if(groupService.getCrew(vo) == null) {
				model.addAttribute("result", 1); // 해당 모임에 가입안됨
				// 해당모임 찜했는지 확인
				InterestGroupVO interestGroup = new InterestGroupVO();
				interestGroup.setGroup_seq(vo.getGroup_seq());
				interestGroup.setUser_id(user.getUser_id());
				if(groupService.getInterestGroup(interestGroup) != null) {
					// 해당모임 찜함
					model.addAttribute("check", "checked");
				}
			} else {
				// 해당 모임에 가입됨
				model.addAttribute("joinedCrew", groupService.getCrew(vo));
			}
		} else {
			model.addAttribute("result", 1);
		}
		
	}
	
	// 모임가입하기로 이동
	@GetMapping("/group/joinGroup")
	public String joinGroupView(HttpSession session, @RequestParam("group_seq") int group_seq, Model model) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			model.addAttribute("group", groupService.getGroupDetail(group_seq));
			model.addAttribute("user", user);
			return "/group/joinGroup";
		}
	}

	
	// 모임 가입하기
	@PostMapping("/group/joinGroup")
	public String joinGroupAction(CrewVO vo, @RequestParam("image") MultipartFile uploadFile, HttpSession session) {
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setCrew_image(fileName);
			
			String image_path = session.getServletContext().getRealPath("/images/");
			
			try {
				uploadFile.transferTo(new File(image_path + fileName));
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		vo.setType("2");
		groupService.insertCrewMember(vo);
		return "redirect:/group/groupDetail?group_seq=" + vo.getGroup_seq();
	}
	
	
	// 모임 탈퇴하기
	@GetMapping("/group/outGroup")
	public String outGroup(HttpSession session, CrewVO vo) {
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		vo.setUser_id(user.getUser_id());
		groupService.outGroupFromTable(vo);
		groupService.outGroupFromView(vo);
		
		return "redirect:/group/groupDetail?group_seq=" + vo.getGroup_seq();
	}
	
	
	// 모임 수정페이지로 이동
	@GetMapping("/group/updateGroupInfo")
	public void updateGroupInfoVIew(@RequestParam("group_seq") int group_seq, Model model) {
		model.addAttribute("group", groupService.getGroupDetail(group_seq));
	}
	
	// 모임수정하기
	@PostMapping("/group/updateGroupInfo")
	public String updateGroupInfoAction(GroupInfoVO vo) {
		groupService.updateGroupInfo(vo);
		
		return "redirect:/group/groupDetail?group_seq=" + vo.getGroup_seq();
	}
	
	// 모임삭제확인페이지로 이동
	@GetMapping("/group/deleteGroupInfo")
	public void deleteGroupInfoCheck(GroupInfoVO vo, Model model) {
		
		model.addAttribute("group", groupService.getGroupDetail(vo.getGroup_seq()));
	}
	
	// 모임삭제하기
	@PostMapping("/group/deleteGroupForm")
	public String deleteGroupInfo(UserInfoVO vo, CrewVO crew, Model model ) {
		
		UserInfoVO user = userService.getUser(vo);
	
		
		if(user != null && vo.getUser_id().equals(user.getUser_id()) && vo.getPassword().equals(user.getPassword())) {
			groupService.deleteGroupInfo(crew.getGroup_seq());
			groupService.outGroupFromTable(crew);
			groupService.outGroupFromView(crew);
			
			return "/alerts/deleteGroupAlert";
		} else {
			model.addAttribute("group", groupService.getGroupDetail(crew.getGroup_seq()));
			model.addAttribute("message", "아이디 또는 비밀번호가 틀렸습니다.");
			return "/group/deleteGroupInfo";
		} 
	}
	
	
	
	// 찜하기
	@GetMapping("/group/addInterest")
	public String addInterest(InterestGroupVO vo, HttpSession session, Model model) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			vo.setUser_id(user.getUser_id());
			groupService.addInterestGroup(vo);
			
			if(groupService.getInterestGroup(vo) != null) {
				model.addAttribute("check", "checked");// 찜함
				System.out.println("찜한거");
			} else {
				model.addAttribute("check", "unchecked"); // 찜안함
			}
			
			return "redirect:/group/groupDetail?group_seq=" + vo.getGroup_seq();
		}
	}
	
	// 찜삭제
	@GetMapping("/group/deleteInterest")
	public String deleteInterest(InterestGroupVO vo, HttpSession session, Model model) {
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			vo.setUser_id(user.getUser_id());
			groupService.deleteInterestGroup(vo);
			
			if(groupService.getInterestGroup(vo) != null) {
				model.addAttribute("check", "checked");// 찜함
				System.out.println("찜한거");
			} else {
				model.addAttribute("check", "unchecked"); // 찜안함
			}
			
			return "redirect:/group/groupDetail?group_seq=" + vo.getGroup_seq();
		}
	}
	
	
	
	
	


















}