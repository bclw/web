package com.ysd.service;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;

public interface UserService {
	//根据名称查询用户是否存在(登陆)
	List<User> selectByname(User u);
	//更新登陆用户信息
	Integer updateUserLoginInfo(User u);
	//查询所有用户
	Fenye<User> selectUser(Fenye<User> fenye);
	//添加用户
	Integer insertUser(User user);
	//删除用户
	Integer deleteUser(Integer  uId);
	//修改用户
	Integer updateUser(User user);
	//重置密码
	Integer resetPsd(User user);
	//锁定用户
	Integer suodingUser(User user);
	//解锁用户
	Integer jiesuoUser(User user);
	
	
	

	
	//查看所有角色
	List<Roles> selectRoles();
	//显示所有用户角色
	List<Roles> selectUserRoles(Integer id);
	
	
	//添加用户角色
	Integer insertUserRoles(Userroles userroles);
	//删除用户角色
	Integer deleteUserRoles(Integer roleId);
}
