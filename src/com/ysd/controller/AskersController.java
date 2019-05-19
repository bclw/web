package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.service.AskersDaoMapperServiceImpl;
@Controller
public class AskersController {
	@Autowired
	private Fenye<Student> fenye;
	@Autowired
	private AskersDaoMapperServiceImpl askersDaoMapperServiceImpl;
	@RequestMapping("Askers")
	@ResponseBody
	public Fenye<Student> showNefollows(Integer page, Integer rows,  String sName, String sPhone, String askerName,
		String sIsPay, Integer sIsValid,Integer sIsHome, Integer sIsReturnVist, Integer sQQ, String sCreateTime) {
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		fenye.setsName(sName);
		fenye.setsPhone(sPhone);
		fenye.setAskerName(askerName);
		fenye.setsIsPay(sIsPay);
		fenye.setsIsValid(sIsValid);
		fenye.setsIsReturnVist(sIsReturnVist);
		fenye.setsQQ(sQQ);
		fenye.setsIsHome(sIsHome);
		fenye.setsCreateTime(sCreateTime);
        System.out.println("sIsValid:"+sIsValid);
		fenye = askersDaoMapperServiceImpl.selectStudent(fenye);
		System.out.println(fenye + "--------------------------------------");
		return fenye;
	}
	
	@RequestMapping("updateStudent")
	@ResponseBody
	public int updateStudent(Student stu) {
	/*	System.out.println(1231312);*/
		System.out.println("Student:____"+stu);
		return askersDaoMapperServiceImpl.updateStudent(stu);		
	}
}
