package com.practice.service;

import org.springframework.stereotype.Service;

import com.practice.dao.JoinDao;
import com.practice.dto.Member;

@Service
public class JoinServiceImpl implements JoinService{

	
	private final JoinDao joinDao;
	
	public JoinServiceImpl(JoinDao joinDao) {
		this.joinDao = joinDao;
	}
	
	@Override
	public int joinProc(Member member) {

		int resultCnt = 0;
		
		resultCnt = joinDao.insertJoin(member);
		
		System.out.println("insertJoin 반환값(0 실패, 1 성공) : " + resultCnt);
		
		return resultCnt;
		
	}

}
