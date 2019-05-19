package com.ysd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Roles;
import com.ysd.entity.User;
import com.ysd.entity.Userroles;
import com.ysd.service.UserService;

@Controller
@ResponseBody
@WebServlet(name = "login")
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private Fenye<User> fenye;
	
	
	@RequestMapping(value = "/ulogin", method = RequestMethod.POST)
	public Integer login(HttpServletRequest request,
			HttpServletResponse response) {
		Integer i = null;
		String name = request.getParameter("un");
		String pwd = request.getParameter("pwd");
		User users = new User();
		users.setLoginName(name);
		List<User> user = userService.selectByname(users);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = sdf.format(date);
		if (user.size() > 0) {
			if (user.get(0).getIsLockOut() == 0) {
				if (pwd.equals(user.get(0).getPassword())) {
					HttpSession session = request.getSession(true);
					session.setAttribute("name", name);
					
					Integer id = user.get(0).getuId();
					users.setuId(id);
					users.setLastLoginTime(format);
					users.setPadWrongTime(1);
					userService.updateUserLoginInfo(users);
					i = 1;/* ��½�ɹ� */
				} else {
					i = 2; /* ������� */
					Integer id = user.get(0).getuId();
					users.setuId(id);
					
					Integer pswWrongTime = user.get(0).getPadWrongTime();
					if (pswWrongTime == 4) {
						i = 3;
						users.setIsLockOut(1);
						users.setLockTime(format);
						userService.updateUserLoginInfo(users);
					}
					users.setPadWrongTime(pswWrongTime + 1);
					userService.updateUserLoginInfo(users);
				}
			} else {
				i = 3;/* ���˻��ѱ����� */
			}
		} else {
			i = 0;/* �û������� */
		}
		return i;
	}
	
	@RequestMapping(value = "/logout")
	public Integer logout(HttpSession session) {
		Integer i=0;
		if(session.getAttribute("name") != null) {
			session.removeAttribute("name");
			i=2;
		}
		return i;
	}
	
	
	@RequestMapping(value = "/selectUsers", method = RequestMethod.POST)
	@ResponseBody
	public Fenye<User> selectUser(Integer page,Integer rows,String named,String startTime,String endTime,String lockd){
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		
		fenye.setNamed(named);
		fenye.setLockd(lockd);
		fenye.setStartTime(startTime);
		fenye.setEndTime(endTime);
		
		fenye=userService.selectUser(fenye);
		return fenye;
		
	}
	
		// ��������
		@RequestMapping(value = "/resetPsd", method = RequestMethod.POST)
		@ResponseBody
		public Integer resetPsd(User user) {
			return userService.resetPsd(user);
		}
		
		
		
		// �����û�
		@RequestMapping(value = "/suodingUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer suodingUser(User user) {
			return userService.suodingUser(user);
		}
		
		// �����û�
		@RequestMapping(value = "/jiesuoUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer jiesuoUser(User user) {
			return userService.jiesuoUser(user);
		}
		
		
		
	
	
	
	    // �޸�
		@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateUser(User user) {
			return userService.updateUser(user);
		}

		// ɾ��
		@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteUser(Integer uId) {
			return userService.deleteUser(uId);
		}

		// ����û�
		@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertUser(User user) {
			return userService.insertUser(user);
		}
		
		
		// ��ʾ���н�ɫ
		@RequestMapping(value = "/selectRoles", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Roles> selectRoles() {
			 List<Roles> selectRoles = userService.selectRoles();
			 Fenye<Roles> fenye = new Fenye<Roles>();
			 fenye.setRows(selectRoles);
			 
			 return fenye;
		}
		// ��ʾ�����û���ɫ
		@RequestMapping(value = "/selectUserRoles", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Roles> selectUserRoles(Integer id) {
			List<Roles> selectUserRoles = userService.selectUserRoles(id);
			Fenye<Roles> fenye = new Fenye<Roles>();
			fenye.setRows(selectUserRoles);
			return fenye;
		}
		
		// ɾ���û���ɫ
		@RequestMapping(value = "/deleteUserRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteUserRoles(Integer roleId) {
			Integer i = userService.deleteUserRoles(roleId);
			System.out.println(roleId);
			System.out.println(i);
			return i;
		}
	
		// ����û���ɫ
		@RequestMapping(value = "/inserUserRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertUserRoles(Userroles userroles) {
			Integer i = userService.insertUserRoles(userroles);
			System.out.println(i);
			return i;
		}


}
