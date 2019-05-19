package com.ysd.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ysd.entity.Fenye;
import com.ysd.entity.Nefollows;
import com.ysd.entity.Student;
@Component
public interface NefollowsStudentService {
	Integer insertNefollows(Nefollows nefollows);
	/**
	 * 查询所有
	 * @param nefollows
	 * @return
	 */
	Fenye<Nefollows> selectAllNefollows(Fenye<Nefollows> fenye);
	/**
	 * 条数
	 * @param fenye
	 * @return
	 */
	 Integer selectAllNefollowsCount(Fenye<Nefollows> fenye);
	 /**
	  * 修改
	  * @param student
	  * @return
	  */
	 Integer updateStudent(Nefollows nefollows);	
}
