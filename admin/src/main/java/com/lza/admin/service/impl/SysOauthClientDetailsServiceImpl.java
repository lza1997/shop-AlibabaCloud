package com.lza.admin.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lza.admin.entity.SysOauthClientDetails;
import com.lza.admin.mapper.SysOauthClientDetailsMapper;
import com.lza.admin.service.SysOauthClientDetailsService;
import com.lza.common.core.constant.CacheConstants;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author lengleng
 * @since 2018-05-15
 */
@Service
public class SysOauthClientDetailsServiceImpl extends ServiceImpl<SysOauthClientDetailsMapper, SysOauthClientDetails> implements SysOauthClientDetailsService {

	/**
	 * 通过ID删除客户端
	 *
	 * @param clientId
	 * @return
	 */
	@Override
	@CacheEvict(value = CacheConstants.CLIENT_DETAILS_KEY, key = "#clientId")
	public Boolean removeByClientId(String clientId) {
		return this.remove(Wrappers.<SysOauthClientDetails>lambdaQuery()
				.eq(SysOauthClientDetails::getClientId, clientId));
	}

	/**
	 * 根据客户端信息
	 *
	 * @param clientDetails
	 * @return
	 */
	@Override
	@CacheEvict(value = CacheConstants.CLIENT_DETAILS_KEY, key = "#clientDetails.clientId")
	public Boolean updateClientById(SysOauthClientDetails clientDetails) {
		return this.updateById(clientDetails);
	}
}
