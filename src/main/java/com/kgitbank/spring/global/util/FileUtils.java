package com.kgitbank.spring.global.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUtils {
	
	public static String uploadFile(MultipartFile file, String uploadPath) {
		
		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, fileName);
		
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return fileName;
	}
	
	public static boolean isImageFile(MultipartFile file) {
		
		String contentType = file.getContentType();
		contentType = contentType.substring(0, contentType.indexOf("/")); 
		
		return contentType.equals("image");
	}
	
	public static MediaType parseMediaType(String file) {
		
		String fileFormat = file.substring(file.lastIndexOf(".")+1);
		
		return MediaType.parseMediaType("image/" + fileFormat);
	}
	
	public static boolean deleteFile(String filePath) {
		File fileInServer = new File(filePath);
		
		if (fileInServer.exists()) {
			// 파일이 삭제될 때까지 반복
			for (int i = 0; i < 10000; i++) {
				if (fileInServer.delete()) {
					log.info(filePath + " : delete Complete - " + i);
					return true;
				}
				
				try {
					Thread.sleep(100);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return false;
	}
	
}
