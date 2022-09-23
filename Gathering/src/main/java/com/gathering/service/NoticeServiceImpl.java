package com.gathering.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gathering.dto.FilesVO;
import com.gathering.dto.NoticeVO;
import com.gathering.mapper.NoticeMapper;
import com.gathering.util.Criteria;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO searchVO) {
		return noticeMapper.getNoticeList(searchVO);
	}

	@Override
	public List<NoticeVO> getListPaging(Criteria cri) {

		return noticeMapper.getListPaging(cri);
	}
	
	@Transactional
	@Override
	public void InsertNotice(NoticeVO noticeVO) {
		noticeMapper.InsertNotice(noticeVO);
		if(noticeVO.getImageList() == null || noticeVO.getImageList().size() <= 0) {
			return;
		}
		noticeVO.getImageList().forEach(attach -> {

			attach.setNotice_seq(noticeVO.getNotice_seq());
			noticeMapper.imageEnroll(attach);

		});

	}

	@Override
	public NoticeVO getNotice(int notice_seq) {

		return noticeMapper.getNotice(notice_seq);
	}

	@Transactional
	@Override
	public int updateNotice(NoticeVO searchVO) {
		int result= noticeMapper.updateNotice(searchVO);
		
		
		
		if(result == 1 && searchVO.getImageList() != null && searchVO.getImageList().size() > 0) {
			
			noticeMapper.deleteImageAll(searchVO.getNotice_seq());
			
			searchVO.getImageList().forEach(attach -> {
				
				attach.setNotice_seq(searchVO.getNotice_seq());
				noticeMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;

	}

	@Override
	@Transactional
	public void deleteNotice(int notice_seq) {
		noticeMapper.deleteImageAll(notice_seq);
		noticeMapper.deleteNotice(notice_seq);

	}

	@Override
	public int getTotal(Criteria cri) {

		return noticeMapper.getTotal(cri);
	}

	@Override
	public void noticeViewCount(int notice_seq) {
		
		noticeMapper.noticeViewCount(notice_seq);
		
	}

	@Override
	public List<FilesVO> getAttachInfo(int notice_seq) {
		
		return noticeMapper.getAttachInfo(notice_seq);
	}
	

}
