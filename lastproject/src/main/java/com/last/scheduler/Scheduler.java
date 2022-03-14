package com.last.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.last.prj.calendar.service.CalendarMapper;

@Component
public class Scheduler {
	@Autowired
	private CalendarMapper map;
	
	// 초 분 시 일 월 요일 순서
	@Scheduled(cron = "30 * * * * *" )
	public void autoUpdate() {
		String title="예약불가";
		String bgColor = "#dc143c";
		map.yyyy(title,bgColor);
		System.out.println("업뎃테스트");
	}
}
