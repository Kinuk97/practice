package com.practice.service;

import com.practice.dao.MemberDao;
import com.practice.dto.Member;
import com.practice.util.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    private MemberDao memberDao;

    public LoginServiceImpl(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public Member checkId(Member member) {
        Member checkMember = memberDao.selectOne(member);

        // 맞는 아이디가 존재한다면 비밀번호 비교
        if (checkMember != null) {
            // 로그인 성공
            if (EncryptUtil.isMatch(member.getPwd(), checkMember.getPwd())) {
                return checkMember;
            }
        }

        return null;
    }
}
