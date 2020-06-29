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
import com.lza.common.core.constant.CommonConstants;
import com.lza.common.core.constant.SecurityConstants;
import com.lza.common.core.util.WebUtils;
import com.lza.common.security.handler.AuthenticationFailureHandler;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
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
public class ZaAuthenticationFailureEventHandler implements AuthenticationFailureHandler {
	private final RemoteLogService logService;

	/**
	 * 异步处理，登录失败方法
	 * <p>
	 *
	 * @param authenticationException 登录的authentication 对象
	 * @param authentication          登录的authenticationException 对象
	 * @param request                 请求
	 * @param response                响应
	 */
	@Async
	@Override
	@SneakyThrows
	public void handle(AuthenticationException authenticationException, Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
		String username = authentication.getName();
		log.info("用户：{} 登录失败，异常：{}", username, authenticationException.getLocalizedMessage());
	}
}
