package com.kgitbank.spring.domain.exception;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class MyExceptions {

		
	@ExceptionHandler(Exception.class)
	public String commonException(Exception e, Model model) {
		
		log.error("Exception:" + e.getMessage());
		
		model.addAttribute(e);
		log.error(model);
		
		return "error/errorPage";	
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public String nohandler(Exception e, Model model) {
		
		log.error("NoHandler:" + e.getMessage());
		
		model.addAttribute(e);
		log.error(model);
		
		return "error/errorPage";
		
	}
}
