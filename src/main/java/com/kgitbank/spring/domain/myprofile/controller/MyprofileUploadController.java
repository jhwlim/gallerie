package com.kgitbank.spring.domain.myprofile.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.global.util.FileUploadUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MyprofileUploadController {

	@Resource(name="profileUploadPath")
	private String uploadPath;
	
	@GetMapping("/myprofile/upload")
	public String getUploadPage() {
		log.info("URL : /myprofile/upload - GET");
		return "myprofile/uploadTest";
	}
	
	@ResponseBody
	@PostMapping(value="/myprofile/upload", produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadFileByAjax(MultipartFile file) {
		log.info("URL : /myprofile/upload - POST");
		
		String savedFileName = FileUploadUtil.uploadFile(file, uploadPath);
		
		return new ResponseEntity<>("OK", HttpStatus.CREATED);
	}
	
	
	@GetMapping("/myprofile/getImage")
	public ResponseEntity<byte[]> getImage() {
		log.info("URL : /myprofile/getImage - GET");
		
		String savedFileName = "test3.png";
		
		try {
			InputStream in = new FileInputStream(uploadPath + savedFileName);
			ResponseEntity<byte[]> entity = null;
			
			String formatName = savedFileName.substring(savedFileName.lastIndexOf(".")+1);
			
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentType(MediaType.parseMediaType("image/png"));
			
			
			return new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	}
	
}
