package com.last.prj.notice.service;

import java.util.List;

public interface NoticeService {
	int noticeInsert(NoticeVO notice);
	List<NoticeVO> noticeSelectList(String m_id);
}
