package com.ysd.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.UserMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;
@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserMapper userMapper;
	//�������Ʋ�ѯ�û��Ƿ����(��½)
	public List<User> selectByname(User u) {
		return userMapper.selectUserByname(u);
	}
	//�����û���¼��Ϣ
	public Integer updateUserLoginInfo(User u) {
		return userMapper.updateUserLoginInfo(u);
	}
	//��ʾ�����û�
	public Fenye<User> selectUser(Fenye<User> fenye) {
		 List<User> selectUser = userMapper.selectUser(fenye);
		 Integer selectUserCount = userMapper.selectUserCount(fenye);
		 
		 fenye.setTotal(selectUserCount);
		 fenye.setRows(selectUser);
		 
		 return fenye;
	}

	public Integer insertUser(User user) {
		return userMapper.insertUser(user);
	}

	public Integer deleteUser(Integer uId) {
		return userMapper.deleteUser(uId);
	}

	public Integer updateUser(User user) {
		return userMapper.updateUser(user);
	}
	public List<Roles> selectRoles(Integer id) {
		return userMapper.selectRoles(id);
	}
	public List<Roles> selectUserRoles(Integer id) {
		return userMapper.selectUserRoles(id);
	}
	public Integer insertUserRoles(Userroles userroles) {
		return userMapper.insertUserRoles(userroles);
	}
	public Integer deleteUserRoles(Integer roleId) {
		return userMapper.deleteUserRoles(roleId);
	}
	public Integer resetPsd(User user) {
		return userMapper.resetPsd(user);
	}
	public Integer suodingUser(User user) {
		return userMapper.suodingUser(user);
	}
	public Integer jiesuoUser(User user) {
		return userMapper.jiesuoUser(user);
	}
	public User select(Integer id) {
		return userMapper.select(id);
	}
	public Integer updateMessage(User user) {
		return userMapper.updateMessage(user);
	}
	public Integer updateQiandao(User user) {
		return userMapper.updateQiandao(user);
	}
	@Override
	public Integer updateQiantui(User user) {
		return userMapper.updateQiantui(user);
	}
	@Override
	public Integer UpdateUserPassword(User user) {
		return userMapper.UpdateUserPassword(user);
	}
	
	
	
	

}
