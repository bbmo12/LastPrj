package com.last.scheduler;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

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
	
	
	
	@Autowired
	private MemService memDao;
	@Autowired
	private PmemService pmemDao;
	
	// 초 분 시 일 월 요일 순서
	@Scheduled(cron = "0 0 12 * * *" )
	public void autoUpdate() {
		
		memDao.memdelete();
		pmemDao.pmemdelete();

		String title="예약불가";
		String bgColor = "#dc143c";

	}
	
	@Scheduled(cron = "59 59 23 * * *" )
	public void calendarUpdate() {
		

		String title="예약불가";
		String bgColor = "#dc143c";
		map.yyyy(title,bgColor);
		System.out.println("업뎃테스트");

	}
	
	// 초 분 시 일 월 요일 순서
		@Scheduled(cron = "0 * * * * *" )
		public void reservCheck() {
			
				// 현재 시간
				LocalTime time = LocalTime.now();
				// 포맷 정의하기
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시");
				// 포맷 적용하기
				String formatedNow = time.format(formatter);
				// 포맷 적용된 현재 시간 출력
				System.out.println("현재시간 : "+formatedNow); // 06시 20분 57초
				
				LocalDate now = LocalDate.now();
				// 연도, 월(문자열, 숫자), 일, 일(year 기준), 요일(문자열, 숫자)
				int year = now.getYear();
				String month = now.getMonth().toString();
				int monthValue = now.getMonthValue();
				int dayOfMonth = now.getDayOfMonth();
				int dayOfYear = now.getDayOfYear();
				System.out.println("현재날짜 : "+now);
				
		}
	
}
