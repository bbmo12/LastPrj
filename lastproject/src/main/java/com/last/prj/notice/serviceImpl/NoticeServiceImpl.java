package com.last.prj.notice.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import com.last.prj.notice.service.NoticeMapper;
import com.last.prj.notice.service.NoticeService;
import com.last.prj.notice.service.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper map;
	
	@Override
	public int noticeInsert(NoticeVO notice) {
		// TODO Auto-generated method stub
		return map.noticeInsert(notice);
	}

}
