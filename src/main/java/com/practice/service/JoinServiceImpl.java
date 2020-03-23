package com.practice.service;

import org.springframework.stereotype.Service;

import com.practice.dao.JoinDao;
import com.practice.dto.Member;
import com.practice.util.EncryptUtil;

@Service
public class JoinServiceImpl implements JoinService{

	
	private final JoinDao joinDao;
	
	public JoinServiceImpl(JoinDao joinDao) {
		this.joinDao = joinDao;
	}
	
	
//	public JoinServiceImpl(EncryptUtil encryptUtil) {
//		this.encryptUtil = encryptUtil;
//	}
	
	@Override
	public int joinProc(Member member) {
		
		
		// 전화번호 정규식 하이픈 빼주기
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		String str = member.getPhone();  
		str = str.replaceAll(match, "");
		member.setPhone(str);
		
//		System.out.println("핸드폰번호 : str : " + str);
//		System.out.println("핸듶노번호 : 겟폰 : " + member.getPhone());
		
		//비밀번호 암호화
		String EncryptPwd = EncryptUtil.encrypt(member.getPwd());
//		System.out.println("암호화 된 비밀번호 : " + EncryptPwd);	
		
		//암호화 된 비밀번호로 바꿔주기
		member.setPwd(EncryptPwd);
		
		int resultCnt = 0;		
		resultCnt = joinDao.insertJoin(member);
		System.out.println("insertJoin 반환값(0 실패, 1 성공) : " + resultCnt);
		
		return resultCnt;
		
	}


	@Override
	public int emailCheck(String email) {
		
		return joinDao.selectCheckId(email);
	}

}
