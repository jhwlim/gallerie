package com.kgitbank.spring.domain.geoIPTest.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/geoIPTest")
@Log4j
public class GeoIPTestController {
	@Autowired
	private RawDBDemoGeoIPLocationService locationService;
    
    public GeoIPTestController() throws IOException {
        locationService = new RawDBDemoGeoIPLocationService();
    }
    
    @GetMapping(value = "/GeoIPTest")
	public String GeoIPTest() {
    	log.info("GeoIPTest");
		return "geoIPTest/GeoIPTest";
	}
    
    @PostMapping(value = "/GeoIPTest")
    @ResponseBody
    public GeoIP getLocation(@RequestParam(value="ipAddress", required=true) String ipAddress) throws Exception {
    	log.info(ipAddress);
        return locationService.getLocation(ipAddress);
    }
}
