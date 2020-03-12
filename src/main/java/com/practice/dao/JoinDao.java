package com.practice.dao;

import org.springframework.stereotype.Repository;

import com.practice.dto.Member;

@Repository
public interface JoinDao {

	/**
	 * 2020-03-12
	 * 이빈
	 * 회원가입 정보 DB에 넣어 주기
	 * @param member
	 * @return - int (1=회원가입 성공, 0=회원가입 실패)
	 */
	public int insertJoin(Member member);

}
