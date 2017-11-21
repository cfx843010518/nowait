package com.yjg.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjg.entity.Admin;
import com.yjg.entity.User;
import com.yjg.mapper.UserMapper;
import com.yjg.service.UserService;
import com.yjg.tools.MD5Encryption;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	// 查询用户能否登录
	@Override
	public User selectUser(String name) throws Exception {
		User user = new User();
		user.setUserName(name);
		return userMapper.selectUser(user);
	}

	// 查询管理员能否登录
	@Override
	public Admin selectAdmin(String name) throws Exception {
		Admin admin = new Admin();
		admin.setAdminName(name);
		return userMapper.selectAdmin(admin);
	}
	
	// 插入
	public void insert(User user) throws Exception {
		user.setPwd(MD5Encryption.encrypt(user.getPwd()));
		userMapper.insert(user);
	}

	//查询是否有该用户
	public int selectExist(String userName) throws Exception{
		return userMapper.selectExist(userName);
	}

	//查询所有用户列表
	public List selectUserList() throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectUserList();
	}

	//查询某个用户详细信息
	public User selectDetailUser(Integer id) throws Exception {
		
		return userMapper.selectDetailUser(id);
	}

	//修改某个用户
	public void updateUser(User user) throws Exception {
		this.userMapper.update(user);
	}

	//删除某个用户
	public void deleteUser(Integer id) throws Exception {
		this.userMapper.delete(id);
		
	}

	//修改管理员密码
	public void updatePwd(String adminName,String newPwd) throws Exception {
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("adminName", adminName);
		queryMap.put("pwd", newPwd);
		this.userMapper.updatePwd(queryMap);
		
	}

	//查询某个管理员密码
	public int selectPwd(String adminName, String pwd) throws Exception {
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("adminName", adminName);
		queryMap.put("pwd",pwd);
		return userMapper.selectPwd(queryMap);
	}

}
