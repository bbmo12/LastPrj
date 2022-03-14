package com.last.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.last.prj.mem.service.MemService;
import com.last.prj.mem.service.PmemService;

@Component
public class Scheduler {
	// 초 분 시 일 월 요일 순서
	
	@Autowired
	private MemService memDao;
	@Autowired
	private PmemService pmemDao;
	
	
	@Scheduled(cron = "0 0 12 * * *" )
	public void autoUpdate() {
		System.out.println("30초마다 뜸");
		
		memDao.memdelete();
		pmemDao.pmemdelete();
	}
}
