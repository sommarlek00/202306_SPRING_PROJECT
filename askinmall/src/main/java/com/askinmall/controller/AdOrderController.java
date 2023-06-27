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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.askinmall.domain.Criteria;
import com.askinmall.domain.OrderInfoVO;
import com.askinmall.domain.OrderVO;
import com.askinmall.dto.PageDTO;
import com.askinmall.service.AdOrderService;
import com.askinmall.util.FileUtils;

import lombok.Setter;

@Controller
@RequestMapping("/admin/order/*")
public class AdOrderController {
	
	@Setter(onMethod_= {@Autowired})
	private AdOrderService adOrderService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 관리자 페이지
	// 주문 목록 페이지
	@GetMapping("/orderList")
	public void orderList(@ModelAttribute("cri") Criteria cri, @ModelAttribute("sDate") String sDate, @ModelAttribute("eDate") String eDate, Model model) {
		
		List<OrderVO> orderList = adOrderService.orderList(cri, sDate, eDate);
		model.addAttribute("orderList", orderList);
		
		int total = adOrderService.getTotal(cri, sDate, eDate);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	
	
	// 주문 상세 페이지
	@ResponseBody
	@GetMapping("/orderInfo")
	public ResponseEntity<List<OrderInfoVO>> orderInfo(Long ord_no){
		ResponseEntity<List<OrderInfoVO>> entity = null;
		
		entity = new ResponseEntity<List<OrderInfoVO>>(adOrderService.orderInfo(ord_no), HttpStatus.OK);
		return entity;
	}
	
	
	// 상품 이미지
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException{
		return FileUtils.getFile(uploadPath + folderName, fileName);
	}
	
	
	// 주문 상세 페이지 상품 삭제
	@ResponseBody
	@PostMapping("/deleteOrderInfoProd")
	public ResponseEntity<String> deleteOrderInfoProd(Long ord_no, Integer prod_no, int ord_detail_amount){
		ResponseEntity<String> entity = null;
		adOrderService.deleteOrderInfoProd(ord_no, prod_no, ord_detail_amount);
		entity = new ResponseEntity<String>("success", HttpStatus.OK);
		return entity;
	}
	
	
	// 주문 페이지 주문 삭제
	@PostMapping("/deleteOrder")
	public String deleteOrder(Criteria cri, Long ord_no, RedirectAttributes rttr) {
		adOrderService.deleteOrderDetail(ord_no);
		rttr.addFlashAttribute("msg", "delete");
		return "redirect:/admin/order/orderList";
	}
	
	
	// 주문 삭제 목록
	@GetMapping("/deletedOrderList")
	public void deletedOrderList(@ModelAttribute("cri") Criteria cri, Model model) {
		
		List<OrderVO> deletedOrderList = adOrderService.deletedOrderList(cri);
		model.addAttribute("deletedOrderList", deletedOrderList);
		
		int total = adOrderService.getTotalDeletedOrder(cri);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	

}
