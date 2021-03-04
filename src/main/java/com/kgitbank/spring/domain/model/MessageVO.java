package com.kgitbank.spring.domain.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Alias("MessageVO")
@Data
@NoArgsConstructor
public class MessageVO {

	
	@NonNull
	private String bangId;
	private String senderId;
	private String receiverId;
	private String cmd;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sendDate;
	//private String result; // 테스트 값
}
