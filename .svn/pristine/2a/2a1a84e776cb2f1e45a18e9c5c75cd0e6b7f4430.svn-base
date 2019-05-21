package com.dx.dxmanage.handler;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dx.dxmanage.po.Payment;
import com.dx.dxmanage.service.IPaymentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("payment")
public class PaymentHandler {
	@Resource
	private IPaymentService paymentService;

	// 查询所有流水信息
	@RequestMapping("selectAllPayment.dx")
	@ResponseBody
	public Map<String, Object> selectAllPayment(int page, int limit, String transdate) {
		PageHelper.startPage(page, limit);
		PageInfo<Payment> pageInfo = null;
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		List<Payment> list = new ArrayList<Payment>();
		try {
			if (transdate != null && !"".equals(transdate)) {
				String beginDate = transdate.split(" ~ ")[0];
				String endDate = transdate.split(" ~ ")[1];
				paramMap.put("beginDate", beginDate);
				paramMap.put("endDate", endDate);
			}
			list = paymentService.selectAllPayment(paramMap);
			pageInfo = new PageInfo<Payment>(list);
			resultMap.put("code", 0);
			resultMap.put("msg", "成功返回");
			resultMap.put("count", pageInfo.getTotal());
			resultMap.put("data", pageInfo.getList());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return resultMap;
	}

	// 根据主键paymentid删除流水信息
	@RequestMapping("deleteAllPayment.dx")
	@ResponseBody
	public String deleteAllPayment(String checkeds, ModelMap map) {
		String[] paymentids = checkeds.split("-");
		int n = 0;
		for (int i = 0; i < paymentids.length; i++) {
			int paymentid = Integer.parseInt(paymentids[i]);
			n = n + paymentService.deleteByPaymentid(paymentid);
		}
		map.addAttribute("n", n);

		return String.valueOf(n);
	}

}
