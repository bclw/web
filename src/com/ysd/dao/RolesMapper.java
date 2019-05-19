package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.Userroles;

public interface RolesMapper {
	
	//查询总条数
	Integer selectRolesCount(Fenye fenye);
	//分页多条件查询
	List<Roles> selectRoles(Fenye fenye);
	//添加角色
	Integer insertRoles(Roles roles);
	//删除角色
	Integer deleteRoles(Integer rId);
	//修改角色
	Integer updateRoles(Roles roles);
	
	/**
	 * 对角色模块进行设置
	 * @return
	 */
	
	//显示所有模块
	List<Modules> selectModules(); 
	//显示所有角色模块
	List<Modules> selectRoleModules(Integer rId);
	
	//给角色添加模块
	Integer insertRoleModules(Rolemodules rolemodules);
	//删除用户角色
	Integer deleteRolesModules(Integer moduleId);

}
