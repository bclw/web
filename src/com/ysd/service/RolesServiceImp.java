package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return rolesMapper.insertRoles(roles);
	}

	public Integer deleteRoles(Integer rId) {
		return rolesMapper.deleteRoles(rId);
	}

	public Integer updateRoles(Roles roles) {
		return rolesMapper.updateRoles(roles);
	}

	
	
	public List<Modules> selectModules() {
		return rolesMapper.selectModules();
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



}
