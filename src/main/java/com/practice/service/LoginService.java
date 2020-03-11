package com.practice.service;

import com.practice.dto.Member;

public interface LoginService {

    /**
     * 이메일과 비밀번호가 담긴 객체로
     * 로그인 여부 확인 후 결과 반환
     *
     * @param member - email, pwd
     * @return boolean - 결과값
     */
    public boolean checkId(Member member);


}
