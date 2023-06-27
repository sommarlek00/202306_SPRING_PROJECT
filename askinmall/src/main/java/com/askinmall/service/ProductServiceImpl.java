package com.askinmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;
import com.askinmall.mapper.ProductMapper;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = {@Autowired})
	private ProductMapper productMapper;
	
	@Override
	public List<ProductVO> firstCategoryProdList(Integer category_cd, Criteria cri) {
		return productMapper.firstCategoryProdList(category_cd, cri);
	}

	@Override
	public int firstCategoryTotal(Integer category_cd, Criteria cri) {
		return productMapper.firstCategoryTotal(category_cd, cri);
	}
	
	@Override
	public List<ProductVO> secondCategoryProdList(Integer category_cd, Criteria cri) {
		return productMapper.secondCategoryProdList(category_cd, cri);
	}

	@Override
	public int secondCategoryTotal(Integer category_cd, Criteria cri) {
		return productMapper.secondCategoryTotal(category_cd, cri);
	}

	@Override
	public List<CategoryVO> getCategoryList() {
		return productMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> subCategoryList(Integer category_cd) {
		return productMapper.subCategoryList(category_cd);
	}

	@Override
	public ProductVO prodDetail(Integer prod_no) {
		return productMapper.prodDetail(prod_no);
	}


	
}
