package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Modules;
import com.ysd.entity.Roles;

public interface ModulesMapper {
	
	/**
	 * ͨ���û�Id�����û��µ����и�ģ��
	 * @param uid
	 * @return
	 */
	public List<Modules> getModule(Integer uid);
	/**
	 * ͨ��ģ�鸸Id�ҵ���ģ���������ģ��(�û�ԭ��)
	 * @param mId
	 * @return
	 */
	public List<Modules> getModeuleChlidren(Integer mId);
	
	
	
	
	
	//��ʾ����ģ��
	List<Modules> selectModules(); 
	//���ģ��
	Integer insertModule(Modules modules);
	//�޸�ģ��
	Integer updateModule(Modules modules);
	//ɾ��ģ��
	Integer deleteModule(Integer mId);
	
	//��ѯ��ģ�����Ƿ�����ģ��
	List<Modules> selectModus(Integer mId);
}
