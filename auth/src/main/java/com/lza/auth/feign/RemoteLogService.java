package com.lza.auth.feign;


import com.lza.auth.entity.SysLog;
import com.lza.common.core.constant.SecurityConstants;
import com.lza.common.core.constant.ServiceNameConstants;
import com.lza.common.core.util.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * @date 2018/6/28
 */
@FeignClient(contextId = "remoteLogService", value = ServiceNameConstants.ADMIN_SERVICE)
public interface RemoteLogService {
	/**
	 * 保存日志
	 *
	 * @param sysLog 日志实体
	 * @param from   是否内部调用
	 * @return succes、false
	 */
	@PostMapping("/log/save")
	R<Boolean> saveLog(@RequestBody SysLog sysLog, @RequestHeader(SecurityConstants.FROM) String from);
}
