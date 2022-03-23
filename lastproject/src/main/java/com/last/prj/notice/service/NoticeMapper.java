package com.last.prj.notice.service;

import java.util.List;

public interface NoticeMapper {
	int noticeInsert(NoticeVO notice);
	List<NoticeVO> noticeSelectList(String m_id);
	List<NoticeVO> noticeSelectList2(String m_id);
	int noticeUpdate(int notice_no);
	List<String> noticeCheck();
	int noticeDelete(String notice_no);
	int noticeCheckCount(String m_id);
}
