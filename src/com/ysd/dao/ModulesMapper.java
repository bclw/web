package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Modules;
import com.ysd.entity.Roles;

public interface ModulesMapper {
	
	/**
	 * 通过用户Id搜索用户下的所有父模块
	 * @param uid
	 * @return
	 */
	public List<Modules> getModule(Integer uid);
	/**
	 * 通过模块父Id找到该模块的所有子模块(用户原理)
	 * @param mId
	 * @return
	 */
	public List<Modules> getModeuleChlidren(Integer mId);
	
	
	
	
	
	//显示所有模块
	List<Modules> selectModules(); 
	//添加模块
	Integer insertModule(Modules modules);
	//修改模块
	Integer updateModule(Modules modules);
	//删除模块
	Integer deleteModule(Integer mId);
	
	//查询该模块下是否有子模块
	List<Modules> selectModus(Integer mId);
}
