
package com.lza.admin.controller;

import com.lza.admin.service.MobileService;
import com.lza.common.core.util.R;
import com.lza.common.security.annotation.Inner;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @date 2018/11/14
 * <p>
 * 手机验证码
 */
@RestController
@AllArgsConstructor
@RequestMapping("/mobile")
@Api(value = "mobile", tags = "手机管理模块")
public class MobileController {
	private final MobileService mobileService;

	@Inner(value = false)//不检验权限
	@GetMapping("/{mobile}")
	public R sendSmsCode(@PathVariable String mobile) {
		return mobileService.sendSmsCode(mobile);
	}
}
