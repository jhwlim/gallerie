package com.kgitbank.spring.domain.article.service;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;

import com.kgitbank.spring.global.util.FileUtils;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ArticleFileServiceImpl implements ArticleFileService {

	@Resource(name = "articleUploadPath")
	private String uploadPath;
	
	@Override
	public byte[] getImage(String filePath) {
		byte[] imgBytes = null;
		InputStream in = null;
		
		try {
			in = new FileInputStream(uploadPath + FileUtils.underbarPathTocurrPath(filePath));
			imgBytes = IOUtils.toByteArray(in);
		} catch (Exception e) {
			log.warn(e.getMessage());			
			e.printStackTrace();
		}
		
		return imgBytes;
	}

	
}
