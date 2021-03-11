package com.kgitbank.spring.global.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class DateFormateUtilsTests {
	
	@Test
	public void changeDateToAgoStrTest() {
		
		LocalDateTime t1 = LocalDateTime.of(2020, 12, 31, 8, 0, 1);
		LocalDateTime t2 = LocalDateTime.of(2022, 12, 31, 8, 0, 0);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date;
		try {
			date = dateFormat.parse("2020-03-28 13:50:0");
			log.info(DateFormatUtils.changeDateToAgoStr(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
