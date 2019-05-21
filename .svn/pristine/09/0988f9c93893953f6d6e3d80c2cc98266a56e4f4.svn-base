package com.dx.dxmanage.handler;



import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dx.dxmanage.po.Credentials;
import com.dx.dxmanage.po.Customer;
import com.dx.dxmanage.po.SP;
import com.dx.dxmanage.po.Sales;
import com.dx.dxmanage.service.ICredentialsService;
import com.dx.dxmanage.service.ICustomerService;
import com.dx.dxmanage.service.ISPService;
import com.dx.dxmanage.service.ISalesService;
import com.dx.dxmanage.service.ITicketService;
import com.dx.dxmanage.util.DateUtil;
import com.dx.dxmanage.util.ExcelUtil;
import com.dx.dxmanage.util.FileUtil;
import com.dx.dxmanage.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("sales")
public class SalesHandler {
	@Resource
	private ISalesService salesService;
	@Resource
	private ITicketService ticketService;
	@Resource
	private ICustomerService customerService;
	@Resource
	private ISPService spService;
	@Resource
	private ICredentialsService credentialsService;

	/**
	 * 查询所有客户购买商品情况
	 * 
	 * @param page
	 * @param limit
	 * @param notGetMoney
	 * @param haveTicket
	 * @param membership
	 * @param codeOrName
	 * @param salesdateRange
	 * @param payment
	 * @param payeebank
	 * @return
	 */
	@RequestMapping("selectAllSales.dx")
	@ResponseBody
	public Map<String, Object> selectAllSales(Integer page, Integer limit, Boolean notGetMoney, Boolean haveTicket,
			String membership, String codeOrName, String salesdateRange, String payment, String payeebank) {
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		PageHelper.startPage(page, limit);
		PageInfo<Sales> pageInfo = null;
		try {
			paramMap.put("notGetMoney", notGetMoney);
			paramMap.put("haveTicket", haveTicket);
			paramMap.put("membership", membership);
			paramMap.put("codeOrName", codeOrName);
			paramMap.put("payment", payment);
			paramMap.put("payeebank", payeebank);
			if (salesdateRange != null && !"".equals(salesdateRange)) {
				String salesdateBegin = salesdateRange.substring(0, 8);
				String salesdateEnd = salesdateRange.substring(salesdateRange.length() - 8, salesdateRange.length());
				paramMap.put("salesdateBegin", salesdateBegin);
				paramMap.put("salesdateEnd", salesdateEnd);
			}
			pageInfo = new PageInfo<Sales>(salesService.selectAllSales(paramMap));
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
	 * 根据客户id查询客户的销售记录
	 * 
	 * @param customerid
	 *            客户id
	 */
	@RequestMapping("selectSalesByCid.dx")
	@ResponseBody
	public Map<String, Object> selectSalesByCid(Integer page, Integer limit, String customerid) {
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		Map<String, Object> paramMap2 = new HashMap<>();
		PageHelper.startPage(page, limit);
		PageInfo<Sales> pageInfo = null;
		try {
			paramMap.put("customerid", customerid);
			List<Sales> saleses = salesService.selectAllSales(paramMap);
			for (Sales s : saleses) {
				paramMap2.put("salesid", s.getSalesid());
				// 查询此销售记录是否已经对账
				if (!"刷卡".equals(s.getPayment()) && !"现金".equals(s.getPayment())) {
					List<SP> sps = spService.selectSps(paramMap2);
					if (sps.isEmpty()) {
						s.setTimelimit("未对账");// 用销售记录的timelimit字段记录此销售是否对账
					}
				}
			}
			pageInfo = new PageInfo<Sales>(saleses);
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
	 * 展示销售信息编辑页面
	 * 
	 * @param salesid
	 *            销售id
	 */
	@RequestMapping(value = "editSalesPage.dx", method = RequestMethod.GET)
	public ModelAndView editSalesPage(Integer salesid) {
		ModelAndView mav = new ModelAndView();
		try {
			Sales sales = salesService.selectByPrimaryKey(salesid);
			mav.addObject("sales", sales);
			mav.setViewName("/sales/editSalesPage");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 展示新增销售信息页面
	 * 
	 * @param customerid
	 *            客户id
	 */
	@RequestMapping("addSalesPage.dx")
	public ModelAndView addSalesPage(Integer customerid) {
		ModelAndView mav = new ModelAndView();
		try {
			Customer customer = customerService.selectByCustomerid(customerid);
			mav.addObject("customer", customer);
			mav.setViewName("/sales/addSalesPage");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	/**
	 * 新增销售信息
	 * 
	 * @param sales
	 *            销售实体对象
	 */
	@RequestMapping("addSales.dx")
	@ResponseBody
	public Map<String, Object> addSales(Sales sales) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			salesService.addSales(sales);
			resultMap.put("code", 200);
			resultMap.put("msg", "新增成功");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "新增失败");
			e.getStackTrace();
		}
		return resultMap;
	}

	/**
	 * 更新销售信息
	 * 
	 * @param sales
	 *            销售实体对象
	 */
	@RequestMapping("updateSales.dx")
	@ResponseBody
	public Map<String, Object> updateSales(Sales sales) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			salesService.updateSales(sales);
			resultMap.put("code", 200);
			resultMap.put("msg", "更新成功");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "更新失败");
			e.getStackTrace();
		}
		return resultMap;
	}

	/**
	 * 查询所有未开发票销售记录
	 * 
	 * @param page
	 * @param limit
	 * @return
	 */
	@RequestMapping("selectNotTicketSales.dx")
	@ResponseBody
	public Map<String, Object> selectNotTicketSales(Integer page, Integer limit) {
		Map<String, Object> resultMap = new HashMap<>();
		PageHelper.startPage(page, limit);
		PageInfo<Sales> pageInfo = null;
		try {
			List<Sales> salesList = salesService.selectNotTicketSales();
			pageInfo = new PageInfo<Sales>(salesList);
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
	 * 批量删除销售信息
	 * 
	 * @param salesIds
	 *            销售id数组
	 * @return
	 */
	@RequestMapping("deleteSales.dx")
	@ResponseBody
	public Map<String, Object> deleteSales(@RequestParam(value = "salesIds[]") Integer[] salesIds) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			for (int sid : salesIds) {
				salesService.deleteByPrimaryKey(sid);
			}
			resultMap.put("code", 200);
			resultMap.put("msg", "成功删除 " + salesIds.length + " 条记录");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "删除失败");
			e.printStackTrace();
		}
		return resultMap;

	}

	/**
	 * 上传支付凭证
	 * 
	 * @param file
	 *            上传的文件
	 * @param salesid
	 *            销售id
	 * @return
	 */
	@RequestMapping(value = "uploadCredentials.dx", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadResult(@RequestParam("file") MultipartFile file, Integer salesid) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			// 获取文件名加后缀
			String fileName = file.getOriginalFilename();
			// 文件后缀
			String fileF = fileName.substring(fileName.lastIndexOf("."), fileName.length());
			// 获取新文件名（唯一，没有后缀）
			String date1 = DateUtil.getDate(new Date(), "yyyyMM");
			String fileAdd = DateUtil.getDate(new Date(), "yyyyMMdd") + UUIDUtil.getUUIDCode();
			// 新文件名
			fileName = fileAdd + fileF;
			// 创建文件夹
			String url = System.getProperty("catalina.home") + "/webapps/credentialsPho/"
					+ DateUtil.getDate(new Date(), "yyyyMM");
			// return String “300”代表源文件为空；“200”代表上传成功;“500”代表上传失败
			String code = FileUtil.uploadPic(file, url, fileName);
			if ("200".equals(code)) {
				// 凭证上传成功，将对应销售记录credentials字段设置为“有”
				Sales sales = new Sales();
				sales.setSalesid(salesid);
				sales.setPaycredentials("有");
				salesService.updateSales(sales);
				// 将上传地址添加到credentials表中
				Credentials credentials = new Credentials();
				credentials.setSalesid(salesid);
				credentials.setUrl(date1 + "/" + fileName);
				credentialsService.insertSelective(credentials);
				resultMap.put("code", 200);
				resultMap.put("msg", "上传成功");
			} else if ("400".equals(code)) {
				resultMap.put("code", 400);
				resultMap.put("msg", "上传失败");
			}
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "上传失败");
			e.printStackTrace();
		}

