package com.dx.dxmanage.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dx.dxmanage.po.Permission;
import com.dx.dxmanage.po.Role;
import com.dx.dxmanage.service.IPermissionService;
import com.dx.dxmanage.service.IRoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author fang
 *
 * @Date 2019年1月18日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */

@Controller
@RequestMapping("permission")
public class PermissionHandler {
	@Resource
	private IPermissionService permissionService;
	@Resource
	private IRoleService roleService;

	/**
	 * 查询所有权限
	 * 
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("selectAllPermission.dx")
	@ResponseBody
	public Map<String, Object> selectAllPermission(Integer page, Integer limit) {
		Map<String, Object> resultMap = new HashMap<>();
		PageHelper.startPage(page, limit);
		PageInfo<Permission> pageInfo = null;
		try {
			pageInfo = new PageInfo<Permission>(permissionService.selectAllPermission());
			resultMap.put("count", pageInfo.getTotal());
			resultMap.put("data", pageInfo.getList());
			resultMap.put("code", 0);
			resultMap.put("msg", "成功返回");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 更新权限
	 * 
	 * @param permission
	 * @return
	 */
	@RequestMapping("updatePermission.dx")
	@ResponseBody
	public Map<String, Object> updatePermission(Permission permission) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			permissionService.updatePermission(permission);
			resultMap.put("code", 200);
			resultMap.put("msg", "已更新");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "更新失败");
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 根据角色id查询部分权限列表
	 * 
	 * @param roleid
	 * @param codeid
	 * @return
	 */
	@RequestMapping("selectPermissions.dx")
	@ResponseBody
	public List<Object> selectPermissions(Long roleid, String codeid) {

		List<Object> resultList = new ArrayList<>();
		try {
			List<Permission> roleHasPs = this.selectPermissionsByRoleid(roleid);
			List<Long> pids = new ArrayList<>();
			for (Permission p : roleHasPs) {
				pids.add(p.getId());
			}
			List<Permission> pList1 = permissionService.selectPermissionsOne();
			for (Permission p : pList1) {
				if (codeid.equals(p.getCodeid())) {
					Map<String, Object> resultMap1 = new HashMap<>();
					resultMap1.put("title", p.getName());
					resultMap1.put("value", p.getId());
					if (!pids.isEmpty() && pids.contains(p.getId())) {// 如果此角色中已经有此权限
						resultMap1.put("checked", true);
					}
					List<Object> resultList2 = new ArrayList<>();
					List<Permission> pList2 = permissionService.selectPermissionsTwo(p.getCodeid());
					for (Permission p2 : pList2) {
						Map<String, Object> resultMap2 = new HashMap<>();
						resultMap2.put("title", p2.getName());
						resultMap2.put("value", p2.getId());
						if (!pids.isEmpty() && pids.contains(p2.getId())) {// 如果此角色中已经有此权限
							resultMap2.put("checked", true);
						}
						List<Object> resultList3 = new ArrayList<>();
						List<Permission> pList3 = permissionService.selectPermissionsThree(p2.getCodeid());
						for (Permission p3 : pList3) {
							Map<String, Object> resultMap3 = new HashMap<>();
							resultMap3.put("title", p3.getName());
							resultMap3.put("value", p3.getId());
							if (!pids.isEmpty() && pids.contains(p3.getId())) {// 如果此角色中已经有此权限
								resultMap3.put("checked", true);
							}
							resultList3.add(resultMap3);
						}
						resultMap2.put("data", resultList3);
						resultList2.add(resultMap2);
					}
					resultMap1.put("data", resultList2);
					resultList.add(resultMap1);

					break;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return resultList;
	}

	public List<Permission> selectPermissionsByRoleid(Long roleid) {
		List<Permission> resultList = new ArrayList<>();
		try {
			resultList = permissionService.selectPermissionByRoleId(roleid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
}
