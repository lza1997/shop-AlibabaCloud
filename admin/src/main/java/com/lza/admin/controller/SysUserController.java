

package com.lza.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.lza.admin.dto.UserDTO;
import com.lza.admin.entity.SysUser;
import com.lza.admin.service.SysUserService;
import com.lza.common.core.util.R;
import com.lza.common.security.annotation.Inner;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * @author lengleng
 * @date 2018/12/16
 */
@RestController
@AllArgsConstructor
@RequestMapping("/user")
@Api(value = "user", tags = "用户管理模块")
public class SysUserController {
	private final SysUserService userService;

	/**
	 * 获取指定用户全部信息
	 *
	 * @return 用户信息
	 */
	@Inner
	@GetMapping("/info/{username}")
	public R info(@PathVariable String username) {
		SysUser user = userService.getOne(Wrappers.<SysUser>query()
				.lambda().eq(SysUser::getUsername, username));
		if (user == null) {
			return R.failed(null, String.format("用户信息为空 %s", username));
		}
		return R.ok(userService.findUserInfo(user));
	}

	/**
	 * 通过ID查询用户信息
	 *
	 * @param id ID
	 * @return 用户信息
	 */
	@GetMapping("/{id}")
	public R user(@PathVariable Integer id) {
		return R.ok(userService.selectUserVoById(id));
	}

	/**
	 * 根据用户名查询用户信息
	 *
	 * @param username 用户名
	 * @return
	 */
	@GetMapping("/details/{username}")
	public R user(@PathVariable String username) {
		SysUser condition = new SysUser();
		condition.setUsername(username);
		return R.ok(userService.getOne(new QueryWrapper<>(condition)));
	}

	/**
	 * 删除用户信息
	 *
	 * @param id ID
	 * @return R
	 */

	@DeleteMapping("/{id}")
	@PreAuthorize("@pms.hasPermission('sys_user_del')")
	@ApiOperation(value = "删除用户", notes = "根据ID删除用户")
	@ApiImplicitParam(name = "id", value = "用户ID", required = true, dataType = "int", paramType = "path")
	public R userDel(@PathVariable Integer id) {
		SysUser sysUser = userService.getById(id);
		return R.ok(userService.deleteUserById(sysUser));
	}

	/**
	 * 添加用户
	 *
	 * @param userDto 用户信息
	 * @return success/false
	 */

	@PostMapping
	@PreAuthorize("@pms.hasPermission('sys_user_add')")
	public R user(@RequestBody UserDTO userDto) {
		return R.ok(userService.saveUser(userDto));
	}

	/**
	 * 更新用户信息
	 *
	 * @param userDto 用户信息
	 * @return R
	 */

	@PutMapping
	@PreAuthorize("@pms.hasPermission('sys_user_edit')")
	public R updateUser(@Valid @RequestBody UserDTO userDto) {
		return R.ok(userService.updateUser(userDto));
	}

	/**
	 * 分页查询用户
	 *
	 * @param page    参数集
	 * @param userDTO 查询参数列表
	 * @return 用户集合
	 */
	@GetMapping("/page")
	public R getUserPage(Page page, UserDTO userDTO) {
		return R.ok(userService.getUsersWithRolePage(page, userDTO));
	}

	/**
	 * 修改个人信息
	 *
	 * @param userDto userDto
	 * @return success/false
	 */

	@PutMapping("/edit")
	public R updateUserInfo(@Valid @RequestBody UserDTO userDto) {
		return userService.updateUserInfo(userDto);
	}

	/**
	 * @param username 用户名称
	 * @return 上级部门用户列表
	 */
	@GetMapping("/ancestor/{username}")
	public R listAncestorUsers(@PathVariable String username) {
		return R.ok(userService.listAncestorUsers(username));
	}
}
