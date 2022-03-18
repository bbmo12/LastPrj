package com.last.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.PmemService;

import com.last.prj.calendar.service.CalendarMapper;

@Component
public class Scheduler {
	@Autowired
	private CalendarMapper map;
	
	// 초 분 시 일 월 요일 순서
	
	@Autowired
	private MemService memDao;
	@Autowired
	private PmemService pmemDao;
	
	
	@Scheduled(cron = "0 0 12 * * *" )
	public void autoUpdate() {
		
		memDao.memdelete();
		pmemDao.pmemdelete();

		String title="예약불가";
		String bgColor = "#dc143c";
		map.yyyy(title,bgColor);
		System.out.println("업뎃테스트");

	}
	
}
