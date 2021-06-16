package com.zy.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.dao.admin.AuthorityDao;
import com.zy.po.admin.Authority;
import com.zy.service.admin.AuthorityService;
@Service
public class AuthorityServiceImpl implements AuthorityService {

	@Autowired
	private AuthorityDao authorityDao;
	
	@Override
	public int add(Authority authority) {
		// TODO Auto-generated method stub
		return authorityDao.add(authority);
	}

	@Override
	public int deleteByRoleId(Long roleId) {
		// TODO Auto-generated method stub
		return authorityDao.deleteByRoleId(roleId);
	}

	@Override
	public List<Authority> findListByRoleId(Long roleId) {
		// TODO Auto-generated method stub
		return authorityDao.findListByRoleId(roleId);
	}

}
