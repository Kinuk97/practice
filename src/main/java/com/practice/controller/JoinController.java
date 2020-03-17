package com.practice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.practice.dto.Member;
import com.practice.service.JoinService;

import ch.qos.logback.classic.Logger;

@Controller
public class JoinController {
	

	private final JoinService joinService;
	
	public JoinController(JoinService joinService) {
		this.joinService = joinService;
	}
	
	@RequestMapping(value= "/join", method = RequestMethod.GET)
	public void joinPage() {
		
	}
	
	@RequestMapping(value= "/joinProc", method=RequestMethod.POST)
	public String joinProc(Member member) {
		
		System.out.println(member);
		
		joinService.joinProc(member);
		
		return "redirect:/";
	}
	
}
