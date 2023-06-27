package com.askinmall.service;

import java.util.List;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;

public interface AdProductService {
	
	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> subCategoryList(Integer category_cd);

	void insertProd(ProductVO vo);
	
	// 상품 리스트
	List<ProductVO> prodList(Criteria cri, Integer category_cd);
	
	// 상품 리스트
	int getTotal(Criteria cri, Integer category_cd);
	
	// 상품 수정 페이지
	ProductVO prodModifyForm(Integer prod_no);
	
	CategoryVO getPrtCategory(int category_cd);
	
	void modifyProd(ProductVO vo);
	
	void deleteProd(Integer prod_no);
	
	// 선택상품 수정
	void modifyCheckedProd(List<ProductVO> prod_list);
	
	// 선택상품 삭제
	void deleteCheckedProd(List<Integer> prod_no_arr);
}
