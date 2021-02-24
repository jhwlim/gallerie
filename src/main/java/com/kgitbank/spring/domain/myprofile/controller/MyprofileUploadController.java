package com.kgitbank.spring.domain.myprofile.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.service.MyProfileMainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MyprofileUploadController {
	
	@Resource(name="profileUploadPath")
	private String uploadPath;
	
	@Resource(name="profileDefaultImgFileName")
	private String defaultImgFile;
	
	@Autowired
	private MyProfileMainService service;
	
	@GetMapping("/myprofile/upload")
	public String getUploadPage() {
		log.info("URL : /myprofile/upload - GET");
		return "myprofile/uploadTest";
	}
	
	@ResponseBody
	@PostMapping(value="/myprofile/upload", produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadFileByAjax(MultipartFile file, @RequestParam int seqId) {
		log.info("URL : /myprofile/upload - POST");
		log.info("seqId=" + seqId);

		String savedFileName = service.uploadProfileImg(file, seqId);
		log.info(savedFileName);
		
		return savedFileName != null ? 
				new ResponseEntity<>(savedFileName, HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@GetMapping("/image/profile/{imgPath}")
	public ResponseEntity<byte[]> getImage(@PathVariable("imgPath") String imgPath) {
		log.info("URL : /myprofile/image/ - GET");
		log.info("imgPath=" + imgPath);
	
		String savedFileName = imgPath;
		byte[] imgBytes = null;
		
		InputStream in = null;
		try {
			in = new FileInputStream(uploadPath + savedFileName);
		} catch (FileNotFoundException e) {
			log.warn(e.getMessage());
			savedFileName = defaultImgFile;
			try {
				in = new FileInputStream(uploadPath + savedFileName);
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			}
		}
		
		String formatName = savedFileName.substring(savedFileName.lastIndexOf(".")+1);
		
		HttpHeaders headers = new HttpHeaders();

		String imageType = "image/";
		
		if (formatName.equals("png")) {
			imageType += "png";
		} else if (formatName.equals("jfif") || formatName.equals("jpg")) {
			imageType += "jpeg";
		}
		
		headers.setContentType(MediaType.parseMediaType(imageType));
		
		try {
			imgBytes = IOUtils.toByteArray(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return new ResponseEntity<>(imgBytes, headers, HttpStatus.OK);
	}
	
}
