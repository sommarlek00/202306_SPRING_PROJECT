package com.askinmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.askinmall.domain.CategoryVO;
import com.askinmall.service.ProductService;

import lombok.Setter;

@ControllerAdvice(basePackages = {"com.askinmall.controller"})
public class GlobalControllerAdvice {

	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	
	@ModelAttribute
	public void categoryList(Model model) {
		List<CategoryVO> categoryList = productService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
	}
	
}
