package com.kgitbank.spring.global.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUtils {
	
	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_PNG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	/**
	 * 파일 확장자 → MediaType 으로 변환
	 * @param ext  파일 확장자
	 * @return 파일 확장자의 MediaType을 반환, 없으면 null
	 */
	public static MediaType getMediaType(String ext) {
		return mediaMap.get(ext.toUpperCase());
	}
	
	public static String uploadFile(MultipartFile file, String prefix, String uploadPath) {
		String fileName = prefix + "_" + UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, fileName);
		
		try {
			FileCopyUtils.copy(file.getBytes(), target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return fileName;
	}
	
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
	
	public static String[] uploadFiles(MultipartFile[] files, String uploadPath) {
		
		String[] fileNames = new String[files.length];
		String currentUploadPath = getCurrentUploadPath(uploadPath);
		String dirPath = currentUploadPath.substring(uploadPath.length());
		
		for (int i = 0; i < fileNames.length; i++) {
			fileNames[i] = dirPath + uploadFile(files[i], currentUploadPath);
		}
		
		return fileNames;
	}
	
	// 현재 업로드해야할 업로드 경로
	public static String getCurrentUploadPath(String uploadRootPath) {
		Calendar cal = Calendar.getInstance();
		
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		
		return makeDir(uploadRootPath, String.valueOf(y), len2(m), len2(d));
	}
	
	// 숫자를 입력받으면 두자리 숫자로 만들기  ex) 7 → 07, 13 → 13 
	private static String len2(int n) {
		return new DecimalFormat("00").format(n).toString();
	}
	
	private static String makeDir(String uploadRootPath, String... paths) {
		for (String path: paths) {
			uploadRootPath += path + File.separator;
			
			File tmpFile = new File(uploadRootPath);
			if (tmpFile.exists()) {
				continue;
			} else {
				tmpFile.mkdir();
			}
		}
		
		return uploadRootPath;
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
