package com.dx.dxmanage.po;

public class TicketException {
	private Integer id;

	private Integer ticketid;

	private String time;

	private String ticketnum;

	private String type;

	private String note;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTicketid() {
		return ticketid;
	}

	public void setTicketid(Integer ticketid) {
		this.ticketid = ticketid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time == null ? null : time.trim();
	}

	public String getTicketnum() {
		return ticketnum;
	}

	public void setTicketnum(String ticketnum) {
		this.ticketnum = ticketnum == null ? null : ticketnum.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note == null ? null : note.trim();
	}

	@Override
	public String toString() {
		return "TicketException [id=" + id + ", ticketid=" + ticketid + ", time=" + time + ", type=" + type + ", note="
				+ note + "]";
	}

}