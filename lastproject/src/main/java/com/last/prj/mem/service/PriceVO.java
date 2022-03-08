package com.last.prj.mem.service;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class PriceVO {

	private int price_no;
	private int price;
	private String title;
	private String content;
	private String p_id;
	
	private List<PriceVO> priceVOList;
}
