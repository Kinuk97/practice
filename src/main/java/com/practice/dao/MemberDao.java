package com.practice.dao;

import com.practice.dto.Member;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberDao {
	/**
	 * 테스트용
	 *
	 * @return
	 */
	public List<Member> selectAll();

	/**
	 * email로 아이디 조회하기
	 *
	 * @param member - email
	 * @return Member - 조회결과
	 */
	public Member selectOne(Member member);
}
