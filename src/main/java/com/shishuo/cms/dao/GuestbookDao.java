package com.shishuo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shishuo.cms.constant.GuestbookConstant;
import com.shishuo.cms.entity.Guestbook;
import com.shishuo.cms.entity.vo.GuestbookVo;

@Repository
public interface GuestbookDao {

	public int addGuestbook(Guestbook guestbook);

	public int updateReplyByMessageId(@Param("reply") String reply,
			@Param("messageId") long messageId,
			@Param("status") GuestbookConstant.status status);

	public GuestbookVo getGuestbookById(@Param("messageId") long messageId);

	public List<GuestbookVo> getGuestbookList(
			@Param("status") GuestbookConstant.status status,
			@Param("offset") long offset, @Param("rows") long rows);

	public int getGuestbookCountList(
			@Param("status") GuestbookConstant.status status);

	public int updateStatusByMessageId(
			@Param("status") GuestbookConstant.status status,
			@Param("messageId") long messageId);
}
