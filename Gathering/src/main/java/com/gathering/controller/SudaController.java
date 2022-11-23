package com.gathering.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.SudaVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.paging.Criteria;
import com.gathering.paging.PageMakerDTO;
import com.gathering.service.CommentsService;
import com.gathering.service.GroupNoticeService;
import com.gathering.service.GroupService;
import com.gathering.service.SudaService;

@SessionAttributes("user")
@Controller
public class SudaController {
	private final Logger logger = LoggerFactory.getLogger("SudaController의 로그");

	@Autowired
	private SudaService sudaService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private GroupNoticeService groupNoticeService;
	
	@Autowired
	private CommentsService commentsService;
	

////////////////////////////////////////////////////////////////
	/*
	// 수다방 리스트
	@GetMapping("/group/groupSuda")
	public String getsudaList(HttpSession session,Model model,SudaVO sudaVO) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		logger.info("수다리스트");
		if (user == null) {
			return "user/login";
		} else {
			List<SudaVO> suda=sudaService.getSudaList(sudaVO);
			model.addAttribute("sudaList",suda);
			System.out.println(suda);
			return "/group/groupSuda";

		}
	}
	*/
	
	@GetMapping("/group/groupSuda")
	public String getsudaList(HttpSession session,CrewInfoVIewVO cVo,Model model,Criteria cri,GroupInfoVO vo,SudaVO sudaVO) {
		logger.info("수다리스트");
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
							
			List<SudaVO> suda =sudaService.getListPaging(cri);
			model.addAttribute("sudaList",suda);
			
			
			int total = sudaService.getTotal(cri);

			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

			model.addAttribute("pageMaker", pageMaker);
			
			
			
			System.out.println(suda);
			
			return "/group/groupSuda";

			}
	}
	}


	// 수다 등록폼 이동
	@RequestMapping("/group/sudaForm")
	public String noticeCreate(HttpSession session,SudaVO sudaVO,Model model) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");

		if (user == null) {
			return "user/login";
		} else {
			//크루 관련 group_seq 와 user_id 얻어오기 
			List<CrewInfoVIewVO> crew=groupNoticeService.getCrewList(sudaVO.getGroup_seq(), user.getUser_id());	 
			model.addAttribute("crewList",crew);
			
		return "/group/groupSudaForm";
		}
	}

	// 수다 주제 등록하기
	@RequestMapping("/insertSuda")
	public String sudaInsert(HttpSession session,Model model, SudaVO sudaVO) {
			UserInfoVO user = (UserInfoVO) session.getAttribute("user");
			if (user == null) {
				return "user/login";

			} else {
			sudaVO.setUser_id(user.getUser_id());
			sudaVO.setGroup_seq(sudaVO.getGroup_seq());
			
			int crew_seq = sudaService.getCrewSeq(sudaVO);
			
			sudaVO.setCrew_seq(crew_seq);
			
			
			System.out.println("수다insert"+sudaVO);
			
			sudaService.insertSuda(sudaVO);

			System.out.println(sudaVO);
			return "redirect:/group/groupSuda?group_seq="+sudaVO.getGroup_seq();
		}

	}

	// 수다 상세 보기
	@GetMapping("/sudaDetail")
	public String sudaDetail(SudaVO sudaVO, HttpSession session,Model model) {
		SudaVO suda = sudaService.getSudaView(sudaVO.getSuda_seq());
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");

		if (user == null) {
			return "user/login";

		} else {
			//크루 불러오기
			List<CrewInfoVIewVO> crew=groupNoticeService.getCrewList(sudaVO.getGroup_seq(), user.getUser_id());	 
			
			model.addAttribute("crewList",crew);
			//수다 게시글 정보 			
			model.addAttribute("sudaInfo",suda);
			
			sudaService.updateReplyCount(sudaVO.getSuda_seq());
			
			System.out.println(suda);
			return "/group/groupSudaDetail";
		}

	}
	
	//수다 삭제하기
	@PostMapping("/sudadelete")
	public String sudaDelete(HttpSession session, SudaVO sudaVO,Model model) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");

			if (user == null) {
				return "user/login";
			} else {
				commentsService.SudadeleteComment(sudaVO.getSuda_seq());	//해당 문의글에 댓글이 묶여있음,, 댓글 먼저 삭제처리
				sudaService.deleteSuda(sudaVO.getSuda_seq());
				return "/group/groupAlbumResult";
			}
		}
	
		 
		//수다 수정창 이동하기	
		@GetMapping("/sudaUpdateForm")
		public String sudaUpdate(SudaVO sudaVO, HttpSession session,Model model) {
			
			UserInfoVO user = (UserInfoVO) session.getAttribute("user");

			if (user == null) {
				return "user/login";

			} else {
				SudaVO suda = sudaService.getSudaView(sudaVO.getSuda_seq());
				model.addAttribute("sudaInfo",suda);
				System.out.println("이동"+suda);
				return "/group/groupSudaUpdateForm";
			}

		}
	
	
		//수다 수정하기 
		@PostMapping("/sudaUpdate")
		public String sudaUpdateAction(SudaVO sudaVO, HttpSession session,Model model) {
			
			UserInfoVO user = (UserInfoVO) session.getAttribute("user");

			if (user == null) {
				return "user/login";

			} else {
				sudaService.updateSuda(sudaVO);
				
				System.out.println(sudaVO);
				return "/group/groupAlbumResult";
			}

		}
	

}
