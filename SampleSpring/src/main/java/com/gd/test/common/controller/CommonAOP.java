package com.gd.test.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect	//필터같은역할
public class CommonAOP {
	//AOP : 권한 처리할때 사용 , 로그인 세션이 끊기면 사용
	//Pointcut -> 적용범위
	//@Pointcut(범위설정)
	/*
	 * 범위
	 * excution -> include 필터
	 * !execution -> exclude 필터
	 * * -> 모든것
	 * *(..) -> 모든 메소드
	 * .. -> 모든경로
	 * && -> 필터 추가
	 */
	@Pointcut("execution(* com.gd.test..TestController2.*(..))" 
			+ "&&!execution(* com.gd.test..TestController2.*Ajax(..))"
			+ "&&!execution(* com.gd.test..TestController2.*Log*(..))"
			+ "&&!execution(* com.gd.test..TestController2.*Join*(..))"
			+ "&&!execution(* com.gd.test..TestController2.*List(..))"
			+ "&&!execution(* com.gd.test..TestController2.*Detail(..))"
			)
	public void aLoginCheckAOP() {}
	
	//ProceedingJoinPoint -> 대상 적용 이벤트 필터
	/*
	 * @Befor -> 메소드 실행 전
	 * @After -> 메소드 실행 후
	 * @After-returning -> 메소드 정상 실행 후
	 * @After-throwing -> 메소드 예외 발생 후
	 * @Around -> 모든 동작 시점 (어느 곳에서 세션이 날라갈지 모르니 대부분 이걸사용)
	 */
	//관점 : 프로그램의 실행단계, 흐름상 중간에 이벤트 끼우기 
	@Around("aLoginCheckAOP()") //이필터에 해당하는 모든 동작 시점(위에있는 메서드를 가져와서 사용)
	public ModelAndView aLoginCheckAOP(ProceedingJoinPoint joinPoint) throws Throwable {
		// ProceedingJoinPoint : 진행중인 관점 시점의 이벤트,이벤트를 그대로 돌려줌
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request 
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		//Session 취득
		HttpSession session = request.getSession();
		if(session.getAttribute("sBmNo")!= null) {
			mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
		} else {
			mav.setViewName("redirect:aLogin");
		}
		System.out.println("-------------aLoginCheckAOP 실행됨 ---------");
		
		return mav;
	}
	
	
	@Pointcut("execution(* com.gd.test..BlogController.*(..))" 
			+ "&&!execution(* com.gd.test..BlogController.*Ajax(..))"
			+ "&&!execution(* com.gd.test..BlogController.*Log*(..))"
			+ "&&!execution(* com.gd.test..BlogController.*Join*(..))"
			+ "&&!execution(* com.gd.test..BlogController.*List(..))"
			+ "&&!execution(* com.gd.test..BlogController.*Main(..))"
			+ "&&!execution(* com.gd.test..BlogController.*Detail(..))"
			)
	public void bLoginCheckAOP() {}
	
	//ProceedingJoinPoint -> 대상 적용 이벤트 필터
	/*
	 * @Befor -> 메소드 실행 전
	 * @After -> 메소드 실행 후
	 * @After-returning -> 메소드 정상 실행 후
	 * @After-throwing -> 메소드 예외 발생 후
	 * @Around -> 모든 동작 시점 (어느 곳에서 세션이 날라갈지 모르니 대부분 이걸사용)
	 */
	//관점 : 프로그램의 실행단계, 흐름상 중간에 이벤트 끼우기 
	@Around("bLoginCheckAOP()") //이필터에 해당하는 모든 동작 시점(위에있는 메서드를 가져와서 사용)
	public ModelAndView bLoginCheckAOP(ProceedingJoinPoint joinPoint) throws Throwable {
		// ProceedingJoinPoint : 진행중인 관점 시점의 이벤트,이벤트를 그대로 돌려줌
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request 
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		//Session 취득
		HttpSession session = request.getSession();
		if(session.getAttribute("sBmNo")!= null) {
			mav = (ModelAndView) joinPoint.proceed(); //기존 이벤트 처리 행위를 이어서 진행
		} else {
			mav.setViewName("redirect:blog_Login");
		}
		System.out.println("-------------bLoginCheckAOP 실행됨 ---------");
		
		return mav;
	}
	
	
}
