/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */

package com.lza.admin.service.impl;

import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.lza.admin.dto.UserInfo;
import com.lza.admin.entity.SysSocialDetails;
import com.lza.admin.entity.SysUser;
import com.lza.admin.handler.LoginHandler;
import com.lza.admin.mapper.SysSocialDetailsMapper;
import com.lza.admin.mapper.SysUserMapper;
import com.lza.admin.service.SysSocialDetailsService;
import com.lza.common.core.constant.CacheConstants;
import com.lza.common.core.constant.enums.LoginTypeEnum;
import com.lza.common.security.util.SecurityUtils;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author lengleng
 * @date 2018年08月16日
 */
@Slf4j
@AllArgsConstructor
@Service("sysSocialDetailsService")
public class SysSocialDetailsServiceImpl extends ServiceImpl<SysSocialDetailsMapper, SysSocialDetails> implements SysSocialDetailsService {
	private final Map<String, LoginHandler> loginHandlerMap;
	private final CacheManager cacheManager;
	private final SysUserMapper sysUserMapper;

	/**
	 * 绑定社交账号
	 *
	 * @param type type
	 * @param code code
	 * @return
	 */
	@Override
	public Boolean bindSocial(String type, String code) {
		String identify = loginHandlerMap.get(type).identify(code);
		SysUser sysUser = sysUserMapper.selectById(SecurityUtils.getUser().getId());

		if (LoginTypeEnum.GITEE.getType().equals(type)) {
			sysUser.setGiteeLogin(identify);
		} else if (LoginTypeEnum.OSC.getType().equals(type)) {
			sysUser.setOscId(identify);
		} else if (LoginTypeEnum.WECHAT.getType().equals(type)) {
			sysUser.setWxOpenid(identify);
		} else if (LoginTypeEnum.QQ.getType().equals(type)) {
			sysUser.setQqOpenid(identify);
		} else if (LoginTypeEnum.MINI_APP.getType().equals(type)) {
			sysUser.setMiniOpenid(identify);
		}

		sysUserMapper.updateById(sysUser);
		//更新緩存
		cacheManager.getCache(CacheConstants.USER_DETAILS).evict(sysUser.getUsername());
		return Boolean.TRUE;
	}

	/**
	 * 根据入参查询用户信息
	 *
	 * @param inStr TYPE@code
	 * @return
	 */
	@Override
	public UserInfo getUserInfo(String inStr) {
		String[] inStrs = inStr.split(StringPool.AT);
		String type = inStrs[0];
		String loginStr = inStrs[1];
		return loginHandlerMap.get(type).handle(loginStr);
	}
}
