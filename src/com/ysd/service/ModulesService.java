package com.ysd.service;

import java.util.List;
import java.util.Map;

import com.ysd.entity.Modules;

public interface ModulesService {
	
 List<Map<String,Object>> getModule(Integer uid);
 
 List<Map<String,Object>> selectModules(); 
 
 Integer insertModule(Modules modules);
 
 Integer updateModule(Modules modules);
 
 Integer deleteModule(Integer mId);
}