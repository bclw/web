package com.ysd.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Modules;
import com.ysd.service.ModulesService;

@Controller
public class ModulesController {

	@Autowired
	private ModulesService modulesService;

	@RequestMapping("getPage")
	@ResponseBody
	public List<Map<String, Object>> getPage(Integer id) {
		return modulesService.getModule(1);
	}
	
	// 显示所有模块
	@RequestMapping(value = "/getModules", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> selectModules() {
		return modulesService.selectModules();
	}
	//添加模块
	@RequestMapping(value = "/insertModule", method = RequestMethod.POST)
	@ResponseBody
	public Integer insertModule(Modules modules){
		return modulesService.insertModule(modules);
	}
	
	// 修改模块
	@RequestMapping(value = "/updateModule", method = RequestMethod.POST)
	@ResponseBody
	public Integer updateModule(Modules modules) {
		return modulesService.updateModule(modules);
	}
	
	
	// 删除模块
	@RequestMapping(value = "/deleteModule", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteModule(Integer mId) {
		return modulesService.deleteModule(mId);
	}
	
}
