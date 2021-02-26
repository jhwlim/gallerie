package com.kgitbank.spring.domain.myprofile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.myprofile.service.ProfileMainService;
import com.kgitbank.spring.domain.myprofile.service.ProfileImageService;
import com.kgitbank.spring.global.util.FileUtils;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/image/profile")
@Log4j
public class ProfileImageController {
	
	@Autowired
	private ProfileImageService service;

	@PostMapping(produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadFile(MultipartFile file, @RequestParam int seqId) {
		log.info("URL : /image/profile - POST");
		log.info("seqId=" + seqId);
		log.info("file=" + file);
		
		if (file == null) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		
		String savedFileName = service.uploadProfileImg(file, seqId);
		log.info("savedFileName=" + savedFileName);
		
		return savedFileName != null ? 
				new ResponseEntity<>(savedFileName, HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	@GetMapping("/{imgPath}")
	public ResponseEntity<byte[]> getImage(@PathVariable("imgPath") String imgPath) {
		log.info("URL : /image/profile - GET");
		log.info("imgPath=" + imgPath);
	
		String savedFileName = imgPath;
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.setContentType(FileUtils.parseMediaType(savedFileName));
			byte[] imgBytes = service.getImage(savedFileName);
			
			if (imgBytes == null) {
				return new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			}
			
			return new ResponseEntity<>(imgBytes, headers, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	}
	
	@DeleteMapping(produces="text/plain")
	public ResponseEntity<String> deleteFile(@RequestBody String seqId) {
		log.info("URL : /image/profile - DELETE");
		log.info("seqId=" + seqId);
		
		service.deleteProfileImg(Integer.parseInt(seqId));
		
		return new ResponseEntity<String>("Delete Success", HttpStatus.OK);
	}
	
	
}
