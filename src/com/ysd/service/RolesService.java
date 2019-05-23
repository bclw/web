package com.ysd.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;
public interface RolesService {
		//��ѯ���н�ɫ
		Fenye<Roles> selectRoles(Fenye<Roles> fenye);
		//��ӽ�ɫ
		Integer insertRoles(Roles roles);
		//ɾ����ɫ
		Integer deleteRoles(Integer  rId);
		//�޸Ľ�ɫ
		Integer updateRoles(Roles roles);
		
		//��ѯ�ý�ɫ�Ƿ����û�����
		List<User> selectUserByRolesId(Integer rId);
		
		
		
		//��ʾ��ɫû�е�ģ��
		List<Modules> selectModules(Integer rId); 
		//��ʾ���н�ɫģ��
		List<Modules> selectRoleModules(Integer rId);
		
		//����ɫ���ģ��
		Integer insertRoleModules(Rolemodules rolemodules);
		//ɾ���û���ɫ
		Integer deleteRoleModules(Integer moduleId);
}
