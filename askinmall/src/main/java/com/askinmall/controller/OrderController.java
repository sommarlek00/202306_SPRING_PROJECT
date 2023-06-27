package com.askinmall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.askinmall.domain.MemberVO;
import com.askinmall.domain.OrderVO;
import com.askinmall.domain.PaymentVO;
import com.askinmall.dto.CartListDTO;
import com.askinmall.kakaopay.ApproveResponse;
import com.askinmall.kakaopay.ReadyResponse;
import com.askinmall.service.CartService;
import com.askinmall.service.KakaoPayService;
import com.askinmall.service.MemberService;
import com.askinmall.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Resource(name = "cid")
	private String cid;
	
	@Setter(onMethod_= {@Autowired})
	private OrderService orderService;
	
	@Setter(onMethod_= {@Autowired})
	private CartService cartService;
	
	@Setter(onMethod_ =  {@Autowired})
	private MemberService memberService;
	
	@Setter(onMethod_ =  {@Autowired})
	private KakaoPayService kakaoPayService;
	
	
	// 사용자 페이지
	// 상품 주문 상세 페이지
	@GetMapping("/orderInfo")
	public void orderInfo(HttpSession session, Model model) {
		
		String user_id  = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		
		List<CartListDTO> cartList = cartService.cartList(user_id);
		
		cartList.forEach(vo -> {
			vo.setProd_upload_folder(vo.getProd_upload_folder().replace("\\", "/"));
		});
		
		// 주문 상품명
		String orderProdName = cartList.get(0).getProd_name() + " 외" + (cartList.size() - 1) + "건";
		model.addAttribute("orderProdName", orderProdName);
	
		// 주문 목록
		model.addAttribute("cartList", cartList);
		// 주문 총금액
		model.addAttribute("cartTotalAmount", cartService.cartTotalAmount(user_id));
		// 주문자 정보
		model.addAttribute("member", memberService.login(user_id));
	}
	
	// 결제 준비 요청
	@GetMapping("/orderPayment")
	@ResponseBody
	public ReadyResponse orderPayment(String payType, String orderProdName, OrderVO order_vo, PaymentVO payment_vo, HttpSession session) {
		
		ReadyResponse readyResponse = new ReadyResponse();
		
		String user_id = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		
		order_vo.setUser_id(user_id);
		payment_vo.setUser_id(user_id);
		
		log.info("결제방식: " + payType);
		log.info("주문 정보: " + order_vo);
		log.info("무통장 결제 정보: " + payment_vo);
		
		if(payType.equals("bank")) {
			orderService.orderSave(order_vo, payment_vo);
		}
		
		if(payType.equals("kakaopay")) {
			
			payment_vo.setPay_user(payment_vo.getUser_id());
			payment_vo.setPay_bank("kakaopay");
			log.info("카카오페이 결제 정보: " + payment_vo);
			orderService.orderSave(order_vo, payment_vo);
			
			String approval_url = "http://localhost:8081/order/orderApproval"; // 결제준비 요청 성공시 사용 주소
			String cancel_url = "http://localhost:8081/order/orderCancel"; // 결제준비 요청 취소시 사용 주소
			String fail_url = "http://localhost:8081/order/orderFail";
			
			readyResponse = kakaoPayService.payReady(cid, order_vo.getOrd_no(), user_id, orderProdName, 1,
													 order_vo.getOrd_total_amount(), 0, approval_url, cancel_url, fail_url);
			
			session.setAttribute("tid", readyResponse.getTid());
			session.setAttribute("ord_no", order_vo.getOrd_no());
			
		}
		
		return readyResponse;
	}
	
	
	// 결제 승인 요청
	@GetMapping("/orderApproval")
	public String orderApproval(String pg_token, HttpSession session) {
		
		String tid = (String) session.getAttribute("tid");
		session.removeAttribute("tid");
		
		Long ord_no = (Long) session.getAttribute("ord_no");
		session.removeAttribute("ord_no");
		
		String user_id = ((MemberVO) session.getAttribute("loginStatus")).getUser_id();
		
		ApproveResponse approveResponse = kakaoPayService.payApprove(cid, tid, ord_no, user_id, pg_token);
		
		return "redirect:/order/orderComplete";
	}
	
	
	// 결제 성공
	@GetMapping("/orderComplete")
	public void orderComplete() {
	}
	
	
	// 결제 취소
	@GetMapping("/orderCancel")
	public void orderCancel() {
	}
	
	
	// 결제 실패
	@GetMapping("/orderFail")
	public void orderFail() {
	}
	
	
}