		return resultMap;

	}

	/**
	 * 导出销售信息记录(方法1)
	 * 
	 * @param notGetMoney
	 * @param haveTicket
	 * @param membership
	 * @param codeOrName
	 * @param salesdateRange
	 * @param request
	 * @param response
	 */

	@RequestMapping(value = "/exportSalesInfo.dx")
	public void exportSalesInfo(Boolean notGetMoney, Boolean haveTicket, String membership, String codeOrName,
			String salesdateRange, String payment, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> paramMap = new HashMap<>();
		// 获取数据
		paramMap.put("notGetMoney", notGetMoney);
		paramMap.put("haveTicket", haveTicket);
		paramMap.put("membership", membership);
		paramMap.put("codeOrName", codeOrName);
		paramMap.put("payment", payment);
		if (salesdateRange != null && !"".equals(salesdateRange)) {
			String salesdateBegin = salesdateRange.substring(0, 8);
			String salesdateEnd = salesdateRange.substring(salesdateRange.length() - 8, salesdateRange.length());
			paramMap.put("salesdateBegin", salesdateBegin);
			paramMap.put("salesdateEnd", salesdateEnd);
		}
		List<Sales> salesList = salesService.selectAllSales(paramMap);
		// excel标题
		String[] title = { "销售时间", "购买客户", "商品名称", "总金额", "开票名称", "发票号码", "支付方式", "收款账户", "信用代码", "姓名", "联系方式", "邮箱" };
		// excel文件名
		String fileName = "销售信息表.xls";

		// sheet名
		String sheetName = "销售信息表";
		int size = salesList.size();
		String[][] content = new String[size][];
		for (int i = 0; i < size; i++) {
			content[i] = new String[title.length];
			content[i][0] = salesList.get(i).getSalesdate();
			if (salesList.get(i).getCustomer() != null) {
				content[i][1] = salesList.get(i).getCustomer().getCustomername();
			}
			if (salesList.get(i).getGoods() != null) {
				content[i][2] = salesList.get(i).getGoods().getGoodsname();
			}
			content[i][3] = salesList.get(i).getAmount().toString();
			content[i][4] = salesList.get(i).getReceipt();
			content[i][5] = salesList.get(i).getTicketnum();
			content[i][6] = salesList.get(i).getPayment();
			content[i][7] = salesList.get(i).getPayeebank();
			if (salesList.get(i).getCustomer() != null) {
				content[i][8] = salesList.get(i).getCustomer().getCreditcode();
			}
			content[i][9] = salesList.get(i).getLinkman();
			content[i][10] = salesList.get(i).getTel();
			content[i][11] = salesList.get(i).getEmail();
		}

		// 创建HSSFWorkbook
		HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
		// 响应到客户端
		try {
			ExcelUtil.setResponseHeader(response, fileName);
			OutputStream os = response.getOutputStream();
			wb.write(os);
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 导出销售信息记录（方法2）
	 * 
	 * @param notGetMoney
	 * @param haveTicket
	 * @param membership
	 * @param codeOrName
	 * @param salesdateRange
	 * @param request
	 * @param response
	 */

	@RequestMapping(value = "/exportSales.dx")
	@ResponseBody
	public Map<String, Object> exportSales(Boolean notGetMoney, Boolean haveTicket, String membership,
			String codeOrName, String salesdateRange, String payment, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<>();
		Map<String, Object> paramMap = new HashMap<>();
		List<Sales> salesList = null;
		try {
			paramMap.put("notGetMoney", notGetMoney);
			paramMap.put("haveTicket", haveTicket);
			paramMap.put("membership", membership);
			paramMap.put("codeOrName", codeOrName);
			paramMap.put("payment", payment);
			if (salesdateRange != null && !"".equals(salesdateRange)) {
				String salesdateBegin = salesdateRange.substring(0, 8);
				String salesdateEnd = salesdateRange.substring(salesdateRange.length() - 8, salesdateRange.length());
				paramMap.put("salesdateBegin", salesdateBegin);
				paramMap.put("salesdateEnd", salesdateEnd);
			}
			salesList = salesService.selectAllSales(paramMap);
			// excel标题
			String[] title = { "销售时间", "购买客户", "商品名称", "总金额", "开票名称", "发票号码", "支付方式", "收款账户", "信用代码", "姓名", "联系方式",
					"邮箱" };
			// excel文件名
			Date date = new Date();
			// String fnames = DateUtil.getDate(new Date(), "yyyyMMddhhmmssSSS");
			// String fileName = "销售信息表"+fnames+".xls";
			String fileName = "销售信息表.xls";

			// sheet名
			String sheetName = "销售信息表";
			int size = salesList.size();
			String[][] content = new String[size][];
			for (int i = 0; i < size; i++) {
				content[i] = new String[title.length];
				content[i][0] = salesList.get(i).getSalesdate();
				if (salesList.get(i).getCustomer() != null) {
					content[i][1] = salesList.get(i).getCustomer().getCustomername();
				}
				if (salesList.get(i).getGoods() != null) {
					content[i][2] = salesList.get(i).getGoods().getGoodsname();
				}
				content[i][3] = salesList.get(i).getAmount().toString();
				content[i][4] = salesList.get(i).getReceipt();
				content[i][5] = salesList.get(i).getTicketnum();
				content[i][6] = salesList.get(i).getPayment();
				content[i][7] = salesList.get(i).getPayeebank();
				if (salesList.get(i).getCustomer() != null) {
					content[i][8] = salesList.get(i).getCustomer().getCreditcode();
				}
				content[i][9] = salesList.get(i).getLinkman();
				content[i][10] = salesList.get(i).getTel();
				content[i][11] = salesList.get(i).getEmail();
			}

			// 创建HSSFWorkbook
			HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
			// 将excel表格先下载到/build文件夹下
			String path = request.getSession().getServletContext().getRealPath("/build");
			String fileURL = path + "\\" + fileName;
			FileOutputStream outputStream = new FileOutputStream(fileURL);
			outputStream.flush();
			wb.write(outputStream);
			resultMap.put("code", 200);
			resultMap.put("msg", fileName);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", 400);
			resultMap.put("msg", "加载数据失败");
		}
		return resultMap;
	}

}
