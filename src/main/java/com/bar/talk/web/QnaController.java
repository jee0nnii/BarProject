package com.bar.talk.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bar.talk.service.QnaService;
import com.bar.talk.vo.QnaVO;
import com.bar.user.constants.User;
import com.bar.user.vo.UserVO;

@Controller
public class QnaController {
	private QnaService qnaService;
	public void setQnaService(QnaService qnaService) {
		this.qnaService = qnaService;
	}
	//전체 글 보여주기
	@RequestMapping("/talk")
	public ModelAndView viewTalkPage() {
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/talk/talk");
				
		List<QnaVO> qnaList = qnaService.getAll();
		view.addObject("qnaList",qnaList);
		
		System.out.println(qnaList);
		return view;
	}
	//글 들어가서 확인하기
	@RequestMapping("/qna/{qnaId}")
	public ModelAndView viewQnaPage(@PathVariable int qnaId) {
		
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/talk/qna");

		QnaVO qnaOne = qnaService.getOne(qnaId);
		view.addObject("qnaOne", qnaOne);
		return view;
	}
	
	//글 등록하기
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public ModelAndView doContactPage(@ModelAttribute("contactForm") @Valid QnaVO qnaVO, HttpSession session) {
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/talk/contact");
		view.addObject("qnaVO",qnaVO);
		
		UserVO user = (UserVO) session.getAttribute(User.USER);
		qnaVO.setId(user.getId());
		qnaVO.setNickname(user.getNickname());
		
		boolean isSuccess = qnaService.createQna(qnaVO);
		if(isSuccess) {
			return new ModelAndView("redirect:/talk");
		}
		return view;
	}
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String viewContactPage() {
		return "bar/talk/contact";
	}
	@RequestMapping("/delete/{qnaId}")
	public String deleteQna(@PathVariable int qnaId, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute(User.USER);
		QnaVO qna = qnaService.getOne(qnaId);
		
		boolean isMine = user.getId() == qna.getId();
		if(isMine && qnaService.deleteQna(qnaId)) {
			return "redirect:/talk";
		}
		return null;
	}
	@RequestMapping(value="/modify/{qnaId}", method= RequestMethod.GET)
	public ModelAndView viewModifyQna(@PathVariable int qnaId, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute(User.USER);
		QnaVO qna = qnaService.getOne(qnaId);
		if(user.getId() != qna.getId()) {
			return null;
		}
		ModelAndView view = new ModelAndView();
		view.setViewName("bar/talk/contact");
		view.addObject("qnaVO",qna);
		view.addObject("mode","modify");
		return view;
	}
	@RequestMapping(value="/modify/{qnaId}", method= RequestMethod.POST)
	public String doModifyQna(@PathVariable int qnaId, HttpSession session,HttpServletRequest request
			,@ModelAttribute("writeForm") @Valid QnaVO qnaVO) {
		UserVO user = (UserVO)session.getAttribute(User.USER);
		QnaVO qna = qnaService.getOne(qnaId);
		if(user.getId() != qna.getId()) {
			return null;
		}
		QnaVO updateQna = new QnaVO();
		updateQna.setId(qna.getId());
		updateQna.setQnaId(qna.getQnaId());
		
		boolean isModify = false;
			
		if(!qna.getQnaTitle().equals(qnaVO.getQnaTitle())) {
			updateQna.setQnaTitle(qnaVO.getQnaTitle());
			isModify = true;
		}
		if(!qna.getQnaType().equals(qnaVO.getQnaType())) {
			updateQna.setQnaType(qnaVO.getQnaType());
			isModify = true;
		}
		if(!qna.getQnaContents().equals(qnaVO.getQnaContents())) {
			updateQna.setQnaContents(qnaVO.getQnaContents());
			isModify = true;
		}
		
		if(isModify) {
			qnaService.updateQna(qnaVO);
		}
		
		return "redirect:/qna/" + qnaId;
	}
}
