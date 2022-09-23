package com.gathering.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.paging.Criteria;
import com.gathering.paging.PageMakerDTO;
import com.gathering.service.CommentsService;
import com.gathering.service.GroupNoticeService;
import com.gathering.service.GroupService;

@Controller
@SessionAttributes("user")
public class GroupNoticeController {

	@Autowired
	private GroupService groupService;
	
	@Autowired
	private GroupNoticeService groupNoticeService;
	
	@Autowired
	private CommentsService commentsService;
	
	// 그룹내 공지리스트  페이지로 이동
		@GetMapping("/group/groupNoticeListView")
		public String getGroupList(HttpSession session, CrewInfoVIewVO cVo, Criteria cri, GroupInfoVO vo, Model model) {
			
			UserInfoVO user= (UserInfoVO)session.getAttribute("user");
			
			if(user == null) {
				return "/alerts/mustLoginAlert";
			} else {							
				
				//해당모임에 가입하지 않은 사람은 해당 게시물에 접근할 수 없음
				List<CrewInfoVIewVO> crew = groupNoticeService.getCrewList(vo.getGroup_seq(), user.getUser_id());
				System.out.println("-------" + crew.toString() + "---------");
				if(crew.isEmpty()) {
					return "/alerts/mustJoinAlert";		
				} else {
					
				// 해당모임에 가입된 사람이면 실행	
				
				//크루뷰에서 모임에 가입된 사람들 정보를 가져와서 모델에 넘김 
				List<CrewInfoVIewVO> crewList = groupService.getGroupCrews(vo.getGroup_seq());
				model.addAttribute("crewList", crewList);	
				
				GroupInfoVO group = groupService.getGroupDetail(vo.getGroup_seq());
				model.addAttribute("group", group);
				
				//그룹내 공지 리스트 출력
				List<GroupNoticeVO> groupNotice = groupNoticeService.getListPaging(cri);			
				
				System.out.println(groupNotice.toString());
				model.addAttribute("groupNotice", groupNotice);
				
				//해당 공지 시퀀스와 cri를 매개변수 2개로 받아서 총 게시물 수 출력 ( 매개변수 2개라서 map으로 받아옴)
				HashMap<String, Object> map = new HashMap<String, Object> ();
				
				map.put("cri", cri);
				map.put("group_seq", vo.getGroup_seq());
				
				int total = groupNoticeService.getTotal(map);
				
				System.out.println("----------" +total+"-----------");
				PageMakerDTO pageMaker = new PageMakerDTO(cri,total );

				model.addAttribute("pageMaker", pageMaker);
				
				return "/group/groupNoticeList";
			}
		}
		}	
		
	//그룹내 공지 등록페이지 이동
		@GetMapping("/groupNoticeInsert")
		public String groupInsertView(HttpSession session, GroupInfoVO vo, Model model) {
			
			UserInfoVO user= (UserInfoVO)session.getAttribute("user");
			
			if(user == null) {
				return "/alerts/mustLoginAlert";
			} else {
				
				GroupInfoVO group = groupService.getGroupDetail(vo.getGroup_seq());
			
				
				model.addAttribute("group", group);
				
				return "/group/groupNoticeInsertForm";
			}
		}
		
	//그룹공지 등록 처리
		@PostMapping("/groupNoticeInsertAction")
		public String insertGroupNotice(@RequestParam(value="address" ,required=false) String jungmo_place,
																	@RequestParam(value="image") MultipartFile uploadFile, 
																	GroupInfoVO vo, GroupNoticeVO noticeVo, HttpSession session, Model model)throws Exception {
			
			UserInfoVO user = (UserInfoVO)session.getAttribute("user");
			
			if(user== null) {
					return "/alerts/mustLoginAlert";
			} else {
				
					noticeVo.setGroup_seq(vo.getGroup_seq());
					
					 if (!uploadFile.isEmpty()) {
			             String fileName = uploadFile.getOriginalFilename();
			             noticeVo.setFilename(fileName);
        
			             // 이미지 파일을 이동할 실제 경로 구하기
			             String image_path = session.getServletContext().getRealPath("/images/");
			             
			             try {
			             uploadFile.transferTo(new File(image_path+fileName));
			          } catch (IllegalStateException  | IOException e) {
			             e.printStackTrace();
			          } 
			       }	
					
					if(jungmo_place != null) {
					noticeVo.setJungmo_place(jungmo_place);
					groupNoticeService.insertGroupNotice(noticeVo);
					} else {
					groupNoticeService.insertGroupNotice(noticeVo);
					model.addAttribute("groupNotice", noticeVo);
					}
						
					System.out.println(noticeVo.toString());
					return "redirect:group/groupNoticeListView?group_seq="+vo.getGroup_seq();
			}
		}
		
		
		
