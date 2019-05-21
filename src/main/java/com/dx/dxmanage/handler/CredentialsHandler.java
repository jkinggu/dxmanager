package com.dx.dxmanage.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dx.dxmanage.po.Credentials;
import com.dx.dxmanage.po.Sales;
import com.dx.dxmanage.service.ICredentialsService;
import com.dx.dxmanage.service.ISalesService;
import com.dx.dxmanage.util.FileUtil;

/**
 * @author fang
 *
 * @Date 2019年1月16日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
@Controller
@RequestMapping("credentials")
public class CredentialsHandler {
	@Resource
	private ICredentialsService credentialsService;
	@Resource
	private ISalesService salesService;

	@RequestMapping("selectCredentialsByCid.dx")
	@ResponseBody
	public List<Credentials> selectCredentialsByCid(Integer salesid, HttpServletRequest request) {
		List<Credentials> credentials = new ArrayList<>();
		try {
			credentials = credentialsService.selectCredentialsByCid(salesid);
			// 获取项目路径
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
					+ "/";
			for (Credentials c : credentials) {
				c.setUrl(basePath + "credentialsPho/" + c.getUrl());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return credentials;

	}

	/**
	 * 清空缴费凭证
	 * 
	 * @param salesIds
	 *            销售id数组
	 * @return
	 */
	@RequestMapping("clearCredentials.dx")
	@ResponseBody
	public Map<String, Object> clearCredentials(@RequestParam(value = "salesIds[]") Integer[] salesIds) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			// credentialsService.clearCredentials(salesIds);
			for (Integer id : salesIds) {
				String url = System.getProperty("catalina.home") + "/webapps/credentialsPho/";
				List<Credentials> credentials = new ArrayList<>();
				credentials = credentialsService.selectCredentialsByCid(id);

				for (Credentials c : credentials) {
					credentialsService.deleteByPrimaryKey(c.getId());// 删除数据库记录
					String fileName = url + c.getUrl();
					FileUtil.delete(fileName);// 删除本地图片
				}
				// 修改对应销售的凭证记录
				Sales sales = new Sales();
				sales.setSalesid(id);
				sales.setPaycredentials("0");
				salesService.updateSales(sales);
			}
			resultMap.put("code", 200);
			resultMap.put("msg", "已清空");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "清空失败");
			e.printStackTrace();
		}
		return resultMap;

	}

}
