package com.kgitbank.spring.domain.chat.dto;

import lombok.Data;

@Data
public class ChattingRoom {
	
	private int seqId;
	private int smallUserSeqId;
	private int largeUserSeqId;

}
