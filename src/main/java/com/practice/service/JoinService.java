package com.practice.service;


import com.practice.dto.Member;

public interface JoinService {
	
	/**
	 * 2020-03-12
	 * 받아온 회원가입 정보 DB에 넣어주기
	 * @param member - 요청으로 받아온 회원가입 정보
	 * @return - int
	 */
	public int joinProc(Member member);

}
