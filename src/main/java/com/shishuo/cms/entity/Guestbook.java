package com.shishuo.cms.entity;

import java.util.Date;

import com.shishuo.cms.constant.GuestbookConstant;

public class Guestbook {

	private long messageId;
	private String content;
	private String reply;
	private GuestbookConstant.status status;

	public GuestbookConstant.status getStatus() {
		return status;
	}

	public void setStatus(GuestbookConstant.status status) {
		this.status = status;
	}

	private Date createTime;

	public long getMessageId() {
		return messageId;
	}

	public void setMessageId(long messageId) {
		this.messageId = messageId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
