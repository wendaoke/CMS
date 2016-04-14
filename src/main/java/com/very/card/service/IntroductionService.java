package com.very.card.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.very.card.dao.IntroductionMapper;
import com.very.card.model.Introduction;

@Service
public class IntroductionService {
	@Autowired
	private IntroductionMapper mapper;
	
	public Introduction selectByPrimaryKey(int id){
		return mapper.selectByPrimaryKey(id);
	}
}
