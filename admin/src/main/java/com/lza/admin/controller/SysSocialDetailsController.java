
package com.lza.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.lza.admin.entity.SysSocialDetails;
import com.lza.admin.service.SysSocialDetailsService;
import com.lza.common.core.util.R;
import com.lza.common.security.annotation.Inner;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


/**
 * 系统社交登录账号表
 * @date 2018-08-16 21:30:41
 */
@RestController
@RequestMapping("/social")
@AllArgsConstructor
@Api(value = "social", tags = "三方账号管理模块")
public class SysSocialDetailsController {
	private final SysSocialDetailsService sysSocialDetailsService;


	/**
	 * 社交登录账户简单分页查询
	 *
	 * @param page             分页对象
	 * @param sysSocialDetails 社交登录
	 * @return
	 */
	@GetMapping("/page")
	public R getSocialDetailsPage(Page page, SysSocialDetails sysSocialDetails) {
		return R.ok(sysSocialDetailsService.page(page, Wrappers.query(sysSocialDetails)));
	}


	/**
	 * 信息
	 *
	 * @param type 类型
	 * @return R
	 */
	@GetMapping("/{type}")
	public R getByType(@PathVariable("type") String type) {
		return R.ok(sysSocialDetailsService
				.list(Wrappers.<SysSocialDetails>lambdaQuery()
				.eq(SysSocialDetails::getType, type)));
	}

	/**
	 * 保存
	 *
	 * @param sysSocialDetails
	 * @return R
	 */

	@PostMapping
	@PreAuthorize("@pms.hasPermission('sys_social_details_add')")
	public R save(@Valid @RequestBody SysSocialDetails sysSocialDetails) {
		return R.ok(sysSocialDetailsService.save(sysSocialDetails));
	}

	/**
	 * 修改
	 *
	 * @param sysSocialDetails
	 * @return R
	 */

	@PutMapping
	@PreAuthorize("@pms.hasPermission('sys_social_details_edit')")
	public R updateById(@Valid @RequestBody SysSocialDetails sysSocialDetails) {
		sysSocialDetailsService.updateById(sysSocialDetails);
		return R.ok(Boolean.TRUE);
	}

	/**
	 * 删除
	 *
	 * @param id
	 * @return R
	 */

	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('sys_social_details_del')")
	public R removeById(@PathVariable Integer id) {
		return R.ok(sysSocialDetailsService.removeById(id));
	}

	/**
	 * 通过社交账号、手机号查询用户、角色信息
	 *
	 * @param inStr appid@code
	 * @return
	 */
	@Inner
	@GetMapping("/info/{inStr}")
	public R getUserInfo(@PathVariable String inStr) {
		return R.ok(sysSocialDetailsService.getUserInfo(inStr));
	}

	/**
	 * 绑定社交账号
	 *
	 * @param state 类型
	 * @param code  code
	 * @return
	 */
	@PostMapping("/bind")
	public R bindSocial(String state, String code) {
		return R.ok(sysSocialDetailsService.bindSocial(state, code));
	}
}
