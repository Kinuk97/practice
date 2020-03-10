package com.practice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.practice.dao.face.MemberDao;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDao memberDao;

	@RequestMapping("/")
	public String home() {
		System.out.println("접속 테스트");
		
		System.out.println(memberDao.selectAll());
		
		return "home";
	}
	
}
