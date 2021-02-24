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
import com.kgitbank.spring.global.util.FileUploadUtil;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MyprofileUploadController {
	
	@Resource(name="profileUploadPath")
	private String uploadPath;
	
	@Autowired
	private MyProfileMainService service;
	
	@GetMapping("/myprofile/upload")
	public String getUploadPage() {
		log.info("URL : /myprofile/upload - GET");
		return "myprofile/uploadTest";
	}
	
	@ResponseBody
	@PostMapping(value="/myprofile/upload", produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadFileByAjax(MultipartFile file, MemberVO member) {
		log.info("URL : /myprofile/upload - POST");
		log.info("seqId=" + member.getSeqId());
		
		String savedFileName = FileUploadUtil.uploadFile(file, uploadPath);
		member.setImgPath(savedFileName);
		
		int result = service.updateProfileImgBySeqId(member);
		return result == 1 ? new ResponseEntity<>(savedFileName, HttpStatus.CREATED) : new ResponseEntity<>("Fail", HttpStatus.BAD_REQUEST);
	}
	
	@ResponseBody
	@GetMapping("/myprofile/image/{imgPath}")
	public ResponseEntity<byte[]> getImage(@PathVariable("imgPath") String imgPath) {
		log.info("URL : /myprofile/getImage - GET");
		log.info("imagePath=" + imgPath);
		
		byte[] imgBytes = null;
		
		String savedFileName = imgPath;
		if (savedFileName == null) {
			savedFileName = "blank.png";
		}
		
		ResponseEntity<byte[]> result = null;
		
		
		try {
			InputStream in = new FileInputStream(uploadPath + savedFileName);
			
			String formatName = savedFileName.substring(savedFileName.lastIndexOf(".")+1);
			
			HttpHeaders headers = new HttpHeaders();

			String imageType = "image/";
			
			if (formatName.equals("png")) {
				imageType += "png";
			} else if (formatName.equals("jfif") || formatName.equals("jpg")) {
				imageType += "jpeg";
			}
			
			headers.setContentType(MediaType.parseMediaType(imageType));
			
			
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
