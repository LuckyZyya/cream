package com.zy.dao.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.zy.po.admin.Authority;

/**
 * 权限实现类dao
 *
 */
@Repository
public interface AuthorityDao {
	public int add(Authority authority);
	public int deleteByRoleId(Long roleId);
	public List<Authority> findListByRoleId(Long roleId);
}
