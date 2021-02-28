package com.kgitbank.spring.domain.myprofile.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GeoIPVO {
	private String ipAddress;
    private String city;
    private String latitude;
    private String longitude;

}
