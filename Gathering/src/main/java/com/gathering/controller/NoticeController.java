package com.gathering.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gathering.dto.FilesVO;
import com.gathering.dto.NoticeVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.mapper.AttachMapper;
import com.gathering.service.NoticeService;
import com.gathering.service.UserService;
import com.gathering.util.Criteria;
import com.gathering.util.PageMakerDTO;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class NoticeController {
	
	

	@Autowired
	NoticeService noticeService;
	@Autowired
	UserService userService;
	@Autowired
	private AttachMapper attachMapper;

	// 게시글 목록 + 페이지 적용
	@GetMapping(value = "/notice/noticeList")
	public String list(Criteria cri, Model model) {
		
		List<NoticeVO> noticeList = noticeService.getListPaging(cri);
		model.addAttribute("noticeList", noticeList);
		
		int total = noticeService.getTotal(cri);

		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
		
		
		
		return "/notice/noticeList";
	}

	// 공지 등록폼 이동
	@GetMapping("/notice/noticeForm")
	public String noticeCreate(NoticeVO noticeVO) {
		log.info(noticeVO);
		return "/notice/noticeForm";

	}

	// 공지 등록하기
	@PostMapping("/insertNotice")
	public String noticeInsert(NoticeVO noticeVO, HttpSession session) {
		log.info("notice....." + noticeVO);
		log.info("요청된 세션 정보는.....: "+session);
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		noticeVO.setUser_id(user.getUser_id());
		noticeService.InsertNotice(noticeVO);
		
		return "redirect:notice/noticeList"; //redirect 요청을 해서 새롭게 게시글리스트 출력
	}

	// 공지 상세보기
	@GetMapping(value = "/notice/noticeDetail")
	public String noticeDetail(@RequestParam("notice_seq") int notice_seq, Model model, Criteria cri) {
		log.info("요청된 notice_seq는 : [ " + notice_seq+" ] 입니다.");
		NoticeVO noticeInfo = noticeService.getNotice(notice_seq);
		noticeService.noticeViewCount(notice_seq);
		model.addAttribute("noticeInfo", noticeInfo);
		model.addAttribute("cri", cri);
		

		return "/notice/noticeDetail";
	}

	// 공지 수정이동
	@GetMapping(value = "/notice/noticeUpdate")
	public String update(@ModelAttribute("searchVO") NoticeVO searchVO, @RequestParam("notice_seq") int notice_seq,
			Model model) {

		NoticeVO noticeInfo = noticeService.getNotice(notice_seq);
		model.addAttribute("noticeInfo", noticeInfo);
		model.addAttribute("cri", searchVO);
		

		return "/notice/noticeUpdate";
	}

	// 공지 수정
	@PostMapping(value = "/notice/update_action")
	public String update_action(@ModelAttribute("searchVO") NoticeVO searchVO, HttpServletRequest request,
								RedirectAttributes redirect, Model model) {

		noticeService.updateNotice(searchVO);
		redirect.addFlashAttribute("result", "modify sucess");
		System.out.println("내용값 확인" + searchVO.getContent());

		return "redirect:/notice/noticeDetail?notice_seq=" + searchVO.getNotice_seq();
	}

	// 공지삭제
	@GetMapping(value = "/notice/delete")
	public String delete(@ModelAttribute("searchVO") NoticeVO searchVO, @RequestParam("notice_seq") int notice_seq,
			RedirectAttributes redirect, Model model) {

		try {

			noticeService.deleteNotice(notice_seq);
			redirect.addFlashAttribute("msg", "삭제가 완료되었습니다.");

		} catch (Exception e) {
			redirect.addFlashAttribute("msg", "오류가 발생되었습니다.");

		}

		return "redirect:/notice/noticeList";
	}

	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		log.info("deleteFile........" + fileName);
		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			log.info("originFileName : " + originFileName);

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	// 이미지 파일 업로드 연결 페이지
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		log.info("getImage() : " + fileName);
		File file = new File("c:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 상세보기 이미지 띄우기 정보 반환
	/* 이미지 정보 반환 */
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<FilesVO>> getAttachList(int notice_seq) {
		log.info("요청된 getAttachList 번호는 : [ " + notice_seq+" ] 입니다.");
		

		return new ResponseEntity<List<FilesVO>>(attachMapper.getAttachList(notice_seq), HttpStatus.OK);

	}

}
