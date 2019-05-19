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
	//根据名称查询用户是否存在(登陆)
	public List<User> selectByname(User u) {
		return userMapper.selectUserByname(u);
	}
	//更新用户登录信息
	public Integer updateUserLoginInfo(User u) {
		return userMapper.updateUserLoginInfo(u);
	}
	//显示所有用户
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
	public List<Roles> selectRoles() {
		return userMapper.selectRoles();
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
	
	

}
