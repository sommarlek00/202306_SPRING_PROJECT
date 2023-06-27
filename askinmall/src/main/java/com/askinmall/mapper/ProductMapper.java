package com.askinmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;

public interface ProductMapper {
	
	// 1차 카테고리 클릭시 상품 목록 페이지
	List<ProductVO> firstCategoryProdList(@Param("category_cd") Integer category_cd, @Param("cri") Criteria cri);
	
	// 1차 카테고리 클릭시 상품 목록 데이터 개수
	int firstCategoryTotal(@Param("category_cd") Integer category_cd, @Param("cri") Criteria cri);
	
	// 2차 카테고리 클릭 시 상품 목록 페이지
	List<ProductVO> secondCategoryProdList(@Param("category_cd") Integer category_cd, @Param("cri") Criteria cri);
	
	// 2차 카테고리 클릭 시 상품 목록 데이터 개수
	int secondCategoryTotal(@Param("category_cd") Integer category_cd, @Param("cri") Criteria cri);
	
	// 상품 1차 카테고리 출력
	List<CategoryVO> getCategoryList();
	
	// 상품 2차 카테고리 출력
	List<CategoryVO> subCategoryList(Integer category_cd);
	
	// 상품 상세 페이지
	ProductVO prodDetail(Integer prod_no);
	

	
	
	
}
