package com.ysd.service;


import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.Userroles;
public interface RolesService {
		//查询所有角色
		Fenye<Roles> selectRoles(Fenye<Roles> fenye);
		//添加角色
		Integer insertRoles(Roles roles);
		//删除角色
		Integer deleteRoles(Integer  rId);
		//修改角色
		Integer updateRoles(Roles roles);
		
		
		//显示所有模块
		List<Modules> selectModules(); 
		//显示所有角色模块
		List<Modules> selectRoleModules(Integer rId);
		
		//给角色添加模块
		Integer insertRoleModules(Rolemodules rolemodules);
		//删除用户角色
		Integer deleteRoleModules(Integer moduleId);
}
