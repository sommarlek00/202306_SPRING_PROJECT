package com.askinmall.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;
import com.askinmall.dto.PageDTO;
import com.askinmall.service.ProductService;
import com.askinmall.util.FileUtils;

import lombok.Setter;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Setter(onMethod_ = {@Autowired})
	private ProductService productService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	// 사용자 페이지
	// 상품 목록 페이지
	@GetMapping("/prodList/{category_cd}/{category_name}")
	public String prodList(@ModelAttribute("cri") Criteria cri,
						   @PathVariable("category_cd") Integer category_cd, @PathVariable("category_name") String category_name, Model model) {
		
		if(category_cd < 5) {
			
			List<ProductVO> prodList = productService.firstCategoryProdList(category_cd, cri);
			
			prodList.forEach(vo -> {
				vo.setProd_upload_folder(vo.getProd_upload_folder().replace("\\", "/"));
				
			model.addAttribute("prodList", prodList);
			int total = productService.firstCategoryTotal(category_cd, cri);
			
			PageDTO pageDTO = new PageDTO(total, cri);
			
			model.addAttribute("pageMaker", pageDTO);
			});
			
		} else {
			
			List<ProductVO> prodList = productService.secondCategoryProdList(category_cd, cri);
			
			prodList.forEach(vo -> {
				vo.setProd_upload_folder(vo.getProd_upload_folder().replace("\\", "/"));
				
			model.addAttribute("prodList", prodList);
			int total = productService.secondCategoryTotal(category_cd, cri);
			
			PageDTO pageDTO = new PageDTO(total, cri);
			
			model.addAttribute("pageMaker", pageDTO);
			});
		}
		
		return "/product/prodList";
	}
	
	
	// 상품 2차 카테고리 출력
	@ResponseBody
	@GetMapping("/subCategory/{category_cd}")
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("category_cd") Integer category_cd){
		ResponseEntity<List<CategoryVO>> entity = null;
		entity = new ResponseEntity<List<CategoryVO>>(productService.subCategoryList(category_cd), HttpStatus.OK);
		return entity;
	}
	

	// 상품 이미지
	@ResponseBody
	@GetMapping("displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException{
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	
	// 상품 상세 페이지
	@GetMapping("/prodDetail")
	public void prodDetail(Integer prod_no, @ModelAttribute("cri") Criteria cri, Model model) {
		ProductVO vo = productService.prodDetail(prod_no);
		vo.setProd_upload_folder(vo.getProd_upload_folder().replace("\\", "/"));
		model.addAttribute("product", vo);
	}
	
	
}
