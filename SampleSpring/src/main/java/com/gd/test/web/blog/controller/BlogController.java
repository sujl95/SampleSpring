package com.gd.test.web.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.util.Utils;
import com.gd.test.web.blog.service.IBlogService;

@Controller
public class BlogController {

	@Autowired
	public IBlogService iBlogService;
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/blog_Main")
	public ModelAndView bMain(ModelAndView mav) {
		mav.setViewName("blog/blog_Main");
		return mav;
	}
	
	@RequestMapping(value="/blog_Login")
	public ModelAndView bLogin(ModelAndView mav) {
		mav.setViewName("blog/blog_Login");
		return mav;
	}
	
	@RequestMapping(value = "blog_Join")
	public ModelAndView bJoin(ModelAndView mav) {
		mav.setViewName("blog/blog_Join");
		return mav;
	}
	
	@RequestMapping(value = "blog_List")
	public ModelAndView bList(ModelAndView mav) {
		mav.setViewName("blog/blog_List");
		return mav;
	}
	
	@RequestMapping(value = "blog_Search")
	public ModelAndView bSearch(ModelAndView mav) {
		mav.setViewName("blog/blog_Search");
		return mav;
	}
	
	@RequestMapping(value = "/bIdCheckAjax",
					method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bIdCheckAjax(@RequestParam HashMap<String,String>params, ModelAndView modelAndView)
	throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String, Object>();
		int cnt = iBlogService.idCheck(params);
		modelMap.put("cnt",cnt);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bJoinAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String bJoinAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		try {
			//비밀번호 암호화
			params.put("bmPw", Utils.encryptAES128(params.get("bmPw")));
			
			iBlogService.insertBM(params);
			modelMap.put("res","SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "Failed");
		}
		return mapper.writeValueAsString(modelMap); 
		
	}
	@RequestMapping(value = "/bLoginAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String bLoginAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView,HttpSession session) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		//비밀번호 암호화
		params.put("bmPw", Utils.encryptAES128(params.get("bmPw")));
		
		HashMap<String,String> data = iBlogService.getBM(params);
		
		
		if(data != null) {
			session.setAttribute("sBmNo", data.get("BM_NO"));
			session.setAttribute("sBmNm", data.get("BM_NM"));
			
			modelMap.put("res", "SUCCESS");
		} else {
			modelMap.put("res", "FAILED");
		}
			
			
		return mapper.writeValueAsString(modelMap); 
		
	}
	@RequestMapping(value = "/blog_Logout")
	public ModelAndView bLogout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("redirect:blog_Login");
		return mav;
	}
	@RequestMapping(value = "/bListAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String bListAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		System.out.println("param =" +params);
		
		int cnt = iBlogService.getBCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,10,5);
		
		params.put("startCnt" , Integer.toString(pb.getStartCount()));
		params.put("endCnt" , Integer.toString(pb.getEndCount()));
		
//		List<HashMap<String,String>> list = iBlogService.getB(params);
		List<HashMap<String,String>> list = iBlogService.getBlog(params);
		
		modelMap.put("list",list);
		modelMap.put("pb",pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/blogListAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String blogListAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		System.out.println("param =" +params);
		
		int cnt = iBlogService.getBlogCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,10,5);
		
		params.put("startCnt" , Integer.toString(pb.getStartCount()));
		params.put("endCnt" , Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = iBlogService.getBlogList(params);
		
		iBlogService.updateHit(params);
		HashMap<String,String> data = iBlogService.getData(params);
		modelMap.put("data", data);
		
		
		modelMap.put("list",list);
		modelMap.put("pb",pb);
		
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	@RequestMapping(value = "/blogSearchAjax",
			method = RequestMethod.POST,
			produces = "test/json;charset=UTF-8")
	@ResponseBody 
	public String blogSearchAjax(@RequestParam HashMap<String, String>params, ModelAndView modelAndView) throws Throwable{
		ObjectMapper mapper= new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		System.out.println("param =" +params);
		
		int cnt = iBlogService.getAllBCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt,10,5);
		
		params.put("startCnt" , Integer.toString(pb.getStartCount()));
		params.put("endCnt" , Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = iBlogService.getBlogList(params);
		
		modelMap.put("list",list);
		modelMap.put("pb",pb);
		
		return mapper.writeValueAsString(modelMap);
	}
}
