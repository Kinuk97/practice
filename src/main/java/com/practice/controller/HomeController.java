package com.practice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.practice.dao.MemberDao;

@Controller
public class HomeController {

	private final MemberDao memberDao;

	public HomeController(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@RequestMapping(value = "/")
	public String home() {
		System.out.println("접속 테스트");

		System.out.println(memberDao.selectAll());

		return "home";
	}
	
}
