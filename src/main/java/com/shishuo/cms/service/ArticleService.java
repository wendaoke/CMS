/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shishuo.cms.constant.ArticleConstant;
import com.shishuo.cms.dao.ArticleDao;
import com.shishuo.cms.dao.FolderDao;
import com.shishuo.cms.entity.Article;
import com.shishuo.cms.entity.Folder;
import com.shishuo.cms.entity.vo.ArticleVo;
import com.shishuo.cms.entity.vo.FolderVo;
import com.shishuo.cms.entity.vo.PageVo;
import com.shishuo.cms.exception.ArticleNotFoundException;
import com.shishuo.cms.exception.FolderNotFoundException;
import com.shishuo.cms.exception.UploadException;
import com.shishuo.cms.util.MediaUtils;

/**
 * 
 * 文章服务
 * 
 * @author Zhangjiale
 * 
 */
@Service
public class ArticleService {

	@Autowired
	private ArticleDao articleDao;

	@Autowired
	private AdminService adminService;

	@Autowired
	private FolderService folderService;

	@Autowired
	private FolderDao folderDao;

	@Autowired
	private MediaService attachmentService;

	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * 增加文件
	 * 
	 * @param folderId
	 * @param adminId
	 * @param picture
	 *            {@link:FileConstant.PICTURE}
	 * @param name
	 * @param content
	 * @param type
	 * @param status
	 * @param createTime
	 * @return
	 * @throws FolderNotFoundException
	 * @throws UploadException
	 * @throws ParseException
	 * @throws IOException
	 */
	@CacheEvict(value = "article", allEntries = true)
	public Article addArticle(long folderId, long adminId, String title,
			String summary, ArticleConstant.Status status, String content,
			MultipartFile file, String createTime)
			throws FolderNotFoundException, UploadException, IOException {
		FolderVo folder = folderService.getFolderById(folderId);
		Article article = new Article();
		Date now = new Date();
		String picture = "";
		if (file != null && !file.isEmpty()) {
			picture = MediaUtils.saveImage(file, folder.getWidth(),
					folder.getHeight());
		}
		article.setFirstFolderId(folder.getFirstFolderId());
		article.setSecondFolderId(folder.getSecondFolderId());
		article.setThirdFolderId(folder.getThirdFolderId());
		article.setFourthFolderId(folder.getFourthFolderId());
		article.setAdminId(adminId);
		article.setTitle(title);
		article.setSummary(summary);
		article.setContent(content);
		article.setViewCount(0);
		article.setCommentCount(0);
		article.setPicture(picture);
		article.setStatus(status);
		if (StringUtils.isBlank(createTime)) {
			article.setCreateTime(now);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date;
			try {
				date = sdf.parse(createTime);
			} catch (ParseException e) {
				date = now;
			}
			article.setCreateTime(date);
		}
		article.setUpdateTime(now);
		articleDao.addArticle(article);
		return articleDao.getArticleById(article.getArticleId());
	}

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除文件
	 * 
	 * @param fileId
	 * @return boolean
	 */
	@CacheEvict(value = "article", allEntries = true)
	public boolean deleteArticleById(long articleId) {
		return articleDao.deleteArticleById(articleId);
	}

	// ///////////////////////////////
	// ///// 修改 ////////
	// ///////////////////////////////

	/**
	 * 修改文件
	 * 
	 * @param fileId
	 * @param folderId
	 * @param adminId
	 * @param picture
	 * @param name
	 * @param content
	 * @param type
	 * @param status
	 * @return
	 * @throws UploadException
	 * @throws ParseException
	 * @throws IOException
	 */
	@CacheEvict(value = "article", allEntries = true)
	public Article updateFileByFileId(long fileId, long folderId, long adminId,
			String title, String summary, String content,
			ArticleConstant.Status status, MultipartFile file, String time)
			throws UploadException, IOException {
		Date now = new Date();
		Article article = articleDao.getArticleById(fileId);
		FolderVo folder = folderDao.getFolderById(folderId);
		String picture = article.getPicture();
		if (file != null && !file.isEmpty()) {
			picture = MediaUtils.saveImage(file, folder.getWidth(),
					folder.getHeight());
		}
		article.setFirstFolderId(folder.getFirstFolderId());
		article.setSecondFolderId(folder.getSecondFolderId());
		article.setThirdFolderId(folder.getThirdFolderId());
		article.setFourthFolderId(folder.getFourthFolderId());
		article.setAdminId(adminId);
		article.setTitle(title);
		article.setSummary(summary);
		article.setContent(content);
		article.setViewCount(0);
		article.setCommentCount(0);
		article.setPicture(picture);
		article.setStatus(status);
		if (StringUtils.isBlank(time)) {
			article.setCreateTime(now);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date;
			try {
				date = sdf.parse(time);
			} catch (ParseException e) {
				date = now;
			}
			article.setCreateTime(date);
		}
		articleDao.updateArticle(article);
		return article;
	}

