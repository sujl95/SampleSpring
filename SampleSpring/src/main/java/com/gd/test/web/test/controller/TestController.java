package com.gd.test.web.test.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.web.test.service.ITestService;

@Controller
public class TestController {
	@Autowired
	public ITestService iTestService;
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = { "/test1", "/test" })
	public ModelAndView test1(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		if (params.get("page") == null) {
			params.put("page", "1");
		}

		int cnt = iTestService.getListcnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt);
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iTestService.getList(params);
		mav.addObject("list", list);
		mav.addObject("pb", pb);
		mav.addObject("page", params.get("page"));
		mav.setViewName("test/test1");
		return mav;
	}

	@RequestMapping(value = "/test2")
	public ModelAndView test2(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		iTestService.updateHit(params);

		HashMap<String, String> data = iTestService.getData(params);

		mav.addObject("data", data);

		mav.setViewName("test/test2");

		return mav;
	}

	@RequestMapping(value = "/test3")
	public ModelAndView test3(ModelAndView mav) {
		mav.setViewName("test/test3");
		return mav;
	}

	@RequestMapping(value = "/test3s")
	public ModelAndView test3s(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iTestService.insertData(params);
			// setViewName에서의 redirect
			// -> 해당 주소로 이동. 컨트롤러에서 컨트롤러로 이동 .
			// 단, Get방식으로 이동하기 때문에 단순이동을 제외하고는 redirect를 자제
			mav.setViewName("redirect:test1");
		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("test/test3s");
		}

		return mav;
	}

	@RequestMapping(value = "/test4")
	public ModelAndView test4(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		HashMap<String, String> data = iTestService.getData(params);

		mav.addObject("data", data);

		mav.setViewName("test/test4");

		return mav;
	}

	@RequestMapping(value = "/test4s")
	public ModelAndView test4s(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		String res = "success";
		try {
			iTestService.updateData(params);
		} catch (Exception e) {
			e.printStackTrace();
			res = "failed";
		}
		mav.addObject("res", res);

		mav.setViewName("test/test4s");

		return mav;
	}

	@RequestMapping(value = "/test5s")
	public ModelAndView test5s(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		try {
			iTestService.deleteData(params);
			// setViewName에서의 redirect
			// -> 해당 주소로 이동. 컨트롤러에서 컨트롤러로 이동 .
			// 단, Get방식으로 이동하기 때문에 단순이동을 제외하고는 redirect를 자제
			mav.setViewName("redirect:test1");
		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("test/test5s");
		}

		return mav;
	}

	@RequestMapping(value = "/tJoin")
	public ModelAndView tJoin(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		mav.setViewName("test/tJoin");
		return mav;
	}

	@RequestMapping(value = "/tJoins")
	public ModelAndView tJoins(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
//		String res = "오류입니다.";
//		try {
//			int cnt = iTestService.Idcnt(params);
//			if (cnt != 0) {
//				res = "중복된 아이디입니다.";
//				mav.addObject("res", res);
//				mav.setViewName("test/tJoins");
//			} else {
//				iTestService.inserttData(params);
//				mav.setViewName("redirect:tLogin");
//			}
//		} catch (Exception e) {
//				res="등록에 실패했습니다."; 
//				mav.addObject("res",res);
//				mav.setViewName("test/tJoins");
//		}
		int cnt = iTestService.Idcnt(params);
		if (cnt> 0 ) {
			mav.addObject("res", "중복된 아이디입니다.");
			mav.setViewName("test/tJoins");
		} else {
			try {
				iTestService.inserttData(params);
				
				mav.setViewName("redirect:tLogin");
			} catch (Exception e) {
				e.printStackTrace();
				
				mav.addObject("res","회원가입에 성공하였습니다");
				mav.setViewName("test/tJoins");
			}
		}
		return mav;
	}

	@RequestMapping(value = "/tLogin")
	public ModelAndView tLogin(HttpSession session, ModelAndView mav) throws Throwable {
		if(session.getAttribute("sMemNo")!= null) {
			mav.setViewName("redirect:tMain");
		} else {
			mav.setViewName("test/tLogin");
		}
		
		return mav;

	}

	@RequestMapping(value = "/tLogins")
	public ModelAndView tLogins(@RequestParam HashMap<String, String> params,
			HttpSession session ,
			ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iTestService.getMem(params);
		
		if(data != null) {
			session.setAttribute("sMemNo", data.get("MEM_NO"));
			session.setAttribute("sMemId", data.get("MEM_ID"));
			session.setAttribute("sMemNm", data.get("MEM_NM"));
			
			System.out.println(session.getAttribute("sMemNm"));
			
			mav.setViewName("redirect:tMain");
		} else {
			mav.setViewName("test/tLogins");
		}
		
		return mav;
	}
	@RequestMapping(value = "/tMain")
	public ModelAndView tMain(HttpSession session ,
							  ModelAndView mav) throws Throwable {
		if(session.getAttribute("sMemNo") != null) {
			mav.setViewName("test/tMain");
		} else {
			mav.setViewName("redirect:tLogin");
		}
		return mav;
	
	}
	@RequestMapping(value = "/tLogout")
	public ModelAndView tLogout(HttpSession session ,
			ModelAndView mav) throws Throwable {
		session.invalidate();
		mav.setViewName("redirect:tLogin");
		return mav;
		
	}
	
	@RequestMapping(value = "/tFile")
	public ModelAndView tFile(ModelAndView mav) {
		mav.setViewName("test/tFile");
		return mav;
	}
	
	@RequestMapping(value = "/test/{no}")
	public ModelAndView testex(@PathVariable("no") int bNo,
								ModelAndView mav)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 {
		System.out.println(bNo);
		mav.setViewName("test/test1");
		return mav;
	}
	
}
