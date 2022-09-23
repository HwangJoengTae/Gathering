package com.gathering.mapper;



import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gathering.dto.CrewInfoVIewVO;
import com.gathering.dto.GroupNoticeVO;
import com.gathering.paging.Criteria;

@Mapper
public interface GroupNoticeMapper {

	
	//그룹인포 파라메타 받아서 그룹내 공지 등록
	public void insertGroupNotice(GroupNoticeVO vo);
	
	//GroupNotice 리스트 (페이징)
	public List<GroupNoticeVO> getListPaging(Criteria cri);
	
	//GroupNotice 게시글 총 갯수
	public int getTotal(HashMap<String, Object> map);
	
	//그룹내 공지 상세
	public GroupNoticeVO groupNoticeView(int group_notice_seq);
	
	//조회수 증가
	public  void groupNoticeViewCount(int group_notice_seq);
	
	//공지 수정
	public void updateGroupNotice(GroupNoticeVO vo);
	
	//공지 삭제
	public void deleteGroupNotice(int group_notice_seq);
	
	// 크루원 조회 
	public List<CrewInfoVIewVO> getCrewList(int group_seq, String user_id);
}
