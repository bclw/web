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
					User u = userService.select(id);
					
					String em=u.geteMail();
					String tel=u.getmTel();
					String ext=u.getuExt();
					System.out.println(em);
					users.setuId(id);
					users.setLastLoginTime(format);
					users.setPadWrongTime(1);
					session.setAttribute("id",id);
					session.setAttribute("em",em);
					session.setAttribute("tel",tel);
					session.setAttribute("ext",ext);
					userService.updateUserLoginInfo(users);
					i = 1;/* 登陆成功 */
				} else {
					i = 2; /* 密码错误 */
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
				i = 3;/* 该账户已被锁定 */
			}
		} else {
			i = 0;/* 用户不存在 */
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
	
		// 重置密码
		@RequestMapping(value = "/resetPsd", method = RequestMethod.POST)
		@ResponseBody
		public Integer resetPsd(User user) {
			return userService.resetPsd(user);
		}
		
		
		
		// 锁定用户
		@RequestMapping(value = "/suodingUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer suodingUser(User user) {
			return userService.suodingUser(user);
		}
		
		// 解锁用户
		@RequestMapping(value = "/jiesuoUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer jiesuoUser(User user) {
			return userService.jiesuoUser(user);
		}
		
		
		
	
	
	
	    // 修改
		@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateUser(User user) {
			return userService.updateUser(user);
		}

		// 删除
		@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteUser(Integer uId) {
			return userService.deleteUser(uId);
		}

		// 添加用户
		@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertUser(User user) {
			return userService.insertUser(user);
		}
		
		
		// 显示所有角色
		@RequestMapping(value = "/selectRoles", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Roles> selectRoles() {
			 List<Roles> selectRoles = userService.selectRoles();
			 Fenye<Roles> fenye = new Fenye<Roles>();
			 fenye.setRows(selectRoles);
			 
			 return fenye;
		}
		// 显示所有用户角色
		@RequestMapping(value = "/selectUserRoles", method = RequestMethod.POST)
		@ResponseBody
		public Fenye<Roles> selectUserRoles(Integer id) {
			List<Roles> selectUserRoles = userService.selectUserRoles(id);
			Fenye<Roles> fenye = new Fenye<Roles>();
			fenye.setRows(selectUserRoles);
			return fenye;
		}
		
		// 删除用户角色
		@RequestMapping(value = "/deleteUserRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer deleteUserRoles(Integer roleId) {
			Integer i = userService.deleteUserRoles(roleId);
			System.out.println(roleId);
			System.out.println(i);
			return i;
		}
	
		// 添加用户角色
		@RequestMapping(value = "/inserUserRoles", method = RequestMethod.POST)
		@ResponseBody
		public Integer insertUserRoles(Userroles userroles) {
			Integer i = userService.insertUserRoles(userroles);
			System.out.println(i);
			return i;
		}
		
		
		
		// 修改信息
		@RequestMapping(value = "/updateMessage", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateMessage(User user,HttpSession session) {
			Integer i = userService.updateMessage(user);
			if(i>0){
				Integer id = user.getuId();
				User u = userService.select(id);
				String name=u.getLoginName();
				String em=u.geteMail();
				String tel=u.getmTel();
				String ext=u.getuExt();
				System.out.println(em);
				u.setuId(id);
				session.setAttribute("id",id);
				session.setAttribute("name", name);
				session.setAttribute("em",em);
				session.setAttribute("tel",tel);
				session.setAttribute("ext",ext);
			}
			return i;
		}
		@RequestMapping(value = "/updateQiandao", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateQiandao(User user,HttpSession session) {
			  session.getAttribute("name");
			     Integer id= (Integer)session.getAttribute("id");
				//user.setLoginName();
			     System.out.println(id);
				Integer i = userService.updateQiandao(user);
				if(i>0){
					User u = userService.select(id);
					String em=u.geteMail();
					String tel=u.getmTel();
					String loginName=u.getLoginName();
					String ext=u.getuExt();
					u.setuId(id);
					u.setLoginName(loginName);
					session.setAttribute("id",id);
					session.setAttribute("em",em);
					session.setAttribute("tel",tel);
					session.setAttribute("ext",ext);
					session.setAttribute("loginName",loginName);
					return i;
				}else{
				return i;
				}
		}
		@RequestMapping(value = "/updateQiantui", method = RequestMethod.POST)
		@ResponseBody	
		public Integer updateQiantui(User user,HttpSession session) {
		     session.getAttribute("name");
		     Integer id= (Integer)session.getAttribute("id");
			//user.setLoginName();
			Integer i = userService.updateQiantui(user);
			if(i>0){
				User u = userService.select(id);
				String em=u.geteMail();
				String tel=u.getmTel();
				String loginName=u.getLoginName();
				String ext=u.getuExt();
				u.setuId(id);
				u.setLoginName(loginName);
				session.setAttribute("id",id);
				session.setAttribute("em",em);
				session.setAttribute("tel",tel);
				session.setAttribute("ext",ext);
				session.setAttribute("loginName",loginName);
				return i;
			}else{
				return -1;
			}
			
			
		}

	    @RequestMapping(value="/updateUserPassword",method=RequestMethod.POST)
	    @ResponseBody
	    public Integer UpdateUserPassword( User u, Integer id, String oldPsd,String newPsd){
	    	User user=userService.select(id);
	    	
	    	if(oldPsd.equals(user.getPassword())){
	    		u.setuId(id);
	        	u.setPassword(newPsd);
	        	Integer Update=userService.UpdateUserPassword(u);
	        	return Update;
	    	}else{
	    		return -1;
	    	}
	    	
	    }


}
