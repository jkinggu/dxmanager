package com.dx.dxmanage.handler;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dx.dxmanage.po.Role;
import com.dx.dxmanage.po.RolePermission;
import com.dx.dxmanage.service.IRolePermissionService;
import com.dx.dxmanage.service.IRoleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * @author fang
 *
 * @Date 2019年1月21日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
@Controller
@RequestMapping("role")
public class RoleHandler {
	@Resource
	private IRoleService roleService;

	@Resource
	private IRolePermissionService rolePermissionService;

	/**
	 * 查询所有角色
	 * 
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("selectAllRole.dx")
	@ResponseBody
	public Map<String, Object> selectAllPermission(Integer page, Integer limit) {

		Map<String, Object> resultMap = new HashMap<>();
		PageHelper.startPage(page, limit);
		PageInfo<Role> pageInfo = null;
		try {
			pageInfo = new PageInfo<Role>(roleService.selectAllRole());
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
	 * 返回更新用户角色页面
	 * 
	 * @param userid
	 * @return
	 */
	@RequestMapping("updateRolePage.dx")
	public ModelAndView updateRolePage(Long userid) {
		ModelAndView mav = new ModelAndView("role/updateUser_RolePage");
		try {
			List<Role> roles = roleService.selectAllRole();
			List<Role> userHasRoles = roleService.selectRoleByUid(userid);
			mav.addObject("roles", roles);
			mav.addObject("userHasRoles", userHasRoles);
			mav.addObject("userid", userid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 新增角色
	 * 
	 * @return
	 */
	@RequestMapping("addRole.dx")
	@ResponseBody
	public Map<String, Object> addRole(Role role) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			roleService.addRole(role);
			resultMap.put("code", 200);
			resultMap.put("msg", "新增成功");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "新增失败");
			e.printStackTrace();
		}

		return resultMap;
	}

	/**
	 * 更新角色
	 * 
	 * @return
	 */
	@RequestMapping("updateRole.dx")
	@ResponseBody
	public Map<String, Object> updateRole(Role role) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			roleService.updateRole(role);
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
	 * 批量删除角色
	 * 
	 * @param roleIds
	 * @return
	 */
	@RequestMapping("deleteRoles.dx")
	@ResponseBody
	public Map<String, Object> deleteRoles(@RequestParam(value = "roleIds[]") Integer[] roleIds) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			roleService.deleteRoles(roleIds);
			resultMap.put("code", 200);
			resultMap.put("msg", "已删除");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "删除失败");
			e.printStackTrace();
		}
		return resultMap;

	}

	/**
	 * 更新角色拥有权限
	 * 
	 * @param permissionIds
	 * @param roleid
	 * @return
	 */

	@RequestMapping(value = "updateRole_Permission.dx")
	@ResponseBody

	public Map<String, Object> updateRole_Permissions(@RequestParam(value = "permissionIds[]") Long[] permissionIds,
			Long roleid) {
		Map<String, Object> resultMap = new HashMap<>();
		try { // 首先清除该角色的所有权限
			rolePermissionService.deleteRolePermissionByRid(roleid);
			for (Long pid : permissionIds) {
				RolePermission rolePermission = new RolePermission(roleid, pid);
				rolePermissionService.insertSelective(rolePermission);
			}
			resultMap.put("code", 200);
			resultMap.put("msg", "操作成功");
		} catch (Exception e) {
			resultMap.put("code", 300);
			resultMap.put("msg", "操作失败");
		}
		return resultMap;
	}

}
