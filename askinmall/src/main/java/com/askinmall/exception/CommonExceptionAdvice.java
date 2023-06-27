package com.askinmall.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

// 컨트롤러에서 예외가 발생되면, 개별 컨트롤러에서 예외처리를 하는 것이 아니라 공통예외처리를 하는 클래스
// 개별 컨트롤러에서 예외관련 작업(try-catch 작업)을 한 것은 공통예외처리에서 동작되지 않는다.
// 공통예외처리가 적용되려면, servlet-context.xml 에서 설정을 해야 한다. bean 등록 작업
@ControllerAdvice
public class CommonExceptionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

	// 모든 예외처리를 담당하는 메서드
	// 1) 공통예외테스트 http://localhost:8081/sample2/doA?name=홍길동&age=홍길동
	// int타입인 age 파라미터에 문자열을 사용하면 예외발생 
	// 컨트롤러에서 예외가 발생하면 해당 클래스의 메서드로 넘어옴
	// 2) 공통예외테스트 http://localhost:8081/sample5/error
	@ExceptionHandler(Exception.class) // 모든 예외처리 담당
	public String except(Exception ex, Model model) {
		
		// Logger.error < 에러 메시지 출력할 때 사용
		logger.error("Exception..." + ex.getMessage());
		// model.addAttribute(attributeName, attributeValue)
		model.addAttribute("exception", ex); // jsp 파일에서 참조 목적. attributeName 사용
		// model.addAttribute(attributeName, attributeValue)
		logger.error(model.toString());
		
		return "/error/error_page";
	}
	
	// web.xml 에서 설정이 필요하다
	// 테스트시 컨트롤러가 타지 않아야 한다
	// 예외종류는 다양하다
	// 특정 예외가 발생이 되면 예외처리를 담당하는 메서드. ex) 잘못된 url을 호출할 경우
	// 특정예외 테스트 http://localhost:8081/ex10000
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
	
		return "/error/custom404";
	}

}
