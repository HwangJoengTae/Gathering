package com.gathering.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.gathering.dto.QnaVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.paging.Criteria;
import com.gathering.paging.PageMakerDTO;
import com.gathering.service.CommentsService;
import com.gathering.service.QnaService;

@Controller
@SessionAttributes("user")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private CommentsService commentsService;
	
	/* Q&A 게시판 리스트(페이징, 검색 제외)
	@GetMapping("/qna/qnaList")
	public String getQnaList(Model model) {
		
		List<QnaVO> qnaList = qnaService.getQnaList();
		
		System.out.println(qnaList.toString());
		model.addAttribute("qnaList", qnaList);
		
		return "qna/qnaList";
			
	}
	 */	
	
	//Q&A 게시판 리스트(페이징, 검색 )
	@GetMapping("/qna/qnaList")
	public String getQnaList(Model model, Criteria cri) {
		
		List<QnaVO> qnaList = qnaService.getListPaging(cri);

		System.out.println(qnaList.toString());
		model.addAttribute("qnaList", qnaList);
		
		int total = qnaService.getTotal(cri);

		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
		
		return "qna/qnaList";
			
	}

	//자주묻는질문(frequentlyQna)이동
	@GetMapping("/qna/frequentlyQna")
	public void getFrequentlyQnaView() {	
	}
	

	// 나의질문 리스트
	@GetMapping("/qna/myQnaList")
	public String getMyQnaList(Model model, HttpSession session, Criteria cri) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {

			List<QnaVO> qnaList = qnaService.getListPaging(cri);

			System.out.println(qnaList.toString());
			model.addAttribute("qnaList", qnaList);
			
			int total = qnaService.getTotal(cri);

			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

			model.addAttribute("pageMaker", pageMaker);
			
			return "qna/myQnaList";
		}
	}
	
	//Qna 글쓰기 폼 이동
	@GetMapping("/qnaInsertForm")
	public String qnaInsertFrom(HttpSession session) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			
				return "qna/qnaInsertForm"; 
		}
	}
	
	//Qna 글쓰기 처리
	@PostMapping("/qna_insert")
	public String insertQna(QnaVO vo, HttpSession session) {
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		
		if(user== null) {
			return "/alerts/mustLoginAlert";
		} else {
			
				vo.setUser_id(user.getUser_id());
				qnaService.insertQna(vo);
				
				System.out.println(vo.toString());
				return "redirect:qna/qnaList";
		}
	}
	
	
	//Qna 상세
	@GetMapping("qna/qna_view")
	public String qnaView (QnaVO vo, Model model, HttpSession session) {	

			QnaVO qna = qnaService.getQnaView(vo.getQna_seq());
			
			UserInfoVO user = (UserInfoVO)session.getAttribute("user");
			
			if(user== null) {
				return "/alerts/mustLoginAlert";
					
			} else if(qna.getPassword() != null){		//해당게시글 공개 or비공개 체크 
				
					if(user.getUser_id().equals(qna.getUser_id())) {	//자신의 게시물 비공개에 대해선 pass
						
						qnaService.qnaViewCount(vo.getQna_seq());
						model.addAttribute("qnaVO", qna);
						
						return "qna/qnaView";
						
					} else {
				
					model.addAttribute("qnaVO", qna);
					
					return "qna/qnaPwdCheck";
					}
			} else {
				
				qnaService.qnaViewCount(vo.getQna_seq());
				model.addAttribute("qnaVO", qna);
				
				return "qna/qnaView";
			
			}								
	}
		


	
	//Qna 비공개 비밀번호 체크 페이지 이동
	@GetMapping("qna/qnaPwdCheck")
	public String qnaPwdCheckView(QnaVO vo, Model model) {
		
			QnaVO qna = qnaService.getQnaView(vo.getQna_seq());
			//비밀번호 체크페이지에 qnaVO속성명 전달
			model.addAttribute("qnaVO",qna);
			
			return "qna/qnaPwdCheck";
	}
	
	
	//Qna 비공개 비밀번호 체크
	@PostMapping("/qnaPwdCheck")
	public String qnaPwdCheck(@RequestParam(value="qnaPwd") String pwd,QnaVO vo, Model model) {
		
			QnaVO qna = qnaService.getQnaView(vo.getQna_seq());
		
			if(qna.getPassword().equals(pwd)) {	//쿼리스트링으로 받은 QnaVO 비번과 리퀘스트파람 밸류값 문자열 비교
				
				qnaService.qnaViewCount(vo.getQna_seq());
				model.addAttribute("qnaVO", qna);
				return "qna/qnaView";
				
			} else {
				
				model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
				return "qna/qnaPwdCheck";
			}
	}
	
	
	//Qna 수정폼 이동
	@GetMapping("/qnaUpdateForm")
	public String qnaUpdateFrom(HttpSession session, Model model, QnaVO vo) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
				
				QnaVO qna = qnaService.getQnaView(vo.getQna_seq());
				model.addAttribute("qnaVO", qna);
				
				return "qna/qnaUpdateForm"; 
		}
	}
	
	
	//Qna 수정처리
	@PostMapping("/qna_update")
	public String updateQna(QnaVO vo, HttpSession session) {
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		
		if(user== null) {
			return "/alerts/mustLoginAlert";
		} else {
			
				vo.setUser_id(user.getUser_id());
				System.out.println(vo.toString());
				qnaService.updateQna(vo);

				System.out.println(vo.toString());
				return "redirect:qna/qnaList";
		}
	}
	
	
	//Qna 삭제폼 이동
	@GetMapping("/qnaDeleteForm")
	public String qnaDeleteFrom(HttpSession session, Model model, QnaVO vo) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
				
				QnaVO qna = qnaService.getQnaView(vo.getQna_seq());
				model.addAttribute("qnaVO", qna);
				
				return "qna/qnaDeleteForm"; 
		}
	}
	
	
	//Qna 삭제처리
	@PostMapping("/qnaDelete")
	public String qnaDelete(@RequestParam(value="userPwd") String pwd,QnaVO vo, Model model, HttpSession session) {
		
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
				
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			
				if(user.getPassword().equals(pwd)) {	//로그인상태 사용자 비번과 입력비번값 비교
	
					commentsService.deleteComment(vo.getQna_seq());	//해당 문의글에 댓글이 묶여있음,, 댓글 먼저 삭제처리
					qnaService.deleteQna(vo.getQna_seq());
		
					return  "redirect:qna/qnaList";
					
					
				} else {
					
					model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
					return "qna/qnaDeleteForm";
				}
			}
	}
	
	

}


















