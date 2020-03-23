package com.practice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public ModelAndView idCheck(@RequestParam(("email")) String email, ModelAndView mav) {
		
		 System.out.println("이메일 :" +  email);
		
		 mav.addObject("idCheck", joinService.emailCheck(email));
		 mav.setViewName("jsonView");
		
		return mav;
		
	}
	
}
