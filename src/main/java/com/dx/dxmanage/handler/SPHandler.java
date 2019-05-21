package com.dx.dxmanage.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dx.dxmanage.po.SP;
import com.dx.dxmanage.service.ISPService;
import com.dx.dxmanage.service.ISalesService;

@Controller
@RequestMapping("sp")
public class SPHandler {
	@Resource
	private ISPService spService;
	@Resource
	private ISalesService salesService;

	/**
	 * 新增销售与银行流水的对应记录
	 * 
	 * @param salesIds
	 *            销售id数组
	 * @param paymentIds
	 *            流水id数组
	 * @return
	 */
	@RequestMapping("insertSP.dx")
	@ResponseBody
	public Map<String, Object> insertSP(@RequestParam(value = "salesIds[]") Integer[] salesIds,
			@RequestParam(value = "paymentIds[]") Integer[] paymentIds) {
		Map<String, Object> resultMap = new HashMap<>();

		try {
			// 将销售记录salesid和银行流水paymentid对应存储
			if (salesIds.length >= paymentIds.length) {
				for (int sid : salesIds) {
					for (int pid : paymentIds) {
						SP sp = new SP(sid, pid);
						spService.insertSelective(sp);
					}
				}
			} else {
				for (int pid : paymentIds) {
					for (int sid : salesIds) {
						SP sp = new SP(sid, pid);
						spService.insertSelective(sp);
					}
				}
			}
			resultMap.put("code", 200);
			resultMap.put("msg", "核对成功");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", 400);
			resultMap.put("msg", "核对失败");
		}
		return resultMap;
	}

}
