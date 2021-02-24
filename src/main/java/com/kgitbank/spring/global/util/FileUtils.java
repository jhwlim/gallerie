package com.kgitbank.spring.global.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

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
	
	
}
