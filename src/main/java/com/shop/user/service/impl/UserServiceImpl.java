package com.shop.user.service.impl;

import java.security.MessageDigest;
import java.util.UUID;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.core.service.impl.BaseServiceImpl;
import com.core.util.MailHelper;
import com.shop.user.dao.UserDao;
import com.shop.user.entity.User;
import com.shop.user.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	private UserDao userDao;
	
	@Resource
	public void setUserDao(UserDao userDao) {
		super.setBaseDao(userDao);
		this.userDao = userDao;
	}

	@Override
	public User login(String username, String password) {
		password = toMD5(password);
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class,"u");
		criteria.add(Restrictions.eq("u.username", username));
		criteria.add(Restrictions.eq("u.password", password));
		criteria.add(Restrictions.eq("u.state", 1));
		return userDao.selectByQBC(criteria);
	}
	
	/**
	 * md5加密
	 * @param source
	 * @return
	 */
	private String toMD5(String source) {
		StringBuffer buf = new StringBuffer("");
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(source.getBytes());
			byte[] digest = md.digest();
			int i;
			for(int offset = 0; offset < digest.length; offset++) {
				i = digest[offset];
				if(i < 0) {
					i += 256;
				}
				if(i < 16) {
					buf.append("0");
				}
				buf.append(Integer.toHexString(i));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return buf.toString();
	}

	@Override
	public void regist(User user) {
		user.setState(0);//未激活状态
		String code = UUID.randomUUID().toString();//设置激活码
		user.setCode(code);
		user.setPassword(toMD5(user.getPassword()));
		userDao.save(user);
		MailHelper.send(user.getEmail(), user.getCode());
	}
	
	public void update(User user) {
		user.setPassword(toMD5(user.getPassword()));
		userDao.update(user);
	}

	@Override
	public User findByUsename(String userName) {
		return userDao.selectByUsername(userName);
	}

	@Override
	public User findByCode(String code) {
		return userDao.selectByCode(code);
	}
	

}
