package com.askinmall.service;

import java.util.List;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;

public interface ProductService {
	
	List<ProductVO> firstCategoryProdList(Integer category_cd,Criteria cri);
	
	// 1차 카테고리 상품 전체 출력
	int firstCategoryTotal(Integer category_cd, Criteria cri);
	
	List<ProductVO> secondCategoryProdList(Integer category_cd, Criteria cri);
	
	int secondCategoryTotal(Integer category_cd, Criteria cri);
	
	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> subCategoryList(Integer category_cd);
	
	ProductVO prodDetail(Integer prod_no);
	
}
