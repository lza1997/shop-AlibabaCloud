package com.lza.admin.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.lza.admin.entity.SysLog;
import com.lza.admin.vo.PreLogVO;

import java.util.List;

/**
 * <p>
 * 日志表 服务类
 * </p>
 *
 * @author lengleng
 * @since 2017-11-20
 */
public interface SysLogService extends IService<SysLog> {


	/**
	 * 批量插入前端错误日志
	 *
	 * @param preLogVoList 日志信息
	 * @return true/false
	 */
	Boolean saveBatchLogs(List<PreLogVO> preLogVoList);
}
