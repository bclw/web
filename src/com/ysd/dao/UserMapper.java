package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Roles;
import com.ysd.entity.Student;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;

public interface UserMapper {
	
	/**
	 * ��¼
	 * @param u
	 * @return
	 */
	
	//�������Ʋ�ѯ�û��Ƿ����(��½)
	List<User> selectUserByname(User u);
	//�����û���½��Ϣ
	Integer updateUserLoginInfo(User u);
	
	/**
	 * ���û����в���
	 * @param fenye
	 * @return
	 */
	
	
	//��ѯ�����û�
	Integer selectUserCount(Fenye fenye);
	//��ҳ��������ѯ
	List<User> selectUser(Fenye fenye);
	//����û�
	Integer insertUser(User user);
	//ɾ���û�
	Integer deleteUser(Integer uId);
	//�޸�
	Integer updateUser(User user);
	
	//��������
	Integer resetPsd(User user);
	
	
	//�����û�
	Integer suodingUser(User user);
	//�����û�
	Integer jiesuoUser(User user);
	
	
	
	//����roleId��userId
	List<Userroles> selectUserRolesByRolesId(Integer id);
	
	
	
	
	/**
	 * �����û���ɫ����
	 * @return
	 */
	//��ʾ���н�ɫ
	List<Roles> selectRoles(); 
	//��ʾ�����û���ɫ
	List<Roles> selectUserRoles(Integer id);
	//���û���ӽ�ɫ
	Integer insertUserRoles(Userroles userroles);
	//ɾ���û���ɫ
	Integer deleteUserRoles(Integer roleId);
	
	
	
	
	//�ҵ���Ϣ
			User select(Integer id);
			//�޸��ҵ���Ϣ
					Integer updateMessage(User user);
					//ǩ��
					Integer updateQiandao(User user);
					//ǩ��
					Integer updateQiantui(User user);
					//�޸��û�����
					Integer UpdateUserPassword(User user);
	
}
