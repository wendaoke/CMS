package com.very.card.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.very.card.dao.IntroductionMapper;
import com.very.card.model.Introduction;

@Service
public class IntroductionService {
	@Autowired
	private IntroductionMapper mapper;

	public Introduction selectByPrimaryKey(String id) {
		return mapper.selectByPrimaryKey(id);
	}

	public List<Introduction> queryBySelective(HashMap hashmap) {
		return null;
	}

	public int insert(Introduction record) {
		return mapper.insert(record);

	}
}
