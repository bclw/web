package com.ysd.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;

import com.google.gson.Gson;
import com.ysd.dao.RolesMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;
@Service
public class RolesServiceImp implements RolesService{
	
	@Autowired
	private RolesMapper rolesMapper;
	
	
	


	public Fenye<Roles> selectRoles(Fenye<Roles> fenye) {
		 List<Roles> selectRoles = rolesMapper.selectRoles(fenye);
		 Integer selectRolesCount = rolesMapper.selectRolesCount(fenye);
		 
		 fenye.setTotal(selectRolesCount);
		 fenye.setRows(selectRoles);
		 
		 return fenye;
	}

	public Integer insertRoles(Roles roles) {
		Roles selectRolesByRname = rolesMapper.selectRolesByRname(roles);
		int i = 0;
		if(selectRolesByRname==null){
			i = rolesMapper.insertRoles(roles);
			return i;
		}else{
			return 0;
		}
		 
	}

	//É¾³ý½ÇÉ«ÅÐ¶Ï
	public Integer deleteRoles(Integer rId) {
		Integer deleteRoles = rolesMapper.deleteRoles(rId);

		return deleteRoles;

	}

	public Integer updateRoles(Roles roles) {
		return rolesMapper.updateRoles(roles);
	}

	
	
	public List<Modules> selectModules(Integer rId) {
		return rolesMapper.selectModules(rId);
	}

	public List<Modules> selectRoleModules(Integer rId) {
		return rolesMapper.selectRoleModules(rId);
	}

	public Integer insertRoleModules(Rolemodules rolemodules) {
		return rolesMapper.insertRoleModules(rolemodules);
	}

	public Integer deleteRoleModules(Integer moduleId) {
		return rolesMapper.deleteRolesModules(moduleId);
	}

	public List<User> selectUserByRolesId(Integer rId) {
		return rolesMapper.selectUserByRolesId(rId);
	}


	



}
