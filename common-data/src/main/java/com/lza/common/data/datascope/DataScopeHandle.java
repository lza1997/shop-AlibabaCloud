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

package com.lza.common.data.datascope;

import java.util.List;

/**
 * @date 2019-09-07
 * <p>
 * data scope 判断处理器,抽象服务扩展
 */
public interface DataScopeHandle {

	/**
	 * 计算用户数据权限
	 *
	 * @param deptList
	 * @return
	 */
	Boolean calcScope(List<Integer> deptList);
}
