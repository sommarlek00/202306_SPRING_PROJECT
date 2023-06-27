package com.askinmall.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.askinmall.domain.CartVO;
import com.askinmall.domain.MemberVO;
import com.askinmall.dto.CartListDTO;
import com.askinmall.service.CartService;
import com.askinmall.util.FileUtils;

import lombok.Setter;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Setter(onMethod_= {@Autowired})
	private CartService cartService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	// 사용자 페이지
	// 장바구니 페이지
	@GetMapping("/cartList")
	public void cartList(HttpSession session, Model model) {
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		List<CartListDTO> cartList = cartService.cartList(user_id);
		
		cartList.forEach(vo -> {
			vo.setProd_upload_folder(vo.getProd_upload_folder().replace("\\", "/"));
		});
		
		model.addAttribute("cartList", cartList);
		
		if(cartList.size() != 0) {
			model.addAttribute("cartTotalAmount", cartService.cartTotalAmount(user_id));
		}
	}
	
	
	// 장바구니 상품 이미지
	@ResponseBody
	@GetMapping("/displayImage")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) throws IOException {

		return FileUtils.getFile(uploadPath + folderName, fileName);

	}
	
	
	// 장바구니 상품 추가
	@ResponseBody
	@PostMapping("/addCartProd")
	public ResponseEntity<String> addCartProd(CartVO vo, HttpSession session){
		ResponseEntity<String> entity = null;
		
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		vo.setUser_id(user_id);
		
		if(cartService.addCartProd(vo) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
				
		return entity;
	}
	
	
	// 바로구매시 장바구니에 상품 추가
	@GetMapping("/addCartProdDir")
	public String addCartProdDir(CartVO vo, HttpSession session) {
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		vo.setUser_id(user_id);
		
		cartService.addCartProd(vo);
		
		return "redirect:/order/orderInfo";
	}
	
	
	// 장바구니 상품 수량 변경
	@ResponseBody
	@GetMapping("/changeCartQty")
	public ResponseEntity<String> changeCartQty(Long cart_no, int cart_qty){
		ResponseEntity<String> entity = null;
		
		if(cartService.changeCartQty(cart_no, cart_qty) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	// 장바구니 상품 삭제
	@ResponseBody
	@PostMapping("/deleteCartProd")
	public ResponseEntity<String> deleteCartProd(Long cart_no){
		ResponseEntity<String> entity = null;
		
		if(cartService.deleteCartProd(cart_no) == 1) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("fail", HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	// 장바구니 비우기
	@GetMapping("emptyCart")
	public String emptyCart(HttpSession session) {
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		cartService.emptyCart(user_id);
		return "redirect:/cart/cartList";
	}
	
	
}
