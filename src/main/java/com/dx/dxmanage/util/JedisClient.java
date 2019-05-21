package com.dx.dxmanage.util;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author fang
 *
 * @Date 2019年4月8日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
public class JedisClient {
	 //Redis服务器IP
	private static final String host = "127.0.0.1";
	 //Redis的端口号
	  private static int port = 6379;
	  
	//可用连接实例的最大数目，默认值为8；
	  //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
	  private static int MAX_ACTIVE = 1024;
	   
	  //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8。
	  private static int MAX_IDLE = 200;
	   
	  //等待可用连接的最大时间，单位毫秒，默认值为-1，表示永不超时。如果超过等待时间，则直接抛出JedisConnectionException；
	  private static int MAX_WAIT = 10000;
	   
	  private static int TIMEOUT = 10000;
	   
	  //在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
	  private static boolean TEST_ON_BORROW = true;
	   

	private static final JedisClient jedisClient = new JedisClient();
	private Jedis jedis = null;

	/**
	 * 私有构造函数
	 */
	private JedisClient() {
	}

	public static JedisClient getInstance() {
		return jedisClient;
	}

	/**
	 * 初始化redis连接池
	 */
	private JedisPoolConfig getPoolConfig() {
		JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
		jedisPoolConfig.setMaxIdle(10);// 控制一个Pool最多有多少个状态为idle(空闲的)jedis实例,默认值也是8
		jedisPoolConfig.setMaxTotal(100);// 可用连接实例的最大数目,如果赋值为-1,表示不限制.
		jedisPoolConfig.setMaxWaitMillis(3000);// 等待可用连接的最大时间,单位毫秒,默认值为-1,表示永不超时/如果超过等待时间,则直接抛出异常
		jedisPoolConfig.setTestOnBorrow(true); // 在borrow一个jedis实例时,是否提前进行validate操作,如果为true,则得到的jedis实例均是可用的
		return jedisPoolConfig;
	}

	/**
	 * 添加
	 * 
	 * @param key
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public Boolean add(String key, String value) throws Exception {
		JedisPool pool = new JedisPool(getPoolConfig(), host);
		Jedis jedis = null;
		try {
			jedis = pool.getResource();
			if (jedis.exists(key)) {
				throw new Exception(String.format("key (%s) 已存在 ", key));
			}
			jedis.set(key, value);
		} catch (Exception e) {
			throw e;
		} finally {
			if (jedis != null) {
				jedis.close();
			}
		}
		pool.destroy();
		return true;
	}

	/**
	 * 获取值
	 * 
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public String get(String key) throws Exception {
		JedisPool pool = new JedisPool(getPoolConfig(), host);
		Jedis jedis = null;
		String result = "";
		try {
			jedis = pool.getResource();
			result = jedis.get(key);
		} catch (Exception e) {
			throw e;
		} finally {
			if (jedis != null) {
				jedis.close();
			}
		}
		pool.destroy();
		return result;
	}

	public static void main(String[] args) {
		JedisClient jedisClient = JedisClient.getInstance();
		// 连接本地的Redis服务
		Jedis jedis = new Jedis("127.0.0.1", 6379);
		try {
			System.out.println("连接成功");
			// 查看服务是否运行
			System.out.println(jedis.ping());
			// 设置 redis 字符串数据
			jedis.set("runoobkey", "www.runoob.com");
			// 获取存储的数据并输出
			System.out.println("redis 存储的字符串为: " + jedis.get("runoobkey"));
			// 存储数据到列表中
			jedis.lpush("site-list", "Runoob");
			jedis.lpush("site-list", "Google");
			jedis.lpush("site-list", "Taobao");
			System.out.println(jedis.llen("site-list"));
			// 获取存储的数据并输出
			List<String> list = jedis.lrange("site-list", 0, jedis.llen("site-list"));
			for (int i = 0; i < list.size(); i++) {
				System.out.println("列表项为: " + list.get(i));
			}
			// 获取数据并输出
			Set<String> keys = jedis.keys("*");
			Iterator<String> it = keys.iterator();
			while (it.hasNext()) {
				String key = it.next();
				System.out.println(key);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
