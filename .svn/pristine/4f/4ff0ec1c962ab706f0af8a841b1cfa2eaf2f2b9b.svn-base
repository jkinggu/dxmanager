package com.dx.dxmanage.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author fang
 *
 * @Date 2018年10月26日
 *
 *       项目名 mecvip
 *
 * @version 1.0
 */
public class DateUtil {
	/**
	 * 
	 * 方法说明：给一个日期获得其他的日期
	 *
	 * 参数1 farmat：日期格式
	 *
	 * 参数2 date：传入的初始日期
	 *
	 * 参数3 num：想要得到的哪天（正数：代表后num天，负数：代表前num天）
	 * 
	 * return farmat格式字符串的日期
	 */
	public static String getAnotherDay(String farmat, String date, Integer num) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat(farmat);
		Date date_ = sdf.parse(date);// 将字符串转化为时间格式
		Calendar calendar = Calendar.getInstance(); // 得到日历
		calendar.setTime(date_);// 把开始日期赋给日历
		calendar.add(Calendar.DAY_OF_MONTH, num); // 设置为num天
		Date resultDate = calendar.getTime(); // 得到后7天的时间
		return sdf.format(resultDate);
	}

	/**
	 * 获取一定格式的日期 param date 日期
	 * 
	 * param farmat 日期格式
	 * 
	 * return string 给定格式的日期
	 */
	public static String getDate(Date date, String farmat) {
		SimpleDateFormat sdf = new SimpleDateFormat(farmat);
		String resultDate = sdf.format(date);
		return resultDate;
	}

}
