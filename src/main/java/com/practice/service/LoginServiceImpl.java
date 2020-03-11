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
    public boolean checkId(Member member) {
        Member checkMember = memberDao.selectOne(member);

        if (checkMember == null) {
            return false;
        }

        if (EncryptUtil.isMatch(member.getPwd(), checkMember.getPwd())) {
            // 매개변수로 받은 member와 같은 객체인가 확인해야함.
            member = checkMember;

            return true;
        } else {
            return false;
        }
    }
}
