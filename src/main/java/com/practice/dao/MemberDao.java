package com.practice.dao;

import org.apache.ibatis.annotations.Mapper;

import com.practice.dto.Member;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDao {
	/**
	 * 테스트용
	 *
	 * @return
	 */
	public Member selectAll();

	/**
	 * email로 아이디 조회하기
	 *
	 * @param member - email
	 * @return Member - 조회결과
	 */
	public Member selectOne(Member member);
}
