package com.gathering.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gathering.dto.CommentsVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.dto.QnaVO;
import com.gathering.dto.SudaVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.service.CommentsService;

@RestController
public class CommentsController {
	
	@Autowired
	private CommentsService commentsService;

	//Qna 댓글 저장
	@PostMapping("/comments_insert")
	public String insertQna(QnaVO qVo, CommentsVO vo, HttpSession session) {
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		
		if(user== null) {
				return "user/login";
		} else {
				vo.setUser_id(user.getUser_id());
				vo.setQna_seq(qVo.getQna_seq());
				
				if(commentsService.insertComment(vo) > 0) {
		            return "success";
		         } else {
		            return "fail";
		         }
	  }
}
	
	//Qna리스트 
	@GetMapping(value="/commnets_list", produces="application/json; charset=UTF-8")
	public Map<String, Object> commentsList(CommentsVO vo,  HttpSession session) {
		

		//화면으로 반환할 데이터를 저장할 Map 작성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 상품에 대한 댓글 목록 조회
		List<CommentsVO> commentList = commentsService.commentList(vo.getQna_seq());

		map.put("commentList", commentList);
		
		return map;
			
	}
	
	
	
	//------------ 그룹 공지 댓글 파트 ----------------//
	
	
	//댓글 저장
	@PostMapping("/group_comments_insert")
	public String GroupInsertQna(GroupNoticeVO gVo, CommentsVO vo, HttpSession session) {
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		
		if(user== null) {
				return "user/login";
		} else {
				vo.setUser_id(user.getUser_id());
				vo.setGroup_notice_seq(gVo.getGroup_notice_seq());
				
				if(commentsService.groupInsertComment(vo) > 0) {
		            return "success";
		         } else {
		            return "fail";
		         }
	  }
}
	
	//리스트 
	@GetMapping(value="/group_commnets_list", produces="application/json; charset=UTF-8")
	public Map<String, Object> groupCommentsList(CommentsVO vo,  HttpSession session) {
		
		//화면으로 반환할 데이터를 저장할 Map 작성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 상품에 대한 댓글 목록 조회
		List<CommentsVO> commentList = commentsService.groupCommentList(vo.getGroup_notice_seq());

		map.put("commentList", commentList);
		
		return map;
			
	}
	
	
	///앨범 댓글//
	

		//수다 댓글 저장
		@PostMapping("/Album_comments_insert")
		public String insertAlbum(SudaVO sudaVO, CommentsVO vo, HttpSession session) {
			
			UserInfoVO user = (UserInfoVO)session.getAttribute("user");
			
			if(user== null) {
					return "user/login";
			} else {
					vo.setUser_id(user.getUser_id());
					
					vo.setGroup_album_seq(vo.getGroup_album_seq());
					if(commentsService.AlbumInsertComment(vo) > 0) {
			            return "success";
			         } else {
			            return "fail";
			         }
		  }
	}
		
		//수다 리스트 
		@GetMapping(value="/Album_commnets_list", produces="application/json; charset=UTF-8")
		public Map<String, Object> AlbumcommentsList(CommentsVO vo,  HttpSession session) {
			

			//화면으로 반환할 데이터를 저장할 Map 작성
			Map<String, Object> map = new HashMap<String, Object>();
			
			// 상품에 대한 댓글 목록 조회
			List<CommentsVO> commentList = commentsService.AlbumcommentList(vo.getGroup_album_seq());

			map.put("commentList", commentList);
			
			return map;
				
		}
	

	
	///수다 댓글//
	

	//수다 댓글 저장
	@PostMapping("/Suda_comments_insert")
	public String insertSuda(SudaVO sudaVO, CommentsVO vo, HttpSession session) {
		
		UserInfoVO user = (UserInfoVO)session.getAttribute("user");
		
		if(user== null) {
				return "user/login";
		} else {
				vo.setUser_id(user.getUser_id());
				
				vo.setSuda_seq(sudaVO.getSuda_seq());
				if(commentsService.SudaInsertComment(vo) > 0) {
		            return "success";
		         } else {
		            return "fail";
		         }
	  }
}
	
	//수다 리스트 
	@GetMapping(value="/Suda_commnets_list", produces="application/json; charset=UTF-8")
	public Map<String, Object> SudacommentsList(CommentsVO vo,  HttpSession session) {
		

		//화면으로 반환할 데이터를 저장할 Map 작성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 상품에 대한 댓글 목록 조회
		List<CommentsVO> commentList = commentsService.SudacommentList(vo.getSuda_seq());

		map.put("commentList", commentList);
		
		return map;
			
	}
	
}






















