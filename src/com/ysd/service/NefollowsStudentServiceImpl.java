package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.ysd.dao.NefollowsStudentMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Nefollows;

@Service
public class NefollowsStudentServiceImpl implements NefollowsStudentService {
	@Autowired
	private NefollowsStudentMapper nefollowsStudentMapper;

	@Override
	public Integer insertNefollows(Nefollows nefollows) {
		return nefollowsStudentMapper.insertNefollows(nefollows);

	}

	@Override
	public Fenye<Nefollows> selectAllNefollows(Fenye<Nefollows> fenye) {
		fenye.setRows(nefollowsStudentMapper.selectAllNefollows(fenye));
		fenye.setTotal(nefollowsStudentMapper.selectAllNefollowsCount(fenye));		
		return fenye;
				
				
	}

	@Override
	public Integer selectAllNefollowsCount(Fenye fenye) {
		// TODO Auto-generated method stub
		return nefollowsStudentMapper.selectAllNefollowsCount(fenye);
	}

	@Override
	public Integer updateStudent(Nefollows nefollows) {
		
		return nefollowsStudentMapper.updateAllNefollows(nefollows);
	}

}
