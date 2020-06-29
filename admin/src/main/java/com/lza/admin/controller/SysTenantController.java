
package com.lza.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.lza.admin.entity.SysTenant;
import com.lza.admin.service.SysTenantService;
import com.lza.common.core.constant.CacheConstants;
import com.lza.common.core.util.R;
import com.lza.common.security.annotation.Inner;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;


/**
 * 租户管理
 *
 * @date 2019-05-15 15:55:41
 */
@RestController
@AllArgsConstructor
@RequestMapping("/tenant")
@Api(value = "tenant", tags = "租户管理")
public class SysTenantController {

	private final SysTenantService sysTenantService;

	/**
	 * 分页查询
	 *
	 * @param page      分页对象
	 * @param sysTenant 租户
	 * @return
	 */
	@GetMapping("/page")
	public R getSysTenantPage(Page page, SysTenant sysTenant) {
		return R.ok(sysTenantService.page(page, Wrappers.query(sysTenant)));
	}


	/**
	 * 通过id查询租户
	 *
	 * @param id id
	 * @return R
	 */
	@GetMapping("/{id}")
	public R getById(@PathVariable("id") Integer id) {
		return R.ok(sysTenantService.getById(id));
	}

	/**
	 * 新增租户
	 *
	 * @param sysTenant 租户
	 * @return R
	 */

	@PostMapping
	@PreAuthorize("@pms.hasPermission('admin_systenant_add')")
	@CacheEvict(value = CacheConstants.TENANT_DETAILS, allEntries = true)
	public R save(@RequestBody SysTenant sysTenant) {
		return R.ok(sysTenantService.saveTenant(sysTenant));
	}

	/**
	 * 修改租户
	 *
	 * @param sysTenant 租户
	 * @return R
	 */

	@PutMapping
	@PreAuthorize("@pms.hasPermission('admin_systenant_edit')")
	@CacheEvict(value = CacheConstants.TENANT_DETAILS, allEntries = true)
	public R updateById(@RequestBody SysTenant sysTenant) {
		return R.ok(sysTenantService.updateById(sysTenant));
	}

	/**
	 * 通过id删除租户
	 *
	 * @param id id
	 * @return R
	 */

	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('admin_systenant_del')")
	@CacheEvict(value = CacheConstants.TENANT_DETAILS, allEntries = true)
	public R removeById(@PathVariable Integer id) {
		return R.ok(sysTenantService.removeById(id));
	}

	/**
	 * 查询全部有效的租户
	 *
	 * @return
	 */
	@Inner(value = false)
	@GetMapping("/list")
	public R list() {
		List<SysTenant> tenants = sysTenantService.getNormalTenant()
				.stream()
				.filter(tenant -> tenant.getStartTime().isBefore(LocalDate.now()))
				.filter(tenant -> tenant.getEndTime().isAfter(LocalDate.now()))
				.collect(Collectors.toList());
		return R.ok(tenants);
	}

}
