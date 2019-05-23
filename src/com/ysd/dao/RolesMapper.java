package com.ysd.dao;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;

public interface RolesMapper {
	
	//查询总条数
	Integer selectRolesCount(Fenye fenye);
	//分页多条件查询
	List<Roles> selectRoles(Fenye fenye);
	//添加角色
	Integer insertRoles(Roles roles);
	//添加时判断是否有重名的
	Roles selectRolesByRname(Roles roles);
	
	//删除角色
	Integer deleteRoles(Integer rId);
	//修改角色
	Integer updateRoles(Roles roles);
	
	
	//查询该角色是否有用户引用
	List<User> selectUserByRolesId(Integer rId);
	
	
	/**
	 * 对角色模块进行设置
	 * @return
	 */
	
	//显示所有模块
	List<Modules> selectModules(Integer rId); 
	//显示所有角色模块
	List<Modules> selectRoleModules(Integer rId);
	
	//给角色添加模块
	Integer insertRoleModules(Rolemodules rolemodules);
	//删除用户角色
	Integer deleteRolesModules(Integer moduleId);

}
