package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.service.StudentService;

@Controller
public class StudentController {
@Autowired
private Fenye<Student> fenye;
@Autowired
private StudentService studentService;

@RequestMapping(value="/showStuents",method=RequestMethod.POST)
@ResponseBody
public Fenye<Student> shows(Integer page,Integer rows,String sName,String sPhone,String loginName){
	
	fenye.setPage((page-1)*rows);
	fenye.setPageSize(rows);	
	fenye.setsName(sName);
	fenye.setsPhone(sPhone);	
	fenye.setLoginName(loginName);
	/*fenye.setsIsPay(sIsPay);
	fenye.setsIsValid(sIsValid);
	fenye.setsIsReturnVist(sIsReturnVist);
	fenye.setsQQ(sQQ);
	fenye.setsCreateTime(sCreateTime);*/
	
	fenye=studentService.selectStu(fenye);
			return fenye;	
	
}

@RequestMapping(value="/insertStu",method=RequestMethod.POST)
@ResponseBody
public Integer insertStu(Student student) {
	return studentService.insertStu(student);
}



@RequestMapping(value="/lookStu",method=RequestMethod.POST)
@ResponseBody
public Student lookStu(Integer  sId) {
	return studentService.lookStu(sId);
}



@RequestMapping(value="/updateStu",method=RequestMethod.POST)
@ResponseBody
public Integer updateStu(Student student){
	return studentService.updateStu(student);
	
}
}