		//공지 상세 이동
		@GetMapping("group/groupNoticeViewAction")
		public String qnaView (GroupNoticeVO vo, GroupInfoVO gVo, Model model, HttpSession session) {	

				UserInfoVO user = (UserInfoVO)session.getAttribute("user");
				
				if(user== null) {
					return "/alerts/mustLoginAlert";
						
				} 					
					//해당그룹 정보
					GroupInfoVO group = groupService.getGroupDetail(vo.getGroup_seq());
					model.addAttribute("group", group);
					
					//모임장 체크를위한 모임원 정보
					List<CrewInfoVIewVO> crewList = groupService.getGroupCrews(vo.getGroup_seq());
					model.addAttribute("crewList", crewList);
					
					GroupNoticeVO groupNotice = groupNoticeService.groupNoticeView(vo.getGroup_notice_seq());		
					
					groupNoticeService.groupNoticeViewCount(vo.getGroup_notice_seq());
					
					model.addAttribute("groupNotice", groupNotice);
								
					return "/group/groupNoticeView";
		
		}		
		
		
		//그룹공지 수정폼 이동
		@GetMapping("/group/groupNoticeUpdateForm")
		public String groupNoticeUpdateFrom(HttpSession session, Model model, GroupNoticeVO vo, GroupInfoVO gVo) {
			
			UserInfoVO user= (UserInfoVO)session.getAttribute("user");
			
			if(user == null) {
				return "/alerts/mustLoginAlert";
			} else {
					
				GroupNoticeVO groupNotice = groupNoticeService.groupNoticeView(vo.getGroup_notice_seq());
				GroupInfoVO group = groupService.getGroupDetail(gVo.getGroup_seq());
				
				model.addAttribute("groupNotice", groupNotice);
				model.addAttribute("group", group);
					
					return "/group/groupNoticeUpdateForm"; 
			}
		}
		
		
		
		//공지 수정처리
		@PostMapping("/groupNoticeUpdateAction")
		public String updateGroupNotice(@RequestParam(value="address" ,required=false) String jungmo_place,
																	@RequestParam(value="image") MultipartFile uploadFile, 		
																	GroupNoticeVO vo, GroupInfoVO gVo,  HttpSession session)  throws Exception{
			
			UserInfoVO user = (UserInfoVO)session.getAttribute("user");
			
			if(user== null) {
				return "/alerts/mustLoginAlert";
			} else {

						 if (!uploadFile.isEmpty()) {
				             String fileName = uploadFile.getOriginalFilename();
				             vo.setFilename(fileName);
		   
				             // 이미지 파일을 이동할 실제 경로 구하기
				             String image_path = session.getServletContext().getRealPath("/images/");
				             
				             try {
				             uploadFile.transferTo(new File(image_path+fileName));
				          } catch (IllegalStateException  | IOException e) {
				             e.printStackTrace();
				          } 
				       }	
									 
						if(jungmo_place != null) {
						vo.setJungmo_place(jungmo_place);
						groupNoticeService.updateGroupNotice(vo);
						} else {
						groupNoticeService.updateGroupNotice(vo);				
						}
				
					return "redirect:group/groupNoticeListView?group_seq="+gVo.getGroup_seq();
			}
		}
		
		
		
		//공지 삭제폼 이동
		@GetMapping("/groupNoticeDeleteForm")
		public String groupNoticeDeleteFrom(HttpSession session, Model model, GroupNoticeVO vo, GroupInfoVO gVo) {
			
			UserInfoVO user= (UserInfoVO)session.getAttribute("user");
			
			if(user == null) {
				return "/alerts/mustLoginAlert";
			} else {
					
					GroupNoticeVO groupNotice = groupNoticeService.groupNoticeView(vo.getGroup_notice_seq());
					model.addAttribute("groupNotice", groupNotice);
					
					GroupInfoVO group = groupService.getGroupDetail(gVo.getGroup_seq());
					model.addAttribute("group", group);
					
					return "group/groupNoticeDeleteForm"; 
			}
		}
		
		
		
		//공지 삭제처리
		@PostMapping("/groupNoticeDelete")
		public String groupNoticeDelete(@RequestParam(value="userPwd") String pwd, GroupInfoVO group_seq, GroupNoticeVO vo, Model model, HttpSession session) {
			
			UserInfoVO user= (UserInfoVO)session.getAttribute("user");
					
			if(user == null) {
				return "/alerts/mustLoginAlert";
			} else {
				
					if(user.getPassword().equals(pwd)) {	//로그인상태 사용자 비번과 입력비번값 비교
		
						commentsService.deleteComment(vo.getGroup_notice_seq());	//해당 문의글에 댓글이 묶여있음,, 댓글 먼저 삭제처리
						groupNoticeService.deleteGroupNotice(vo.getGroup_notice_seq());
			
						return  "redirect:group/groupNoticeListView?group_seq="+group_seq.getGroup_seq();
						
						
					} else {
						
						model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
						return "group/groupNoticeDeleteForm";
					}
				}
		}
		
}



















