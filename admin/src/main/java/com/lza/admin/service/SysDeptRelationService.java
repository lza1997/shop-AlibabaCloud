package com.lza.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lza.admin.entity.SysDept;
import com.lza.admin.entity.SysDeptRelation;


/**
 * <p>
 * 服务类
 * </p>
 * @since 2018-02-12
 */
public interface SysDeptRelationService extends IService<SysDeptRelation> {

	/**
	 * 新建部门关系
	 *
	 * @param sysDept 部门
	 */
	void insertDeptRelation(SysDept sysDept);

	/**
	 * 通过ID删除部门关系
	 *
	 * @param id
	 */
	void deleteAllDeptRealtion(Integer id);

	/**
	 * 更新部门关系
	 *
	 * @param relation
	 */
	void updateDeptRealtion(SysDeptRelation relation);
}
