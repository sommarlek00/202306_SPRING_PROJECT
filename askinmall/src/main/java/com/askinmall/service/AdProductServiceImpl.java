package com.askinmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.askinmall.domain.CategoryVO;
import com.askinmall.domain.Criteria;
import com.askinmall.domain.ProductVO;
import com.askinmall.mapper.AdProductMapper;

import lombok.Setter;

@Service
public class AdProductServiceImpl implements AdProductService {
	
	@Setter(onMethod_= {@Autowired})
	private AdProductMapper adProductMapper;

	@Override
	public List<CategoryVO> getCategoryList() {
		return adProductMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> subCategoryList(Integer category_cd) {
		return adProductMapper.subCategoryList(category_cd);
	}

	@Override
	public void insertProd(ProductVO vo) {
		adProductMapper.insertProd(vo);
		
	}
	
	@Override
	public List<ProductVO> prodList(Criteria cri, Integer category_cd) {
		return adProductMapper.prodList(cri, category_cd);
	}

	@Override
	public int getTotal(Criteria cri, Integer category_cd) {
		return adProductMapper.getTotal(cri, category_cd);
	}
	

	@Override
	public ProductVO prodModifyForm(Integer prod_no) {
		return adProductMapper.prodModifyForm(prod_no);
	}

	@Override
	public CategoryVO getPrtCategory(int category_cd) {
		return adProductMapper.getPrtCategory(category_cd);
	}

	@Override
	public void modifyProd(ProductVO vo) {
		adProductMapper.modifyProd(vo);
		
	}

	@Override
	public void deleteProd(Integer prod_no) {
		adProductMapper.deleteProd(prod_no);
	}
	
	@Override
	public void modifyCheckedProd(List<ProductVO> prod_list) {
		adProductMapper.modifyCheckedProd(prod_list);
	}

	@Override
	public void deleteCheckedProd(List<Integer> prod_no_arr) {
		adProductMapper.deleteCheckedProd(prod_no_arr);
	}




}
