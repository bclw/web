package com.ysd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.ModulesMapper;
import com.ysd.entity.Modules;

@Service
public class ModulesServiceImp implements ModulesService{
	@Autowired
	private ModulesMapper modulesMapper;

	@Override
	public List<Map<String, Object>> getModule(Integer uid) {
		List<Modules> map = modulesMapper.getModule(uid);// 用户所有的父模块
		List<Map<String, Object>> maplist = new ArrayList<Map<String, Object>>();
		// 循环搜有的父亲模块
		for (int i = 0; i < map.size(); i++) {
			Map<String, Object> listmap = new HashMap<>();
			listmap.put("id", map.get(i).getmId());
			listmap.put("text", map.get(i).getmName());
			listmap.put("mParentId", map.get(i).getmParentId());
			listmap.put("mPath", map.get(i).getmPath());
			listmap.put("mWeight", map.get(i).getmWeight());
			listmap.put("children", test(map.get(i).getmId()));
			maplist.add(listmap);

		}
		return maplist;
	}
	
	
	
	public List<Map<String,Object>> selectModules() {
		List<Modules> map = modulesMapper.selectModules();// 用户所有的父模块
		List<Map<String, Object>> maplist = new ArrayList<Map<String, Object>>();
		// 循环搜有的父亲模块
		for (int i = 0; i < map.size(); i++) {
			Map<String, Object> listmap = new HashMap<>();
			listmap.put("id", map.get(i).getmId());
			listmap.put("text", map.get(i).getmName());
			listmap.put("mParentId", map.get(i).getmParentId());
			listmap.put("mPath", map.get(i).getmPath());
			listmap.put("mWeight", map.get(i).getmWeight());
			listmap.put("children", test(map.get(i).getmId()));
			maplist.add(listmap);

		}
		return maplist;
	}
	
	
	//递归思想：自己调自己，给个方法跳出去
//List:父摸快
//Map<String, Object>map可以转化成json数据
	public List<Map<String, Object>> test(Integer id) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Modules> map = modulesMapper.getModeuleChlidren(id);
		if (map != null) {
			for (int i = 0; i < map.size(); i++) {
				Map<String, Object> listmap = new HashMap<>();
				listmap.put("id", map.get(i).getmId());
				listmap.put("text", map.get(i).getmName());
				listmap.put("mParentId", map.get(i).getmParentId());
				listmap.put("mPath", map.get(i).getmPath());
				listmap.put("mWeight", map.get(i).getmWeight());
				if (!modulesMapper.getModeuleChlidren(map.get(i).getmId()).toString().equals("[]")) {
					listmap.put("children", test(map.get(i).getmId()));
				}
				list.add(listmap);
			}

		}
		return list;
	}



	public Integer insertModule(Modules modules) {
		return modulesMapper.insertModule(modules);
	}



	public Integer updateModule(Modules modules) {
		return modulesMapper.updateModule(modules);
	}


	public Integer deleteModule(Integer mId) {
		List<Modules> selectModus = modulesMapper.selectModus(mId);
		if(selectModus.size()==0){
			return modulesMapper.deleteModule(mId);
		}else{
			return 0;
		}
		
		
		
	}
	

}
