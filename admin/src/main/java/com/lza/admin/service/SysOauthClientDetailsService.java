package com.lza.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.lza.admin.entity.SysOauthClientDetails;


/**
 * <p>
 * service服务类
 * </p
 * @since 2018-05-15
 */
public interface SysOauthClientDetailsService extends IService<SysOauthClientDetails> {
	/**
	 * 通过ID删除客户端
	 *
	 * @param clientId
	 * @return
	 */
	Boolean removeByClientId(String clientId);

	/**
	 * 根据客户端信息
	 *
	 * @param clientDetails
	 * @return
	 */
	Boolean updateClientById(SysOauthClientDetails clientDetails);
}
