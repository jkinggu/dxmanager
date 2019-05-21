package com.dx.dxmanage.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.GoodsMapper;
import com.dx.dxmanage.po.Goods;
import com.dx.dxmanage.service.IGoodsService;


@Service
public class GoodsServiceImpl implements IGoodsService {
	private GoodsMapper goodsMapper;

	@Resource
	public void setGoodsMapper(GoodsMapper goodsMapper) {
		this.goodsMapper = goodsMapper;
	}

	
	public Goods selectByPrimaryKey(Integer goodsid) {
		// TODO Auto-generated method stub
		return goodsMapper.selectByPrimaryKey(goodsid);
	}


	public List<Goods> selectAllGoods() {
		// TODO Auto-generated method stub
		return goodsMapper.selectAllGoods();
	}


	public int insertGoods(Goods record) {
		// TODO Auto-generated method stub
		return goodsMapper.insertGoods(record);
	}


	public int deleteByPrimaryKey(Integer goodsid) {
		// TODO Auto-generated method stub
		return goodsMapper.deleteByPrimaryKey(goodsid);
	}


	@Override
	public int updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.updateByPrimaryKeySelective(goods);
	}

}
