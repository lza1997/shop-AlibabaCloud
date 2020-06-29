package com.lza.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.lza.admin.entity.SysDept;
import com.lza.common.data.datascope.DataScope;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 * 部门管理 Mapper 接口
 * </p>
 *

 * @since 2018-01-20
 */
@Mapper
public interface SysDeptMapper extends BaseMapper<SysDept> {

	/**
	 * 根据数据权限查询部门
	 *
	 * @param dataScope
	 * @return
	 */
	List<SysDept> listDepts(DataScope dataScope);
}
