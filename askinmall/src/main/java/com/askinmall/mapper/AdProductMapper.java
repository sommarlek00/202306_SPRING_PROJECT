package com.askinmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;

public interface AdProductMapper {
	
	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> subCategoryList(Integer category_cd);
	
	// 
	void insertProd(ProductVO vo);
	
	// 상품 리스트
	List<ProductVO> prodList(@Param("cri")Criteria cri,@Param("category_cd") Integer category_cd);
	
	// 상품 리스트
	int getTotal(@Param("cri")Criteria cri,@Param("category_cd") Integer category_cd);

	// 상품 수정 페이지, 상품 상세 페이지
	ProductVO prodModifyForm(Integer prod_no);
	
	CategoryVO getPrtCategory(int category_cd);
	
	void modifyProd(ProductVO vo);
	
	void deleteProd(Integer prod_no);
	
	// 선택상품 수정
	void modifyCheckedProd(List<ProductVO> prod_list);
	
	// 선택상품 삭제
	void deleteCheckedProd(List<Integer> prod_no_arr);
	
}
