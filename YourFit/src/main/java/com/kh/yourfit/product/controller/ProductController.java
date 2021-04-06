package com.kh.yourfit.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.product.model.service.ProductService;
import com.kh.yourfit.product.model.vo.Product;
import com.kh.yourfit.product_Review.model.vo.ProductReview;
import com.kh.yourfit.product_img.model.vo.product_img;
import com.kh.yourfit.question.model.vo.Question;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/product/productList.do")
		public String selectProductList(
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10;
		
		List<Map<String, String>> list = productService.selectProductList(cPage, numPerPage);
		
		int totalContents = productService.selectProductTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "productList.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		System.out.println("list : "  + list);
		return "product/productList";
	}
	
	@RequestMapping("/product/productListLiv.do")
		public String selectProductListLiv(
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10;
		
		List<Map<String, String>> list = productService.selectProductListLiv(cPage, numPerPage);
		
		int totalContents = productService.selectProductTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "productListLiv.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		System.out.println("list : "  + list);
		return "product/productListLiv";
	}
	
	@RequestMapping("/product/productListFh.do")
		public String selectProductListFh(
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10;
		
		List<Map<String, String>> list = productService.selectProductListFh(cPage, numPerPage);
		
		int totalContents = productService.selectProductTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "productListFh.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		System.out.println("list : "  + list);
		return "product/productListFh";
	}
	
	@RequestMapping("/product/productListBea.do")
		public String selectProductListBea(
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10;
		
		List<Map<String, String>> list = productService.selectProductListBea(cPage, numPerPage);
		
		int totalContents = productService.selectProductTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "productListBea.do");
		
		model.addAttribute("list", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		System.out.println("list : "  + list);
		return "product/productListBea";
	}
	
	@RequestMapping("/product/productForm.do")
	public void productForm() { }
	
	@RequestMapping("/product/productFormEnd.do")
	public String insertProduct(Product product, Model model, HttpServletRequest req,
					@RequestParam(value="upfiles", required=false) MultipartFile[] upFiles) {
		
		String saveDirectory
	      = req.getServletContext().getRealPath("/resources/productUpload"); 
		
		List<product_img> fileList = new ArrayList<product_img>();
		
		for(MultipartFile f : upFiles) {
			  System.out.println("결과 : " + f.getOriginalFilename());
			if( f.isEmpty() == false) {
				
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				
					try {
						f.transferTo(new File(saveDirectory + "/" + changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				
				// 3. list에 담기
				product_img pi = new product_img();
				pi.setI_OriginName(originName);
				pi.setI_ChangeName(changeName);
				
				fileList.add(pi);
			}
		}
		
		int result = productService.insertProduct(product, fileList);
		
		String loc = "/product/productList.do";
		String msg = "";
		if( result > 0 ) {
			msg = "게시글 등록 성공";
		} else {
			msg = "게시글 등록 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "/common/msg";
	}
	
	@RequestMapping("/product/productView.do")
	public String productView(@RequestParam int no, Model model) {
		
		Product product = productService.selectOneProduct(no);
		List<product_img> productimgList = productService.selectProductImgList(no);
		
		List<ProductReview> prlist = productService.selectReviewlist(no);
		List<Question> qlist = productService.selectQuestionlist(no);
		
		System.out.println("productimgList : " + productimgList);
		
		model.addAttribute("product", product);
		model.addAttribute("productimgList", productimgList);
		model.addAttribute("qlist", qlist);
		model.addAttribute("prlist", prlist);
		return "product/productView";
	}
	
	@RequestMapping("/product/insertReview.do")
	public String insertReview(@RequestParam int m_No, @RequestParam int p_No, @RequestParam String r_Content, Model model) {
		
		ProductReview ProductReview = new ProductReview();
		ProductReview.setR_Content(r_Content);
		ProductReview.setR_Mno(m_No);
		ProductReview.setR_Pno(p_No);

		int result = productService.insertReview(ProductReview);

		model.addAttribute("no", p_No);
		
		return "redirect:/product/productView.do";
	}
	
	@RequestMapping("/product/deleteReview.do")
	public String deleteReview(@RequestParam int p_No, @RequestParam int r_No, Model model) {
		System.out.println(p_No);
		System.out.println(r_No);
		
		int result = productService.deleteReview(r_No);

		model.addAttribute("no", p_No);
		return "redirect:/product/productView.do";
	}
	
	@RequestMapping("/product/updateReview.do")
	public String updateReview(Model model, @RequestParam int p_No, @RequestParam int r_No, @RequestParam String r_Content) {
		ProductReview ProductReview = new ProductReview();
		ProductReview.setR_Pno(p_No);
		ProductReview.setR_No(r_No);
		ProductReview.setR_Content(r_Content);
		System.out.println(ProductReview);
		
		int result = productService.updateReview(ProductReview);
		
		model.addAttribute("no", p_No);
		return "redirect:/product/productView.do";
	}
	
	@RequestMapping("/product/QuestionForm.do")
	public String QuestionForm(@RequestParam int q_Mno, @RequestParam int q_Pno, Model model) {
		Question Question = new Question();
		Question.setQ_Mno(q_Mno);
		Question.setQ_Pno(q_Pno);
		model.addAttribute("Question", Question);
		return "product/QuestionForm";
	}
	
	@RequestMapping("/product/QuestionFormEnd.do")
	public String QuestionFormEnd(Question Question, @RequestParam int q_Pno, Model model) {
		
		int result = productService.insertQuestion(Question);
		
		model.addAttribute("no", q_Pno);
		return "redirect:/product/productView.do";
	}
	
	
	
	
	@RequestMapping("/product/productUpdateView.do")
	public String productUpdateView(@RequestParam int p_No, Model model) {
		
		Product product = productService.updateView(p_No);
		List<product_img> productimgList = productService.selectProductImgList(p_No);
		
		model.addAttribute("product", product);
		model.addAttribute("productimgList", productimgList);
		
		return "product/productUpdateView";
	}
	
	@RequestMapping("product/productUpdate.do")
	public String productUpdate(Product product,
			                    @RequestParam(value="upfiles", required=false) MultipartFile[] upFiles,
			                    HttpServletRequest req, Model model) {
		
		int p_No = product.getP_No();
		
		Product originProduct = productService.updateView(p_No);
		
		originProduct.setP_Name(product.getP_Name());
		originProduct.setP_Content(product.getP_Content());
		originProduct.setP_Price(product.getP_Price());
		originProduct.setP_Type(product.getP_Type());
		
		String saveDirectory = req.getServletContext().getRealPath("/resources/productUpload");
		
		List<product_img> productimgList = productService.selectProductImgList(p_No);
		if(productimgList == null) productimgList = new ArrayList<product_img>();
		
		System.out.println("결과1 : " + productimgList);
		
		int idx = 0;
		for(MultipartFile f : upFiles) {
			product_img pi = null;
			
			if(f.isEmpty() == false ) {
				
				System.out.println("새로 들어온 파일 : " + f);
				System.out.println("삭제 되어야 할 파일 : " + saveDirectory +"/" + productimgList.get(idx).getI_ChangeName());
				
				if( productimgList.size() > idx ) {
					boolean fileDelete
						= new File(saveDirectory +"/" + productimgList.get(idx).getI_ChangeName()).delete();
				
					
					pi = productimgList.get(idx);
				
				} else {
					
					pi = new product_img();
					pi.setP_No(p_No);
				}
				
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				
				try {
					f.transferTo(new File(saveDirectory + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					
				}
				System.out.println("결과2 : " + productimgList);
				
				pi.setI_OriginName(originName);
				pi.setI_ChangeName(changeName);
				
				productimgList.set(idx, pi);
				
				
				System.out.println("결과3 : " + productimgList);
			}
			idx++;
		}
		
		int result = productService.updateProduct(originProduct, productimgList);
		String loc = "/product/productList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "상품 수정 성공!";
		} else {
			msg = "상품 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		System.out.println("originBoard : " + originProduct);
		System.out.println("boardfileList : " + productimgList);
		
		return "common/msg";
		
	}
	
	@RequestMapping("/product/productDelete.do")
	public String productDelete(@RequestParam int p_No, HttpServletRequest req, Model model) {
		
		String saveDir = req.getServletContext().getRealPath("/resources/productUpload");
		
		List<product_img> delList = productService.selectProductImgList(p_No);
		
		int result = productService.deleteProduct(p_No);
		
		String loc = "/product/productList.do";
		String msg = "";
		
		if ( result > 0 ) {
			msg = "게시글 삭제 완료!";
			
			for(product_img pi : delList) {
				new File(saveDir + "/" + pi.getI_ChangeName()).delete();
				
			} 
		} else {
				msg = "상품 삭제 실패!";
			}
			
			model.addAttribute("loc", loc);
			model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
	
	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
		
	}
	
	@RequestMapping("/product/productSearch.do")
	public String dtBoardSearch(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			                    @RequestParam(value="keyword", required=false, defaultValue="") String keyword, 
			                    @RequestParam(value="searchType", required=false, defaultValue="title") String searchType, Model model) {
		
		int numPerPage = 10;
		
		List<Map<String, String>> list = productService.productSearch(cPage, numPerPage, keyword, searchType);
		
		int count = productService.productSearchCount(keyword);
		
		String pageBar = Utils.getPageBar(count, cPage, numPerPage, "productSearch.do");
		
		System.out.println("list2" + list);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchType", searchType);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "product/productListSearch";
	}
	
	@RequestMapping("/product/productbuy.do")
	public String productbuy(@RequestParam String p_Name, @RequestParam int o_Pno, @RequestParam int p_Price, @RequestParam int c_Amount, @RequestParam int sumMoney, Model model) {
		
		model.addAttribute("o_Pno", o_Pno);
		model.addAttribute("p_Name", p_Name);
		model.addAttribute("sumMoney", sumMoney);
		model.addAttribute("c_Amount", c_Amount);
		
		/*
		 * System.out.println("o_Pno" + o_Pno); System.out.println("p_Name" + p_Name);
		 */
		/*
		 * Orders orders = new Orders(); orders.setO_Mno(o_Mno);
		 */

		return "product/productBuy";

	}
	
	@RequestMapping("product/productSuccess.do")
	public String orderSuccess() {
		return "product/productBuySuccess";
	}
	
	@RequestMapping("product/productFail.do")
	public String orderFail() {
		return "product/productBuyFail";
	}
	
	@RequestMapping("/product/productbuyPage.do")
    public String productbuy2(@RequestParam String p_Name, @RequestParam int p_No, @RequestParam int p_Price, @RequestParam int p_Quantity, Model model) {
       /*
        * System.out.println(p_Name); System.out.println(p_No);
        * System.out.println(p_Price); System.out.println(p_Quantity);
        */
       int sumMoney = p_Price * p_Quantity;
       model.addAttribute("p_Name",p_Name);
       model.addAttribute("o_Pno",p_No);
       model.addAttribute("p_Price",p_Price);
       model.addAttribute("c_Amount",p_Quantity);
       model.addAttribute("sumMoney",sumMoney);
       
       return "product/productBuyPage2";
    }
	
	
}
