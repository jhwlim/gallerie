package com.kgitbank.spring.domain.geoip;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;

import org.junit.Test;


import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CityResponse;

import lombok.extern.log4j.Log4j;

@Log4j
public class givenIP_whenFetchingCity_thenReturnsCityData {
	@Test
	public void givenIP_whenFetchingCity_thenReturnsCityData() throws IOException, GeoIp2Exception {
//	    String ip = "211.200.41.65";
	    String ip = "127.0.0.1";
	    String dbLocation = "D:\\GeoLite2-City_20210223\\GeoLite2-City.mmdb";
	        
	    File database = new File(dbLocation);
	    DatabaseReader dbReader = new DatabaseReader.Builder(database).build();
	        
	    InetAddress ipAddress = InetAddress.getByName(ip);
	    CityResponse response = dbReader.city(ipAddress);
	        
	    String countryName = response.getCountry().getName();
	    String cityName = response.getCity().getName();
	    String postal = response.getPostal().getCode();
	    String state = response.getLeastSpecificSubdivision().getName();
	    
	    log.info("1: " + countryName);
	    log.info("2: " + cityName);
	    log.info("3: " + postal);
	    log.info("4: " + state);
	}
}
