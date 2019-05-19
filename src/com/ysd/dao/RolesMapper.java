package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.entity.Rolemodules;
import com.ysd.entity.Roles;
import com.ysd.entity.Userroles;

public interface RolesMapper {
	
	//��ѯ������
	Integer selectRolesCount(Fenye fenye);
	//��ҳ��������ѯ
	List<Roles> selectRoles(Fenye fenye);
	//��ӽ�ɫ
	Integer insertRoles(Roles roles);
	//ɾ����ɫ
	Integer deleteRoles(Integer rId);
	//�޸Ľ�ɫ
	Integer updateRoles(Roles roles);
	
	/**
	 * �Խ�ɫģ���������
	 * @return
	 */
	
	//��ʾ����ģ��
	List<Modules> selectModules(); 
	//��ʾ���н�ɫģ��
	List<Modules> selectRoleModules(Integer rId);
	
	//����ɫ���ģ��
	Integer insertRoleModules(Rolemodules rolemodules);
	//ɾ���û���ɫ
	Integer deleteRolesModules(Integer moduleId);

}
