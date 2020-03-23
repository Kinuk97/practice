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
	
	/**
	 * 2020-03-24
	 * 이메일(아이디) 중복검사
	 * @param email
	 * @return - int
	 */
	public int emailCheck(String email);

}
