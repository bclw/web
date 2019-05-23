package com.ysd.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;
import com.ysd.service.RolesService;
import com.ysd.service.UserService;

@Controller
public class RolesController {
	
	
	@Autowired
	private RolesService rolesService;
	@Autowired
	private Fenye<Roles> fenye;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/aa", method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Roles> selectRoles(Integer page,Integer rows,String rName){
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setrName(rName);
		fenye=rolesService.selectRoles(fenye);
		return fenye;
	}
	
	    // 修改
		@RequestMapping(value = "/updateRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateRoles(Roles roles) {
			return rolesService.updateRoles(roles);
		}

		// 删除(1、判断该角色是否有用户引用，2、判断该角色下是否有模块)
		@RequestMapping(value = "/deleteRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteRoles(Integer rId) {
			List<Modules> selectRoleModules = rolesService.selectRoleModules(rId);
			List<User> selectUserByRolesId = rolesService.selectUserByRolesId(rId);
			if( selectRoleModules.size()==0  && selectUserByRolesId.size()==0){
				Integer i = rolesService.deleteRoles(rId);
				return i;
			}else{
			return -1;
			}
		}

		// 添加用户
		@RequestMapping(value = "/insertRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertRoles(Roles roles) {
			
			return rolesService.insertRoles(roles);
		}
		
		
		// 显示该角色未拥有的模块
		@RequestMapping(value = "/selectModules", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Modules> selectModules(Integer rId) {
			List<Modules> selectModules = rolesService.selectModules(rId);
			Fenye<Modules> fenye = new Fenye<Modules>();
			fenye.setRows(selectModules);
			return fenye;
		}
	
		// 显示所有角色模块
		@RequestMapping(value = "/selectRoleModules", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Modules> selectRoleModules(Integer rId) {
			List<Modules> selectRoleModules = rolesService.selectRoleModules(rId);
			Fenye<Modules> fenye = new Fenye<Modules>();
			fenye.setRows(selectRoleModules);
			return fenye;
		}
	
		// 删除角色模块
		@RequestMapping(value = "/deleteRoleModules", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteRoleModules(Integer moduleId) {
			Integer i = rolesService.deleteRoleModules(moduleId);
			System.out.println(i);
			return i;
		}
	
		// 添加角色模块
		@RequestMapping(value = "/insertRoleModules", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertRoleModules(Rolemodules rolemodules) {
			Integer i = rolesService.insertRoleModules(rolemodules);
			System.out.println(i);
			return i;
		}
		
}

