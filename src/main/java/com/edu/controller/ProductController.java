package com.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.bean.Product;
import com.edu.exception.MyException;
import com.edu.service.ProductService;
import com.edu.util.UUIDUtil;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	/**
	 * 接收的是key/value的值，响应的是json格式
	 */
	@ResponseBody
	@RequestMapping(value="/json",method = {RequestMethod.GET,RequestMethod.POST})
	public Product json(Product product) {
		
		return product ;
	}
	/**
	 * 接收的是json字符串，响应的json格式的字符串
	 * @param product
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/json2",method = {RequestMethod.GET,RequestMethod.POST})
	public Product json2(@RequestBody Product product) {
		
		return product ;
	}
	/**
	 * 列表
	 * @return
	 * @throws MyException 
	 */
	@GetMapping("/list")
	public String list(Model model) throws MyException {
		List<Product> productList = productService.getAll();
//		int result = 1/0 ;
//		if(productList.size()>2) {
//			throw new MyException("查询的数据必须小于二") ;
//		}
		model.addAttribute("productList", productList);
		return "list";
	}
	/**
	 * 跳转到新增页面
	 * @return
	 */
	@GetMapping("/product")
	public String addUI() {
		
		return "addUI";
	}
	/**
	 * 新增操作
	 * @return
	 */
	@PostMapping("/product")
	public String add(Product product) {
		// 设置uuid
		product.setId(UUIDUtil.getCode());
		productService.save(product);
		return "redirect:/list";
	}
	/**
	 * 跳转到修改页面
	 * http://...../product/2
	 * @return
	 * @throws Exception 
	 * @throws MyException 
	 */
	@GetMapping("/product/{id}")
	public String editUI(@PathVariable("id") String id,Model model) throws Exception {
		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		return "editUI";
	}
	/**
	 * 进行修改操作
	 * @return
	 */
	@PutMapping("/product")
	public String edit(Product product) {
		productService.update(product);
		return "redirect:/list";
	}
	/**
	 * 进行删除操作
	 * @return
	 */
	@DeleteMapping("/product/{id}")
//	@GetMapping("/product/{id}")
//	@RequestMapping(value="/productDel/{id}",method=RequestMethod.GET)
	public String del(@PathVariable("id") String id) {
		productService.delById(id);
		return "redirect:/list";
	}
}
