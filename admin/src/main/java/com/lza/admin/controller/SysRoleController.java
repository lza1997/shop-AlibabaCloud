

package com.lza.admin.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.lza.admin.entity.SysRole;
import com.lza.admin.service.SysRoleMenuService;
import com.lza.admin.service.SysRoleService;
import com.lza.admin.vo.RoleVO;
import com.lza.common.core.util.R;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**

 * @date 2020-02-10
 */
@RestController
@AllArgsConstructor
@RequestMapping("/role")
@Api(value = "role", tags = "角色管理模块")
public class SysRoleController {
	private final SysRoleService sysRoleService;
	private final SysRoleMenuService sysRoleMenuService;

	/**
	 * 通过ID查询角色信息
	 *
	 * @param id ID
	 * @return 角色信息
	 */
	@GetMapping("/{id}")
	public R getById(@PathVariable Integer id) {
		return R.ok(sysRoleService.getById(id));
	}

	/**
	 * 添加角色
	 *
	 * @param sysRole 角色信息
	 * @return success、false
	 */

	@PostMapping
	@PreAuthorize("@pms.hasPermission('sys_role_add')")
	public R save(@Valid @RequestBody SysRole sysRole) {
		return R.ok(sysRoleService.save(sysRole));
	}

	/**
	 * 修改角色
	 *
	 * @param sysRole 角色信息
	 * @return success/false
	 */

	@PutMapping
	@PreAuthorize("@pms.hasPermission('sys_role_edit')")
	public R update(@Valid @RequestBody SysRole sysRole) {
		return R.ok(sysRoleService.updateById(sysRole));
	}

	/**
	 * 删除角色
	 *
	 * @param id
	 * @return
	 */

	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('sys_role_del')")
	public R removeById(@PathVariable Integer id) {
		return R.ok(sysRoleService.removeRoleById(id));
	}

	/**
	 * 获取角色列表
	 *
	 * @return 角色列表
	 */
	@GetMapping("/list")
	public R listRoles() {
		return R.ok(sysRoleService.list(Wrappers.emptyWrapper()));
	}

	/**
	 * 分页查询角色信息
	 *
	 * @param page 分页对象
	 * @return 分页对象
	 */
	@GetMapping("/page")
	public R getRolePage(Page page) {
		return R.ok(sysRoleService.page(page, Wrappers.emptyWrapper()));
	}

	/**
	 * 更新角色菜单
	 *
	 * @param roleVo 角色对象
	 * @return success、false
	 */

	@PutMapping("/menu")
	@PreAuthorize("@pms.hasPermission('sys_role_perm')")
	public R saveRoleMenus(@RequestBody RoleVO roleVo) {
		SysRole sysRole = sysRoleService.getById(roleVo.getRoleId());
		return R.ok(sysRoleMenuService.saveRoleMenus(sysRole.getRoleCode()
				, roleVo.getRoleId(), roleVo.getMenuIds()));
	}

	/**
	 * 通过角色ID 查询角色列表
	 *
	 * @param roleIdList 角色ID
	 * @return
	 */
	@PostMapping("/getRoleList")
	public R getRoleList(@RequestBody List<String> roleIdList) {
		return R.ok(sysRoleService.listByIds(roleIdList));
	}
}
