package com.practice.controller;

import com.practice.dto.Member;
import com.practice.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    private final LoginService loginService;

    public LoginController(LoginService loginService) {
        this.loginService = loginService;
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void moveLoginPage() {
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginAction(Member member) {
        System.out.println(member);

        System.out.println(loginService.checkId(member));

        System.out.println(member);

        return "redirect:/";
    }
}
