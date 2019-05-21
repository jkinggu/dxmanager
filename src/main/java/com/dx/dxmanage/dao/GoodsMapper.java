package com.dx.dxmanage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dx.dxmanage.po.Goods;

public interface GoodsMapper {
	// 根据主键商品id删除商品
	int deleteByPrimaryKey(Integer goodsid);

	// 添加商品
	int insertGoods(Goods record);

	// 根据主键商品id查询商品
	Goods selectByPrimaryKey(@Param("goodsid") Integer goodsid);

	int updateByPrimaryKeySelective(Goods record);

	// 查询所有商品
	List<Goods> selectAllGoods();

}