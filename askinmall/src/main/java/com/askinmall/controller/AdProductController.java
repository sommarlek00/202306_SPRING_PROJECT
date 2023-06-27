package com.askinmall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;
import com.askinmall.dto.PageDTO;
import com.askinmall.service.AdProductService;
import com.askinmall.util.FileUtils;

import lombok.Setter;

@Controller
@RequestMapping("/admin/product/*")
public class AdProductController {

	@Setter(onMethod_ = {@Autowired})
	private AdProductService adProductService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Resource(name = "uploadCKEditorPath")
	private String uploadCKEditorPath;
	
	
	// 관리자 페이지
	// 상품 등록 페이지
	@GetMapping("/prodInsertForm")
	public void prodInsertForm(Model model) {
		model.addAttribute("categoryList", adProductService.getCategoryList());
	}
	
	
	// 상품 등록 페이지. 2차 카테고리 출력
	@ResponseBody
	@GetMapping("/subCategory/{category_cd}")
	public ResponseEntity<List<CategoryVO>> subCategory(@PathVariable("category_cd") Integer category_cd){
		ResponseEntity<List<CategoryVO>> entity = null;
		entity = new ResponseEntity<List<CategoryVO>>(adProductService.subCategoryList(category_cd), HttpStatus.OK);
		return entity;
	}
	
	
	// 상품 등록 기능
	@PostMapping("/insertProd")
	public String insertProd(ProductVO vo, RedirectAttributes rttr) {
		String uploadDateFolder = FileUtils.getFolder();
		String saveIamgeName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
		
		vo.setProd_img(saveIamgeName);
		vo.setProd_upload_folder(uploadDateFolder);
		
		adProductService.insertProd(vo);
		
		return "redirect:/admin/product/prodList";
	}
	
	
	// 이미지 업로드 기능
	@PostMapping("/imageUpload")
	public void imageUpload(HttpServletRequest req, HttpServletResponse res, MultipartFile upload) {
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		
		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = uploadCKEditorPath + fileName;
			
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);
			out.flush();
			
			printWriter = res.getWriter();
			String fileUrl = "/upload/" + fileName;
			printWriter.println("{\"filename\":\"" + fileName + "\", \"uploaded\":1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(out != null) {
				try {
					out.close();
				}catch(Exception ex) {
					ex.printStackTrace();
				}
			}
			if(printWriter != null) printWriter.close();
		}
						
	}
	
	
	// 상품 목록
	@GetMapping("/prodList")
	public void prodList(@ModelAttribute("cri") Criteria cri, Integer category_cd, Model model) {
				
		List<ProductVO> list = adProductService.prodList(cri, category_cd);
		
		list.forEach(vo -> {
			vo.setProd_upload_folder(vo.getProd_upload_folder().replace("\\", "/"));
		});
		
		model.addAttribute("productList", list);
		int total = adProductService.getTotal(cri, category_cd);
	
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		model.addAttribute("categoryList", adProductService.getCategoryList());
		model.addAttribute("category_cd", category_cd);
	}
	
	
	// 상품 이미지
	@ResponseBody
	@GetMapping("displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException{
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	
	// 상품 수정, 상세 페이지
	@GetMapping(value = {"/prodDetail","/prodModifyForm"})
	public void prodModifyForm(Integer prod_no, int category_cd, @ModelAttribute("cri") Criteria cri, Model model) {
		ProductVO productVO = adProductService.prodModifyForm(prod_no);
		productVO.setProd_upload_folder(productVO.getProd_upload_folder().replace("\\", "/"));
		
		model.addAttribute("product", productVO);
		
		CategoryVO categoryVO = adProductService.getPrtCategory(category_cd);
		model.addAttribute("categoryVO", categoryVO);
		
		model.addAttribute("categoryList", adProductService.getCategoryList());
		model.addAttribute("subCategoryList", adProductService.subCategoryList(categoryVO.getCategory_cd()));
	}
	

	// 상품 수정 기능
	@PostMapping("/modifyProd")
	public String modifyProd(ProductVO vo, RedirectAttributes rttr) {
		if(!vo.getUploadFile().isEmpty()) {
			FileUtils.deleteFile(uploadPath, vo.getProd_upload_folder(), vo.getProd_img());
			String uploadDateFolder = FileUtils.getFolder();
			String saveImageName = FileUtils.uploadFile(uploadPath, uploadDateFolder, vo.getUploadFile());
			
			vo.setProd_img(saveImageName);
			vo.setProd_upload_folder(uploadDateFolder);
				
		}
		
		adProductService.modifyProd(vo);
		rttr.addFlashAttribute("msg", "modify");
		return "redirect:/admin/product/prodList";
	}
	
	
	// 상품 삭제 기능
	@PostMapping("/deleteProd")
	public String deleteProd(Integer prod_no, Criteria cri, RedirectAttributes rttr) {
		adProductService.deleteProd(prod_no);
		rttr.addFlashAttribute("msg", "delete");
		
		return "redirect:/admin/product/prodList";
	}
	
	
	// 체크된 상품 수정 기능
	@ResponseBody
	@PostMapping("/modifyCheckedProd")
	public ResponseEntity<String> modifyCheckedProd(@RequestParam("prod_no_arr[]") List<Integer> prod_no_arr,
													  @RequestParam("prod_price_arr[]") List<Integer> prod_price_arr,
													  @RequestParam("prod_buy_state_arr[]") List<String> prod_buy_state_arr){
		ResponseEntity<String> entity = null;
		
		List<ProductVO> prod_list = new ArrayList<ProductVO>();
		
		for(int i=0; i<prod_no_arr.size(); i++) {
			ProductVO productVO = new ProductVO();
			productVO.setProd_no(prod_no_arr.get(i));
			productVO.setProd_price(prod_price_arr.get(i));
			productVO.setProd_buy_state(prod_buy_state_arr.get(i));
			prod_list.add(productVO);
		}
		
		adProductService.modifyCheckedProd(prod_list);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	
	// 체크된 상품 삭제 기능
	@ResponseBody
	@PostMapping("/deleteCheckedProd")
	public ResponseEntity<String> deleteCheckedProd(@RequestParam("prod_no_arr[]") List<Integer> prod_no_arr){
		ResponseEntity<String> entity = null;
		adProductService.deleteCheckedProd(prod_no_arr);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	
}
