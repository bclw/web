package com.ysd.controller;

import java.util.List;

import javafx.scene.control.Pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.entity.User;
import com.ysd.service.FenliangService;
@Controller
public class FenliangController {
	@Autowired
	private Fenye<Student> fenye;
	
	@Autowired
	private FenliangService fenliangService;
	
	
	@RequestMapping(value="/selectStuends",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> selectStuends(Integer page,Integer rows,String sName,String sPhone,Integer sIsPay,Integer sIsValid
			,Integer sIsReturnVist,Integer sQQ,String sCreateTime){
		
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		
		fenye.setsName(sName);
		fenye.setsPhone(sPhone);	
		fenye.setsIsPay(sIsPay);
		fenye.setsIsValid(sIsValid);
		fenye.setsIsReturnVist(sIsReturnVist);
		fenye.setsQQ(sQQ);
		fenye.setsCreateTime(sCreateTime);
		
		fenye=fenliangService.selectStuends(fenye);
		
				return fenye;	
		
	}

	@RequestMapping(value="/InsertStuends",method=RequestMethod.POST)
	@ResponseBody
	public Integer InsertStuends(Student student) {
		return fenliangService.InsertStuends(student);
	}



	@RequestMapping(value="/lookStuends",method=RequestMethod.POST)
	@ResponseBody
	public Student lookStuends(Integer  sId) {
		return fenliangService.lookStuends(sId);
	}
	
	
	@RequestMapping(value="/deletesStuends",method=RequestMethod.POST)
	@ResponseBody
	public Integer deletesStuends(Integer  sId) {
		return fenliangService.deleteStudents(sId);
	}
	
	@RequestMapping(value="/updateUserId",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUserId(Student  student) {
		System.out.println(student);
		return fenliangService.updateUserId(student);
	}

	
	@RequestMapping(value="/selectQD",method=RequestMethod.POST)
	@ResponseBody
	public List<User> selectQD(String uExt) {
		return fenliangService.selectQD(uExt);
	}
	
}
