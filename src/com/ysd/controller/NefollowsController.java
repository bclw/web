package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Nefollows;
import com.ysd.entity.Student;
import com.ysd.service.NefollowsStudentServiceImpl;

@Controller
public class NefollowsController {
	@Autowired
	private Fenye<Nefollows> fenye;
	@Autowired
	private NefollowsStudentServiceImpl nefollowsStudentServiceImpl;

//璺熻釜
	@RequestMapping("Nefollows")
	@ResponseBody
	public int insertNefollows(Nefollows nefollows) {
	
		return nefollowsStudentServiceImpl.insertNefollows(nefollows);
	}

//鏌ヨ鎵�鏈�
	@RequestMapping("NefollowsAll")
	@ResponseBody
	public Fenye<Nefollows> NefollowsAll(Integer page, Integer rows,
			 String nStudentName,
			String nFollowTime, String nNextFollowTime, String nFollowType, String nFollowState) {
		fenye.setPage((page - 1) * rows);
		fenye.setPageSize(rows);
		//鐢ㄦ埛id
		fenye.setuId(1);		
		fenye.setnStudentName(nStudentName);
		fenye.setnFollowTime(nFollowTime);
		fenye.setnNextFollowTime(nNextFollowTime);
		fenye.setnFollowType(nFollowType);
		fenye.setnFollowState(nFollowState);
		fenye=nefollowsStudentServiceImpl.selectAllNefollows(fenye);
		return fenye;
	}
	@RequestMapping("updateNefollows")
	@ResponseBody
	public int updateNefollows(Nefollows nefollows) {
		return nefollowsStudentServiceImpl.updateStudent(nefollows);
		
	}
}
