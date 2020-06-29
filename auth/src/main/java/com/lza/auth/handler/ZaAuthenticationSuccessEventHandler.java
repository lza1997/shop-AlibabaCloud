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

package com.lza.auth.handler;

import cn.hutool.core.util.StrUtil;
import com.lza.auth.entity.SysLog;
import com.lza.auth.feign.RemoteLogService;
import com.lza.common.core.constant.SecurityConstants;
import com.lza.common.core.util.WebUtils;
import com.lza.common.security.handler.AuthenticationSuccessHandler;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author lengleng
 * @date 2018/10/8
 */
@Slf4j
@Component
@AllArgsConstructor
public class ZaAuthenticationSuccessEventHandler implements AuthenticationSuccessHandler {
	private final RemoteLogService logService;

	/**
	 * 处理登录成功方法
	 * <p>
	 * 获取到登录的authentication 对象
	 *
	 * @param authentication 登录对象
	 * @param request        请求
	 * @param response       返回
	 */
	@Async
	@Override
	public void handle(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
	String username = authentication.getName();

		log.info("用户：{} 登录成功", username);
	}
}
