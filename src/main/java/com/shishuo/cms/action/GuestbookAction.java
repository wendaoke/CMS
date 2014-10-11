package com.shishuo.cms.action;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shishuo.cms.constant.GuestbookConstant;
import com.shishuo.cms.entity.Folder;
import com.shishuo.cms.entity.vo.GuestbookVo;
import com.shishuo.cms.entity.vo.JsonVo;
import com.shishuo.cms.entity.vo.PageVo;
import com.shishuo.cms.service.GuestbookService;

@Controller
@RequestMapping("/message")
public class GuestbookAction extends BaseAction {

	@Autowired
	private GuestbookService messageBoardService;

	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String folder(@RequestParam(value = "p", defaultValue = "1") int p,
			ModelMap modelMap) {
		try {
			PageVo<GuestbookVo> pageVo = messageBoardService
					.getMessageBoardPage(p, GuestbookConstant.status.display,
							"number");
			Folder folder = folderService.getFolderByEname("message");
			modelMap.put("pageVo", pageVo);
			modelMap.put("folder", folder);
			return themeService.getFolderTemplate(folder.getFolderId());
		} catch (Exception e) {
			return themeService.get404();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/add.json", method = RequestMethod.POST)
	public JsonVo<String> add(@RequestParam(value = "content") String content,
			ModelMap modelMap) {
		JsonVo<String> json = new JsonVo<String>();
		if (StringUtils.isBlank(content)) {
			json.getErrors().put("content", "留言内容不能为空");
		}
		try {
			// 检测校验结果
			json.check();
			messageBoardService.addGuestbook(content);
			json.setResult(true);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
}
