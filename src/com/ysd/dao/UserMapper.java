package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Roles;
import com.ysd.entity.Student;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;

public interface UserMapper {
	
	/**
	 * 登录
	 * @param u
	 * @return
	 */
	
	//根据名称查询用户是否存在(登陆)
	List<User> selectUserByname(User u);
	//更新用户登陆信息
	Integer updateUserLoginInfo(User u);
	
	/**
	 * 对用户进行操作
	 * @param fenye
	 * @return
	 */
	
	
	//查询所有用户
	Integer selectUserCount(Fenye fenye);
	//分页多条件查询
	List<User> selectUser(Fenye fenye);
	//添加用户
	Integer insertUser(User user);
	//删除用户
	Integer deleteUser(Integer uId);
	//修改
	Integer updateUser(User user);
	
	//重置密码
	Integer resetPsd(User user);
	
	
	//锁定用户
	Integer suodingUser(User user);
	//解锁用户
	Integer jiesuoUser(User user);
	
	
	
	//根据roleId查userId
	List<Userroles> selectUserRolesByRolesId(Integer id);
	
	
	
	
	/**
	 * 进行用户角色设置
	 * @return
	 */
	//显示所有角色
	List<Roles> selectRoles(); 
	//显示所有用户角色
	List<Roles> selectUserRoles(Integer id);
	//给用户添加角色
	Integer insertUserRoles(Userroles userroles);
	//删除用户角色
	Integer deleteUserRoles(Integer roleId);
	
	
	
	
	//我的信息
			User select(Integer id);
			//修改我的信息
					Integer updateMessage(User user);
					//签到
					Integer updateQiandao(User user);
					//签退
					Integer updateQiantui(User user);
					//修改用户密码
					Integer UpdateUserPassword(User user);
	
}
