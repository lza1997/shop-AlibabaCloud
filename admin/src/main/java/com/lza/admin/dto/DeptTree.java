

package com.lza.admin.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**

 * @date 2018/1/20
 * 部门树
 */
@Data
@ApiModel(value = "部门树")
@EqualsAndHashCode(callSuper = true)
public class DeptTree extends TreeNode {
	@ApiModelProperty(value = "部门名称")
	private String name;
}
