package com.gd.test.web.board.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.web.board.service.IBoardService;

@Controller
public class BoardController {
	@Autowired
	public IBoardService iBoardService;
	@Autowired
	public IPagingService iPagingService;
	@RequestMapping(value = {"/board1", "/board"})
	public ModelAndView board(@RequestParam HashMap<String, String> params,HttpSession session, ModelAndView mav) throws Throwable {
		if (params.get("page") == null) {
			params.put("page", "1");
		}
		int cnt = iBoardService.getListcnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")),cnt);
		params.put("startCount",Integer.toString(pb.getStartCount()));
		params.put("endCount" , Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iBoardService.getList(params);
		mav.addObject("list",list);
		mav.addObject("pb", pb);
		mav.addObject("page", params.get("page"));
		mav.setViewName("board/board1");
		return mav;	
	}
	@RequestMapping(value = "/board2")
	public ModelAndView board2(@RequestParam HashMap<String, String> params,HttpSession session, ModelAndView mav) throws Throwable {
		iBoardService.updateHit(params);
		HashMap<String,String> data = iBoardService.getData(params);
		mav.addObject("data", data);
		mav.setViewName("board/board2");
		return mav;
	}
	
	@RequestMapping(value = "/board3") 
	public ModelAndView board3(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("sMemNo")!= null) {
			mav.addObject("res", "0");
			mav.setViewName("board/board3");
		} else {
			mav.addObject("res", "1");
			mav.setViewName("board/board3");
		}
//		mav.setViewName("board/board3");
		return mav;
	}
	@RequestMapping(value = "/board3s")
	public ModelAndView board3s(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Throwable {
		
		if(session.getAttribute("sMemNo")!= null) {
			mav.setViewName("redirect:board1");
		} else {
			mav.setViewName("board/bLogin");
		}
		try {
			iBoardService.insertData(params);
			mav.setViewName("redirect:board1");
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("board/board3s");
		}
		
		return mav;
	}
	@RequestMapping(value = "/board4")
	public ModelAndView board4(@RequestParam HashMap<String,String>  params,HttpSession session, ModelAndView mav) throws Throwable  {
		HashMap<String, String> data = iBoardService.getData(params);
		mav.addObject("data", data);
		mav.setViewName("board/board4");
		return mav;
	}
	@RequestMapping(value = "board4s")
	public ModelAndView board4s(@RequestParam HashMap<String,String> params, HttpSession session,ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iBoardService.updateData(params);
		} catch(Exception e) {
			e.printStackTrace();
			res = "failed";
		}
		mav.addObject("res", res);
		mav.setViewName("board/board4s");
		return mav;
	}
	
	@RequestMapping(value = "/board5s")
	public ModelAndView board5s(@RequestParam HashMap<String,String> params,HttpSession session, ModelAndView mav) throws Throwable{
		try {
			iBoardService.deleteData(params);
			mav.setViewName("redirect:board1");
		}
		catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("board/board5s");
		}
		return mav;
	}

	@RequestMapping(value = "/bJoin")
	public ModelAndView bJoin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		mav.setViewName("board/bJoin");
		return mav;
	}

	@RequestMapping(value = "/bJoins")
	public ModelAndView bJoins(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		int cnt = iBoardService.Idcnt(params);
		if (cnt> 0 ) {
			mav.addObject("res", "중복된 아이디입니다.");
			mav.setViewName("board/bJoins");
		} else {
			try {
				iBoardService.insertbData(params);
				mav.setViewName("redirect:bLogin");
			} catch (Exception e) {
				e.printStackTrace();
				
				mav.addObject("res","회원가입에 성공하였습니다");
				mav.setViewName("board/bJoins");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/bLogin")
	public ModelAndView bLogin(HttpSession session, ModelAndView mav) throws Throwable {
		if(session.getAttribute("sMemNo")!= null) {
			mav.setViewName("redirect:bMain");
		} else {
			mav.setViewName("board/bLogin");
		}
		
		return mav;

	}

	@RequestMapping(value = "/bLogins")
	public ModelAndView bLogins(@RequestParam HashMap<String, String> params,
			HttpSession session ,
			ModelAndView mav) throws Throwable {
			HashMap<String, String> data = iBoardService.getMem(params);
		if(data != null) {
			session.setAttribute("sMemNo", data.get("BM_NO"));
			session.setAttribute("sMemId", data.get("BM_ID"));
			session.setAttribute("sMemNm", data.get("BM_NM"));
			mav.setViewName("redirect:bMain");
		} else {
			mav.setViewName("board/bLogins");
		}
		
		return mav;
	}
	@RequestMapping(value = "/bMain")
	public ModelAndView bMain(HttpSession session ,
							  ModelAndView mav) throws Throwable {
		if(session.getAttribute("sMemNo") != null) {
			mav.setViewName("board/bMain");
		} else {
			mav.setViewName("redirect:bLogin");
		}
		return mav;
	
	}
	@RequestMapping(value = "/bLogout")
	public ModelAndView bLogout(HttpSession session ,
			ModelAndView mav) throws Throwable {
		session.invalidate();
		mav.setViewName("redirect:bLogin");
		return mav;
		
	}
	@RequestMapping(value = "/bmodify")
	public ModelAndView bmodify(@RequestParam HashMap<String, String> params,
			HttpSession session, ModelAndView mav) throws Throwable {
		params.put("bmNo", String.valueOf(session.getAttribute("sMemNo")));
		HashMap<String, String> data = iBoardService.getmoMem(params);
		mav.addObject("data", data);
		mav.setViewName("board/bmodify");
		return mav;
	}
	@RequestMapping(value = "/bmodifys")
	public ModelAndView bJoins(@RequestParam HashMap<String, String> params,HttpSession session, ModelAndView mav) throws Throwable {
		
		try {
			iBoardService.updatemData(params);
			mav.addObject("res","1");
			mav.setViewName("board/bmodifys");
		} catch (Exception e) {
			e.printStackTrace();
			
			mav.addObject("res","2");
			mav.setViewName("board/bmodifys");
		}
		return mav;
	}
}
