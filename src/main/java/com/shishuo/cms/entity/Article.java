/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.entity;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.shishuo.cms.constant.ArticleConstant;

/**
 * 文件实体
 * 
 * @author zsy
 * 
 */

public class Article {

	/**
	 * 文件Id
	 */
	private long articleId;

	/**
	 * 所属目录的第一级Id
	 */
	private long firstFolderId;

	/**
	 * 所属目录的第二级Id
	 */
	private long secondFolderId;

	/**
	 * 所属目录的第三级Id
	 */
	private long thirdFolderId;

	/**
	 * 所属目录的第四级Id
	 */
	private long fourthFolderId;

	/**
	 * 管理员Id
	 */
	private long adminId;

	/**
	 * 文件名称
	 */
	private String title;

	/**
	 * 文件名称
	 */
	private String summary;

	/**
	 * 文件内容
	 */
	private String content;

	/**
	 * 封面
	 */
	private String picture;

	/**
	 * 浏览人数
	 */
	private int viewCount;

	/**
	 * 评论人数
	 */
	private int commentCount;

	/**
	 * 文件状态
	 */
	private ArticleConstant.Status status;

	/**
	 * 创建时间
	 */
	private Date createTime;

	/**
	 * 更新时间
	 */
	private Date updateTime;

	public long getFourthFolderId() {
		return fourthFolderId;
	}

	public void setFourthFolderId(long fourthFolderId) {
		this.fourthFolderId = fourthFolderId;
	}

	public long getArticleId() {
		return articleId;
	}

	public void setArticleId(long articleId) {
		this.articleId = articleId;
	}

	public long getFirstFolderId() {
		return firstFolderId;
	}

	public void setFirstFolderId(long firstFolderId) {
		this.firstFolderId = firstFolderId;
	}

	public long getSecondFolderId() {
		return secondFolderId;
	}

	public void setSecondFolderId(long secondFolderId) {
		this.secondFolderId = secondFolderId;
	}

	public long getThirdFolderId() {
		return thirdFolderId;
	}

	public void setThirdFolderId(long thirdFolderId) {
		this.thirdFolderId = thirdFolderId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ArticleConstant.Status getStatus() {
		return status;
	}

	public void setStatus(ArticleConstant.Status status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public long getAdminId() {
		return adminId;
	}

	public void setAdminId(long adminId) {
		this.adminId = adminId;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
