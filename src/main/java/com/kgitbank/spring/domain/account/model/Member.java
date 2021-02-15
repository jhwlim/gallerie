package com.kgitbank.spring.domain.account.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	@NonNull
	private String emailAddr;
	private String userName;
	private String userId;
	private String userPw;
}
