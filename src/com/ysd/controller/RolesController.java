package com.ysd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.Userroles;
import com.ysd.service.RolesService;

@Controller
public class RolesController {
	
	
	@Autowired
	private RolesService rolesService;
	@Autowired
	private Fenye<Roles> fenye;

	@RequestMapping(value = "/aa", method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Roles> selectRoles(Integer page,Integer rows,String rName){
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setrName(rName);
		fenye=rolesService.selectRoles(fenye);
		return fenye;
	}
	
	    // �޸�
		@RequestMapping(value = "/updateRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateRoles(Roles roles) {
			return rolesService.updateRoles(roles);
		}

		// ɾ��
		@RequestMapping(value = "/deleteRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteRoles(Integer rId) {
			return rolesService.deleteRoles(rId);
		}

		// ����û�
		@RequestMapping(value = "/insertRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertRoles(Roles roles) {
			return rolesService.insertRoles(roles);
		}
		
		
		// ��ʾ����ģ��
		@RequestMapping(value = "/selectModules", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Modules> selectModules() {
			List<Modules> selectModules = rolesService.selectModules();
			Fenye<Modules> fenye = new Fenye<Modules>();
			fenye.setRows(selectModules);
			return fenye;
		}
	
		// ��ʾ���н�ɫģ��
		@RequestMapping(value = "/selectRoleModules", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Modules> selectRoleModules(Integer rId) {
			List<Modules> selectRoleModules = rolesService.selectRoleModules(rId);
			Fenye<Modules> fenye = new Fenye<Modules>();
			fenye.setRows(selectRoleModules);
			return fenye;
		}
	
		// ɾ����ɫģ��
		@RequestMapping(value = "/deleteRoleModules", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteRoleModules(Integer moduleId) {
			Integer i = rolesService.deleteRoleModules(moduleId);
			System.out.println(i);
			return i;
		}
	
		// ��ӽ�ɫģ��
		@RequestMapping(value = "/insertRoleModules", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertRoleModules(Rolemodules rolemodules) {
			Integer i = rolesService.insertRoleModules(rolemodules);
			System.out.println(i);
			return i;
		}
		
}
