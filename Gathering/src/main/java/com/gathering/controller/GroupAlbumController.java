package com.gathering.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.gathering.dto.AlbumVO;
import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.CrewVO;
import com.gathering.dto.GroupInfoVO;
import com.gathering.dto.UserInfoVO;
import com.gathering.mapper.AttachMapper;
import com.gathering.paging.Criteria;
import com.gathering.paging.PageMakerDTO;
import com.gathering.service.AlbumService;
import com.gathering.service.CommentsService;
import com.gathering.service.GroupNoticeService;
import com.gathering.service.GroupService;

@Controller
@SessionAttributes("user")
public class GroupAlbumController {
	private final Logger logger = LoggerFactory.getLogger("GroupAlbumController의 로그");
	@Autowired
	AlbumService albumService;
	@Autowired
	AttachMapper attachMapper;
	@Autowired
	GroupService groupService;
	@Autowired
	private GroupNoticeService groupNoticeService;
	@Autowired
	private CommentsService commentsService;

	
	public String fileSave(MultipartFile file) {

		String newFileName = "";

		if (file.getSize() != 0) {

			String originFileName = file.getOriginalFilename();
			long time = System.currentTimeMillis(); // 01241514545512
			// 중복방지 파일이름생성
			newFileName = String.format("%d_%s", time, originFileName);
			// 파일 저장 위치
			String fileSaveUrl = "c:/gatheringFileSave/";
			// 파일생성 c:/fileSave/1.jpg
			File f = new File(fileSaveUrl + newFileName);
			// 파일 업로드
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return newFileName;
	}

	// 앨범 페이지로
	@GetMapping("/group/groupAlbum")
	public String mainAlbumView( HttpSession session,CrewInfoVIewVO cVo,GroupInfoVO groupInfoVO, Model model, AlbumVO albumVO,Criteria cri,CrewVO vo) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");

		if (user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			
			//해당모임에 가입하지 않은 사람은 해당 게시물에 접근할 수 없음
			List<CrewInfoVIewVO> crew = groupNoticeService.getCrewList(groupInfoVO.getGroup_seq(), user.getUser_id());
			System.out.println("-------" + crew.toString() + "---------");
			if(crew.isEmpty()) {
				return "/alerts/mustJoinAlert";		
			} else {
				
			List<CrewInfoVIewVO> crewList = groupService.getGroupCrews(groupInfoVO.getGroup_seq());
			model.addAttribute("crewList", crewList);	
			
			GroupInfoVO group = groupService.getGroupDetail(groupInfoVO.getGroup_seq());
			model.addAttribute("group", group);

			List<AlbumVO> albumList = albumService.getAlbumListPaging(cri);

			model.addAttribute("albumList", albumList);
			
			HashMap<String, Object> map = new HashMap<String, Object> ();
			
			map.put("cri", cri);
			map.put("group_seq", groupInfoVO.getGroup_seq());
			
			int totals = albumService.getAlbumTotal(map);

			PageMakerDTO pageMaker = new PageMakerDTO(cri, totals);

			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("group", groupService.getGroupDetail(vo.getGroup_seq()));
			System.out.println(albumList);
			}
		}
		return "/group/groupAlbum";
	}

	// 등록페이지로 이동
	@GetMapping("/groupAlbumForm")
	public String AlbumAddForm(HttpSession session, AlbumVO albumVO,Model model) {

		UserInfoVO user = (UserInfoVO) session.getAttribute("user");

		if (user == null) {
			return "user/login";
		} else {
			
			
			System.out.println(albumVO);
			
			
			return "/group/groupAlbumForm";
		}
	}

	// 사진 등록
	@RequestMapping("/album_insert")
	public String albumInsert(HttpSession session,AlbumVO albumVO, @RequestPart MultipartFile file1, Model model) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
		
		
		// 파일이름 Vo 저장
		albumVO.setFilename(fileSave(file1));
		albumVO.setUser_id(user.getUser_id());
		albumService.InsertAlbum(albumVO);
		System.out.println(albumVO);
		return "/group/groupAlbumResult";
	}
	}
	// 앨범 댓글창으로 이동하기
	@GetMapping("/group/albumDetail")
	public String albumDetailView(HttpSession session,AlbumVO albumVO,Model model) {
		UserInfoVO user= (UserInfoVO)session.getAttribute("user");
		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {			
		List<CrewInfoVIewVO> crew=groupNoticeService.getCrewList(albumVO.getGroup_seq(), user.getUser_id());	 
		model.addAttribute("crewList",crew);
				
		AlbumVO albumInfo = albumService.albumDetail(albumVO.getGroup_album_seq());
		model.addAttribute("albumInfo", albumInfo);
		
		albumService.updateReplyCount(albumVO.getGroup_album_seq());
		System.out.println("크루 목록-----"+crew);
		System.out.println("앨범 정보------"+albumInfo);
		
		return "/group/groupAlbumDetail";
		}
	}

	//앨범 삭제하기
	@RequestMapping("/albumdelete")
	public String deleteAlbum(HttpSession session, AlbumVO albumVO,@RequestParam("group_album_seq")int album_group_seq) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");

		if(user == null) {
			return "/alerts/mustLoginAlert";
		} else {
			commentsService.AlbumdeleteComment(albumVO.getGroup_album_seq());
			
			albumService.deleteAlbum(album_group_seq);
			return "/group/groupAlbumResult";
		}
	}
	
	
	// 앨범 수정 창으로 이동하기
		@RequestMapping("/group/albumupdate")
		public String albumupdateForm(AlbumVO albumVO, Model model) {
			
			
			AlbumVO albumInfo = albumService.albumDetail(albumVO.getGroup_album_seq());

			model.addAttribute("albumInfo", albumInfo);

			System.out.println(albumInfo);

			return "/group/groupAlbumUpdate";

		}
	
	//앨범 수정하기 
	@RequestMapping("/albumupdate")
	public String albumupdateFormAction(HttpSession session,AlbumVO albumVO,@RequestPart MultipartFile file1,@RequestParam("group_album_seq")int album_group_seq) {
		UserInfoVO user = (UserInfoVO) session.getAttribute("user");

		if (user == null) {
			return "user/login";
		} else {
			albumVO.setFilename(fileSave(file1));
			albumService.updateAlbum(albumVO);
			
			return "redirect:/group/albumDetail?group_album_seq="+albumVO.getGroup_album_seq();
		}
	}
	
}
