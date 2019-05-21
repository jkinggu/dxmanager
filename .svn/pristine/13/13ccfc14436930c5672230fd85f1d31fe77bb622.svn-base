package com.dx.dxmanage.handler;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dx.dxmanage.po.Ticket;
import com.dx.dxmanage.service.ITicketService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("ticket")
public class TicketHandler {
	@Resource
	private ITicketService ticketService;

	@RequestMapping("selectAllTicket.dx")
	@ResponseBody
	public Map<String, Object> selectAllTicket(int page, int limit) {
		Map<String, Object> resultMap = new HashMap<>();
		PageHelper.startPage(page, limit);
		PageInfo<Ticket> pageInfo = null;
		try {
			pageInfo = new PageInfo<Ticket>(ticketService.selectAllTicket());
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

	// 新增发票
	@RequestMapping("addTicket.dx")
	@ResponseBody
	public Integer addTicket(String tickettime, String beginnum, String ticketamount, String endnum, String usenum) {
		Integer a = 0;
		Ticket ticket = new Ticket();
		try {
			ticket.setTickettime(tickettime);
			ticket.setBeginnum(beginnum);
			ticket.setTicketamount(Integer.parseInt(ticketamount));
			ticket.setEndnum(endnum);
			ticket.setUsenum(usenum);
			a = ticketService.insertSelective(ticket);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return a;
	}

	// 查询将要使用的发票号码
	@RequestMapping("selectWillUseTicket.dx")
	@ResponseBody
	public Ticket selectWillUseTicket() {
		Ticket ticket = new Ticket();
		try {
			ticket = ticketService.selectWillUseTicket();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ticket;
	}

	// 更新发票信息
	@RequestMapping("updateTicket.dx")
	@ResponseBody
	public Integer updateUsenumByTicketid(Ticket ticket) {
		int a = 0;
		try {
			a = ticketService.updateTicket(ticket);

			/*
			 * if (ticket.getUsenum() != usenum) { AutoGenericCode agc = new
			 * AutoGenericCode(); String usenum2 = agc.autoGenericCode(ticket.getUsenum(),
			 * 8); ticket.setUsenum(usenum2); ticketService.updateTicket(ticket); }
			 */
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return a;
	}

	// 根据发票号码段ticketid删除发票信息
	@RequestMapping(value = "deleteTicket.dx", method = RequestMethod.GET)
	@ResponseBody
	public Integer deleteTicket(Integer ticketid) {
		int a = 0;
		try {
			a = ticketService.deleteByPrimaryKey(ticketid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	// 返回编辑发票信息页面，并返回发票实体
	@RequestMapping(value = "editTicketPage.dx", method = RequestMethod.GET)
	public ModelAndView editTicketPage(Integer ticketid,ModelAndView mav) {
		Ticket ticket = null;
		try {
			ticket = ticketService.selectByPrimaryKey(ticketid);
			mav.addObject("ticket", ticket);
			mav.setViewName("ticket/editTicketForm");;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	// 根据发票号码段ticketid删除发票信息
		@RequestMapping(value = "updateTicket.dx", method = RequestMethod.POST)
		@ResponseBody
		public Integer updateTicket(Ticket ticket) {
			int a = 0;
			try {
				a = ticketService.updateTicket(ticket);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return a;
		}

}
