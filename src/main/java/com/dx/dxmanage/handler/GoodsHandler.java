package com.dx.dxmanage.handler;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dx.dxmanage.po.Goods;
import com.dx.dxmanage.service.IGoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("goods")
public class GoodsHandler {
	@Resource
	private IGoodsService goodsService;

	// 获取商品供商品选择栏使用
	@RequestMapping("gainGoods.dx")
	@ResponseBody
	public List<Goods> selectAllGoods2() {
		List<Goods> list = new ArrayList<>();
		try {
			list = goodsService.selectAllGoods();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 查询所有商品
	@RequestMapping("selectAllGoods.dx")
	@ResponseBody
	public Map<String, Object> selectAllGoods(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		PageInfo<Goods> pageInfo = null;
		Map<String, Object> resultMap = new HashMap<>();
		try {
			pageInfo = new PageInfo<Goods>(goodsService.selectAllGoods());
			resultMap.put("code", 0);// 返回状态码，0代表成功，其他为失败
			resultMap.put("msg", "成功返回");// 返回错误信息
			resultMap.put("count", pageInfo.getTotal());// 返回从条数
			resultMap.put("data", pageInfo.getList());// 返回数据data
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	// 根据商品id查询商品信息
	@RequestMapping("selectGoodsByGoodsid.dx")
	@ResponseBody
	public Goods selectGoodsByGoodsid(Integer goodsid) {
		Goods goods = null;
		try {
			goods = goodsService.selectByPrimaryKey(goodsid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return goods;
	}

	// 添加商品
	@RequestMapping("addGoods.dx")
	@ResponseBody
	public Map<String, Object> addGoods(Goods goods) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			goodsService.insertGoods(goods);
			resultMap.put("code", 200);
			resultMap.put("msg", "已新增");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "新增失败");
			e.printStackTrace();
		}
		return resultMap;
	}

	/**
	 * 根据主键goodsid删除商品
	 * 
	 * @param goodsid
	 * @return
	 */
	@RequestMapping("deleteGoodsByCid.dx")
	@ResponseBody
	public Map<String, Object> deleteGoods(Integer goodsid) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			goodsService.deleteByPrimaryKey(goodsid);
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
	 * 返回商品编辑页面，并返回商品信息
	 * 
	 * @param goodsid
	 * @return
	 */
	@RequestMapping(value = "editGoods.dx", method = RequestMethod.GET)
	public ModelAndView editGoods(Integer goodsid) {
		ModelAndView mav = new ModelAndView();
		Goods goods = null;
		try {
			goods = goodsService.selectByPrimaryKey(goodsid);
			mav.addObject("goods", goods);
			mav.setViewName("goods/editGoodsForm");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	/**
	 * 接收商品实体，更新商品信息
	 * 
	 * @param goods
	 * @return
	 */
	@RequestMapping("updateGoods.dx")
	@ResponseBody
	public Map<String, Object> updateGoods(Goods goods) {
		Map<String, Object> resultMap = new HashMap<>();
		try {
			goodsService.updateGoods(goods);
			resultMap.put("code", 200);
			resultMap.put("msg", "已更新");
		} catch (Exception e) {
			resultMap.put("code", 400);
			resultMap.put("msg", "更新失败");
			e.printStackTrace();
		}
		return resultMap;
	}
}
