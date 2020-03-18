package com.practice.controller;

import com.practice.dto.Member;
import com.practice.service.LoginService;
import com.sun.deploy.net.HttpResponse;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void moveLoginPage() {
    }

    @ResponseBody
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Map<String, Object> loginAction(Member member, boolean saveEmail, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<>();

        // 로그인 성공시 회원정보
        Member result = loginService.checkId(member);

        if (result != null) {
            // 로그인 성공 결과
            map.put("result", "1");

            // 아이디 저장 체크하면 쿠키에 이메일 저장
            if (saveEmail) {
                Cookie emailCookie = new Cookie("email", member.getEmail());

                emailCookie.setMaxAge(7 * 24 * 60 * 60);

                response.addCookie(emailCookie);
            } else {
                Cookie emailCookie = new Cookie("email", null);

                emailCookie.setMaxAge(0);

                response.addCookie(emailCookie);
            }
        } else {
            // 로그인 실패 결과
            map.put("result", "-1");
            map.put("msg", "아이디 혹은 비밀번호를 확인해주세요.");
        }

        return map;
    }
}
