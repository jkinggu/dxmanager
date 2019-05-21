package com.dx.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	// TODO 执行Handler之后执行此方法
    // 作系统
    // 统一异常处理，进行方法执行性能监控，在preHandle中设置一个时间点，在afterCompletion设置一个时间，两个时间点的差就是执行时长
    // 实现 系统 统一日志记录
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	// 如果需要向页面提供一些公用 的数据或配置一些视图信息，使用此方法实现 从modelAndView入手
    // TODO 在执行Handler返回modelAndView之前执行
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	 // TODO 在执行Handler之前执行
    // 用于用户认证校验、用户权限校验
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				//获取请求的url
				String url=request.getRequestURI();
				System.out.println("url---------"+url);
				//判断url是否是公开地址(实际使用时将公开地址配置到配置文件中)
				if(url.indexOf("login.dx")>=0){
					return true;
				}else {
					//判断session
					HttpSession session=request.getSession();
					//从session中取出用户份信息
					Integer eid=(Integer)session.getAttribute("Eid");
					if(eid != null){
						System.out.println("专家操作，方形");
						return true;
					}else {
					    String username=(String)session.getAttribute("username");//后台管理员
						if(username!=null){
							return true;
						}
					}
				}
				//执行这里表示用户身份需要验证，跳转到登录界面
				request.getRequestDispatcher("userlogin.jsp").forward(request, response);
				return false;

	}
	
	

}
