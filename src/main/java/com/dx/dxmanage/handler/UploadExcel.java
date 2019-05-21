package com.dx.dxmanage.handler;


import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dx.dxmanage.po.Payment;
import com.dx.dxmanage.service.IPaymentService;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

@Controller
public class UploadExcel {
	@Resource
	private IPaymentService paymentService;

	@RequestMapping("excelUpload.dx")
	@ResponseBody
	public Map<String, Object> upload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("file") MultipartFile file, ModelMap map2) {
		Map<String, Object> resultMap = new HashMap<>();
		// String fileName = file.getOriginalFilename();// 获取文件名
		// String path =
		// request.getSession().getServletContext().getRealPath("/upload");

		// 记录数
		int nos = 0;
		try {
			// MultipartFile fileFile = multipartRequest.getFile("file");; //这里是页面的name属性
			// 判断是否有输入流
			if (file.getSize() != 0) {
				// 转换成输入流
				InputStream is = file.getInputStream();
				// 得到excel
				Workbook workbook = Workbook.getWorkbook(is);
				// 得到sheet
				Sheet sheet = workbook.getSheet(0);
				// 得到列数
				int colsNum = sheet.getColumns();
				// 得到行数
				int rowsNum = sheet.getRows();
				// 单元格
				Cell cell;
				if (colsNum < 14) {
					resultMap.put("code", 300);
					resultMap.put("msg", "导入的文件模板不正确");
					return resultMap;
				}
				// 创建map集合
				Map<Integer, String> map = new HashMap<Integer, String>();
				for (int i = 1; i < rowsNum - 1; i++) {// 我的excel第一行是标题,所以 i从1开始
					for (int j = 0; j < colsNum; j++) {
						cell = sheet.getCell(j, i);// 注意:第一个参数是列.第二个参数是行
						map.put(j, cell.getContents()); // 存储 到map集合中

					}
					// 创建实体对象
					Payment payment = new Payment();
					Payment payment1 = null;
					if (map.get(1) != "" && !"".equals(map.get(1))) {
						payment1 = paymentService.selectPaymentByPaynum(map.get(1));
					}
					// 查询判定此条记录是否已经存在数据库
					if (payment1 == null) {
						// 从map里取出来的value存到实体中
						payment.setTransdate(map.get(0));
						payment.setPaynum(map.get(1));
						if (map.get(2) != "" && !"".equals(map.get(2))) {
							payment.setReceived(Double.parseDouble(map.get(2)));
						}
						if (map.get(3) != "" && !"".equals(map.get(3))) {
							payment.setPaid(Double.parseDouble(map.get(3)));
						}
						if (map.get(4) != "" && !"".equals(map.get(4))) {
							payment.setBalance(Double.parseDouble(map.get(4)));
						}
						if (map.get(5) != "" && !"".equals(map.get(5))) {
							payment.setCharge(Double.parseDouble(map.get(5)));
						}
						payment.setDealstyle(map.get(6));
						payment.setBankname(map.get(7));
						payment.setBanknum(map.get(8));
						payment.setName(map.get(9));
						payment.setRemark(map.get(10));
						payment.setSummary(map.get(11));
						payment.setPostscript(map.get(12));
						payment.setPayeebank(map.get(13));
						// 保存实体
						if (map.get(0) != null && !"".equals(map.get(0))) {
							nos = nos + paymentService.insertPayment(payment);
						}
					}

				}
				if (nos == 0) {
					resultMap.put("code", 200);
					resultMap.put("msg", "数据均已存在,无需导入");
				} else {
					resultMap.put("code", 200);
					resultMap.put("msg", "成功导入" + nos + "条数据!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", 500);
			resultMap.put("msg", "流水导入失败");
		}
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); // 在火狐下不设置返回类型的话，默认返回的是text/xml(xmldomcument)对象了。无法进行1==1比较，登不进系统。
		return resultMap;
	}
}
