package com.practice.dao;

import org.apache.ibatis.annotations.Mapper;

import com.practice.dto.Member;

@Mapper
public interface MemberDao {
	public Member selectAll();
}
