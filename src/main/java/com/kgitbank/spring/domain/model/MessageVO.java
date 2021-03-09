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
	private String bang_id;
	private String senderId;
	private String receiverId;
	private String cmd;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sendDate;
	//private String result; // 테스트 값
	
	//////////////////////
	
	private int roomId; // messages_r
	private int seqId; // messages_r
	private int senderSeqId; // messages_r
	private char read; // messages_r
	
	
}
