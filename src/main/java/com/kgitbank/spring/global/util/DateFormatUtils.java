package com.kgitbank.spring.global.util;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class DateFormatUtils {

	public static String changeDateToAgoStr(Date date) {
		
		StringBuilder sb = new StringBuilder();
		
		LocalDateTime compareDate = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
		LocalDateTime now = LocalDateTime.now();
		
		long y = compareDate.until(now, ChronoUnit.YEARS);
		long mon = compareDate.until(now, ChronoUnit.MONTHS);
		long d = compareDate.until(now, ChronoUnit.DAYS);
		long h = compareDate.until(now, ChronoUnit.HOURS);
		long min = compareDate.until(now, ChronoUnit.MINUTES);
		long s = compareDate.until(now, ChronoUnit.SECONDS);
		
		if (y > 0) {
			sb.append(y).append(" YEARS");
		} else if (mon > 0) {
			sb.append(mon).append(" MONTHS");
		} else if (d > 0) {
			sb.append(d).append(" DAYS");
		} else if (h > 0) {
			sb.append(h).append(" HOURS");
		} else if (min > 0) {
			sb.append(min).append(" MINUTES");
		} else {
			sb.append(s).append(" SECONDS");
		}
		
		return sb.append(" AGO").toString();
	}
}
