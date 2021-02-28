package com.kgitbank.spring.domain.myprofile.service;

import java.io.File;

import java.io.IOException;
import java.net.InetAddress;

import org.springframework.stereotype.Service;

import com.kgitbank.spring.domain.myprofile.dto.GeoIPVO;
import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CityResponse;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class GeoIPLocationService {
    private DatabaseReader dbReader;
    
    public GeoIPLocationService() throws IOException {
        File database = new File("D:\\GeoLite2-City_20210223\\GeoLite2-City.mmdb");
        dbReader = new DatabaseReader.Builder(database).build();
    }
    
    public GeoIPVO getLocation(String ip) throws IOException, GeoIp2Exception {
        InetAddress ipAddress = InetAddress.getByName(ip);
        CityResponse response = dbReader.city(ipAddress);
        
        String cityName = response.getCity().getName();
        String latitude = response.getLocation().getLatitude().toString();
        String longitude = response.getLocation().getLongitude().toString();
        String state = response.getLeastSpecificSubdivision().getName();
       
//        log.info(ip);
        GeoIPVO g = new GeoIPVO(ip, state, latitude, longitude);
//        log.info(g);
        return g;
//        return new GeoIP(ip, cityName, latitude, longitude);
    }
}