	/**
	 * 更新浏览人数
	 * 
	 * @param fileId
	 * @param viewCount
	 * 
	 */
	public void updateViewCount(long articleId, int nowViewCount) {
		articleDao.updateViewCount(articleId, nowViewCount + 1);
	}

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 得到文件
	 * 
	 * @param fileId
	 * @return File
	 * @throws ArticleNotFoundException
	 */
	@Cacheable(value = "article", key = "'getArticleById_'+#articleId")
	public ArticleVo getArticleById(long articleId)
			throws ArticleNotFoundException {
		ArticleVo articleVo = articleDao.getArticleById(articleId);
		if (articleVo == null) {
			throw new ArticleNotFoundException(articleId + " 文件，不存在");
		} else {
			return articleVo;
		}
	}

	/**
	 * 得到目录的显示的文件分页
	 * 
	 * @param folderId
	 * @return pageVo
	 * @throws FolderNotFoundException
	 */
	@Cacheable(value = "article", key = "'getArticlePageByFolderId_'+#folderId+'_'+#pageNum+'_'+#rows")
	public PageVo<ArticleVo> getArticlePageByFolderId(long folderId, int pageNum,
			int rows) throws FolderNotFoundException {
		PageVo<ArticleVo> pageVo = new PageVo<ArticleVo>(pageNum);
		FolderVo folder = folderService.getFolderById(folderId);
		pageVo.setRows(rows);
		pageVo.setCount(articleDao.getArticleCountByFoderIdAndStatus(
				folder.getFirstFolderId(), folder.getSecondFolderId(),
				folder.getThirdFolderId(), folder.getFourthFolderId(),
				ArticleConstant.Status.display));
		List<ArticleVo> articlelist = articleDao
				.getArticleListByFoderIdAndStatus(folder.getFirstFolderId(),
						folder.getSecondFolderId(), folder.getThirdFolderId(),
						folder.getFourthFolderId(),
						ArticleConstant.Status.display, pageVo.getOffset(),
						pageVo.getRows());
		pageVo.setList(articlelist);
		return pageVo;
	}

	/**
	 * 获取某种文件的分页
	 * 
	 * @param type
	 * @param status
	 * @param pageNum
	 * @return PageVo<File>
	 * @throws FolderNotFoundException
	 * 
	 */
	public PageVo<ArticleVo> getArticlePageByFolderId(long folderId, int pageNum)
			throws FolderNotFoundException {
		PageVo<ArticleVo> pageVo = new PageVo<ArticleVo>(pageNum);
		pageVo.setRows(20);
		List<ArticleVo> list = new ArrayList<ArticleVo>();
		int count = 0;
		if (folderId == 0) {
			count = this.getArticleCountByFolderId(0, 0, 0, 0);
			list = this.getArticleListByFolderId(0, 0, 0, 0,
					pageVo.getOffset(), pageVo.getRows());
		} else {
			FolderVo folder = folderService.getFolderById(folderId);
			list = this.getArticleListByFolderId(folder.getFirstFolderId(),
					folder.getSecondFolderId(), folder.getThirdFolderId(),
					folder.getFourthFolderId(), pageVo.getOffset(),
					pageVo.getRows());
			count = this.getArticleCountByFolderId(folder.getFirstFolderId(),
					folder.getSecondFolderId(), folder.getThirdFolderId(),
					folder.getFourthFolderId());
		}
		for (ArticleVo article : list) {
			try {
				article.setFolder(folderService.getFolderById(article
						.getFolderId()));
				article.setFolderPathList(folderService
						.getFolderPathListByFolderId(article.getFolderId()));
			} catch (FolderNotFoundException e) {
				article.setFolder(new Folder());
			}
		}
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

	/**
	 * 获取不同类型的文件的列表
	 * 
	 * @param type
	 * @param status
	 * @param offset
	 * @param rows
	 * @return List<File>
	 * 
	 */
	public List<ArticleVo> getArticleListByFolderId(long firstFolderId,
			long secondFolderId, long thirdFolderId, long fourthFolderId,
			long offset, long rows) {
		List<ArticleVo> articleList = articleDao.getArticleListByFolderId(
				firstFolderId, secondFolderId, thirdFolderId, fourthFolderId,
				offset, rows);
		return articleList;
	}

	/**
	 * 获取不同类型的文件的数量
	 * 
	 * @param type
	 * @param status
	 * @param Integer
	 * 
	 */
	public int getArticleCountByFolderId(long firstFolderId,
			long secondFolderId, long thirdFolderId, long fourthFolderId) {
		return articleDao.getArticleCountByFolderId(firstFolderId,
				secondFolderId, thirdFolderId, fourthFolderId);
	}

}
