package com.last.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	// 초 분 시 일 월 요일 순서
	@Scheduled(cron = "30 * * * * *" )
	public void autoUpdate() {
		System.out.println("30초마다 뜸");
	}
}
