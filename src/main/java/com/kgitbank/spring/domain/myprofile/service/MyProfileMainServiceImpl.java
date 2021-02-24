package com.kgitbank.spring.domain.myprofile.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kgitbank.spring.domain.model.MemberVO;
import com.kgitbank.spring.domain.myprofile.mapper.MyProfileMainMapper;
import com.kgitbank.spring.global.util.FileUtils;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MyProfileMainServiceImpl implements MyProfileMainService {
	
	@Resource(name="profileUploadPath")
	private String uploadPath;
	
	@Resource(name="profileDefaultImgFileName")
	private String defaultImgFile;
	
	@Autowired
	MyProfileMainMapper mapper;

	@Override
	public MemberVO selectMemberById(String id) {
		return mapper.selectMemberById(id);
	}

	@Override
	public String uploadProfileImg(MultipartFile file, int seqId) {
		
		// 파일에 대한 유효성 검사하기
		log.info("contentType=" + file.getContentType());
		log.info("isImageFile ? " + FileUtils.isImageFile(file));
		if (!FileUtils.isImageFile(file)) {
			return null;
		}
		
		String imgPath = mapper.selectProfileImgBySeqId(seqId);
		
		// 기존 파일이 존재한다면 서버에서 파일을 삭제 
		if (imgPath != null) {
			log.info(uploadPath + imgPath);
			File fileInServer = new File(uploadPath + imgPath);
			if (fileInServer.exists()) {
				log.info("delete OK ? " + fileInServer.delete());
			}
		}
		
		// 파일 업로드 및 DB에 정보 업데이트
		MemberVO member = new MemberVO(seqId);
		String savedFileName = FileUtils.uploadFile(file, uploadPath);
		member.setImgPath(savedFileName);
		mapper.updateProfileImgBySeqId(member);
		
		return savedFileName;
	}

	@Override
	public byte[] getImage(String savedFileName) {
		
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

		try {
			imgBytes = IOUtils.toByteArray(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return imgBytes;
	}

	
	
}
