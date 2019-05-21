package com.dx.dxmanage.util;

import java.io.UnsupportedEncodingException;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.Region;

/**
 * @author fang
 *
 * @Date 2018年12月12日
 *
 *       项目名 mecvip
 *
 * @version 1.0
 */
@SuppressWarnings("deprecation")
public class ExcelUtil {
	private HSSFWorkbook wb = null;// 得到Excel工作簿对象
	private HSSFSheet sheet = null;// 得到Excel工作表对象

	public ExcelUtil(HSSFWorkbook wb, HSSFSheet sheet) {
		this.wb = wb;
		this.sheet = sheet;
	}

	/**
	 * 导出Excel
	 * 
	 * @param sheetName
	 *            sheet名称
	 * @param title
	 *            标题
	 * @param values
	 *            内容
	 * @param wb
	 *            HSSFWorkbook对象
	 * @return
	 */
	public static HSSFWorkbook getHSSFWorkbook(String sheetName, String[] title, String[][] values, HSSFWorkbook wb) {

		// 第一步，创建一个HSSFWorkbook，对应一个Excel文件
		if (wb == null) {
			wb = new HSSFWorkbook();
		}

		// 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet(sheetName);
		// 设置行高和行宽
		sheet.setDefaultColumnWidth(30);
		// sheet.setDefaultRowHeight((short)800);
		// sheet.setColumnWidth(1, 100 * 256);

		// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
		HSSFRow row = sheet.createRow(0);

		// 第四步，创建表头单元格，并设置值表头 设置表头居中
		HSSFCellStyle styleHeader = wb.createCellStyle();
		styleHeader.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		styleHeader.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		styleHeader.setWrapText(true);// 指定单元格自动换行
		// 设置表头单元格字体
		HSSFFont fontHeader = wb.createFont();
		fontHeader.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		fontHeader.setFontName("微软雅黑");// 字体
		fontHeader.setFontHeightInPoints((short) 14);// 设置字体
		styleHeader.setFont(fontHeader);

		// 第五步，创建内容单元格，并设置内容单元格样式
		HSSFCellStyle styleBody = wb.createCellStyle();
		styleBody.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		styleBody.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		styleBody.setWrapText(true);// 指定单元格自动换行
		// 设置表头单元格字体
		HSSFFont fontBody = wb.createFont();
		fontBody.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		fontBody.setFontName("仿宋");// 字体
		fontBody.setFontHeightInPoints((short) 12);// 设置字体
		styleBody.setFont(fontBody);

		// 设置单元格背景色
		// styleHeader.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		// styleHeader.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

		// 声明列对象
		HSSFCell cell = null;

		// 创建标题
		for (int i = 0; i < title.length; i++) {
			// 设置标题行高度
			row.setHeight((short) 800);
			cell = row.createCell(i);
			// 定义单元格为字符串类型
			cell.setCellType(HSSFCell.ENCODING_UTF_16);// 中文处理
			cell.setCellStyle(styleHeader);
			cell.setCellValue(title[i]);
		}

		// 创建内容
		for (int i = 0; i < values.length; i++) {
			row = sheet.createRow(i + 1);
			// 设置内容行高度
			row.setHeight((short) 500);
			for (int j = 0; j < values[i].length; j++) {
				cell = row.createCell(j);
				// 定义单元格为字符串类型
				cell.setCellType(HSSFCell.ENCODING_UTF_16);// 中文处理
				cell.setCellStyle(styleBody);
				// 将内容按顺序赋给对应的列对象
				cell.setCellValue(values[i][j]);
			}
		}
		return wb;
	}

	/**
	 * 创建合计行
	 *
	 * @param colSum
	 *            需要合并到的列索引
	 * @param cellValue
	 */
	public void createLastSumRow(int colSum, List<String> list) {
		// 定义单元格格式，添加单元格表样式，并添加到工作簿
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 指定单元格垂直居中对齐
		cellStyle.setWrapText(true);// 指定单元格自动换行

		// 单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeight((short) 250);
		cellStyle.setFont(font);
		// 获取工作表最后一行
		HSSFRow lastRow = sheet.createRow((short) (sheet.getLastRowNum() + 1));
		HSSFCell sumCell = lastRow.createCell(0);// 创建Excel工作表指定行的单元格

		sumCell.setCellValue(new HSSFRichTextString("合计"));
		sumCell.setCellStyle(cellStyle);
		// 合并 最后一行的第零列-最后一行的第一列
		sheet.addMergedRegion(new Region(sheet.getLastRowNum(), (short) 0, sheet.getLastRowNum(), (short) colSum));// 指定合并区域

		for (int i = 2; i < (list.size() + 2); i++) {
			// 定义最后一行的第三列
			sumCell = lastRow.createCell(i);
			sumCell.setCellStyle(cellStyle);
			// 定义数组 从0开始。
			sumCell.setCellValue(new HSSFRichTextString(list.get(i - 2)));
		}
	}

	// 发送响应流方法
	public static void setResponseHeader(HttpServletResponse response, String fileName) {
		try {
			try {
				fileName = new String(fileName.getBytes(), "ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("application/octet-stream;charset=ISO8859-1");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			response.addHeader("Pargam", "no-cache");
			response.addHeader("Cache-Control", "no-cache");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}