package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Nefollows;
import com.ysd.entity.Student;

public interface NefollowsStudentMapper {
	/**
	 * 跟踪（查看）
	 * @param nefollows
	 * @return
	 */
	Integer insertNefollows(Nefollows nefollows);
	/**
	 * 查询所有
	 * @param nefollows
	 * @return
	 */
	List<Nefollows> selectAllNefollows(Fenye fenye);
	/**
	 * 条数
	 * @param fenye
	 * @return
	 */
	 Integer selectAllNefollowsCount(Fenye fenye);
	 /**
	  * 修改
	  * @param student
	  * @return
	  */
	 Integer updateAllNefollows(Nefollows nefollows);	
	 /**
	  * 添加
	  * @param nefollows
	  * @return
	  */
	 Integer insertAllNefollows(Nefollows nefollows);
	
}
