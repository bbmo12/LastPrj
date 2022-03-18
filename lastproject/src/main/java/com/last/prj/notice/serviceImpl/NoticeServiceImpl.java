package com.last.prj.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.last.prj.notice.service.NoticeMapper;
import com.last.prj.notice.service.NoticeService;
import com.last.prj.notice.service.NoticeVO;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper map;
	
	@Override
	public int noticeInsert(NoticeVO notice) {
		return map.noticeInsert(notice);
	}

	@Override
	public List<NoticeVO> noticeSelectList(String m_id) {
		return map.noticeSelectList(m_id);
	}

	@Override
	public int noticeUpdate(int notice_no) {
		return map.noticeUpdate(notice_no);
	}

}
