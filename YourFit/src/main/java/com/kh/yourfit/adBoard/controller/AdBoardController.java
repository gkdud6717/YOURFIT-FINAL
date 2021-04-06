package com.kh.yourfit.adBoard.controller;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.yourfit.adBoard.model.service.AdBoardService;
import com.kh.yourfit.adBoard.model.vo.AdBoard;
import com.kh.yourfit.board_comment.model.vo.board_comment;
import com.kh.yourfit.board_file.model.vo.board_file;
import com.kh.yourfit.common.util.Utils;
import com.kh.yourfit.dtboard.model.vo.DtBoard;

@Controller
public class AdBoardController {
	
	@Autowired
	AdBoardService adBoardService;
	
	// 파일 이름 변경 메소드
	public String fileNameChanger(String oldFileName) {

		String ext = oldFileName.substring(oldFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rnd = (int)(Math.random() * 1000);

		return sdf.format(new Date(System.currentTimeMillis())) + "_" + rnd + "." + ext;
	}
	
	@RequestMapping("/adboard/adBoardFormEnd.do")
	public String insertAdBoard(AdBoard adboard, Model model, HttpServletRequest req,
			@RequestParam(value="upfiles", required=false) MultipartFile[] upFiles) {
		
			// 1. 파일 저장 경로와 파일 정보를 담을 객체 생성
				String saveDirectory
				      = req.getServletContext().getRealPath("/resources/adboardUpload");
				List<board_file> fileList = new ArrayList<board_file>();
				
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
						board_file bf = new board_file();
						bf.setF_Name(originName);
						bf.setF_Cname(changeName);
						
						fileList.add(bf);
					}
				}
				
				int result = adBoardService.insertBoard(adboard, fileList);
				
				String loc = "/";
				String msg = "";
				if( result > 0 ) {
					msg = "광고 등록 성공";
				} else {
					msg = "광고 등록 실패!";
				}
				
				model.addAttribute("loc", loc);
				model.addAttribute("msg", msg);
				
		return "/common/ad_msg";
	}
	
	@RequestMapping("/adboard/adBoardView.do")
	public String dtBoardView( Model model,HttpServletRequest req) {
		
		String ad_No = req.getQueryString();
		AdBoard adboard = adBoardService.selectOneBoard(ad_No);
		List<board_file> boardfileList = adBoardService.selectBoardFileList(ad_No);
		
		model.addAttribute("adboard", adboard);
		model.addAttribute("boardfileList", boardfileList);
		
		return "adboard/adBoardView";
	}
	
	@RequestMapping("/adboard/adBoardUpdateView.do")
	public String dtBoardUpdateView(HttpServletRequest req, Model model) {
		
		String ad_No = req.getQueryString();
		AdBoard adboard = adBoardService.updateView(ad_No);
		List<board_file> boardfileList = adBoardService.selectBoardFileList(ad_No);
		
		model.addAttribute("adboard", adboard);
		model.addAttribute("boardfileList", boardfileList);
		
		return "adboard/adBoardUpdateView";
	}
	
	@RequestMapping("/adboard/adBoardUpdate.do")
	public String boardUpdate(AdBoard adboard,
						@RequestParam(value="upfiles", required=false) MultipartFile[] upFiles,
						HttpServletRequest req, Model model) {
		
		String ad_No = adboard.getAd_No();
		
		AdBoard originBoard = adBoardService.updateView(ad_No);
		
		originBoard.setAd_Title(adboard.getAd_Title());
		originBoard.setAd_Content(adboard.getAd_Content());

			
		// 1. 파일 저장 경로 선언   
		String saveDirectory = req.getServletContext().getRealPath("/resources/adboardUpload");
			
		// 원본 첨부파일 목록
		List<board_file> boardfileList = adBoardService.selectBoardFileList(ad_No);
		if( boardfileList == null ) boardfileList = new ArrayList<board_file>();
		
		int idx = 0;
		for(MultipartFile f : upFiles) {
			board_file bf = null;
				
				if( f.isEmpty() == false ) {
					
					if( boardfileList.size() > idx) {
						boolean fileDelete
						   = new File(saveDirectory +"/" + boardfileList.get(idx).getF_Cname()).delete();
						
						bf = boardfileList.get(idx);
					} else {
						bf = new board_file();
						bf.setAd_No(ad_No);
						
						boardfileList.add(bf);
						
					}
					
					String originName = f.getOriginalFilename();
					String changeName = fileNameChanger(originName);
					
					try {
						f.transferTo(new File(saveDirectory + "/" + changeName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
						
					}
					
					bf.setF_Name(originName);
					bf.setF_Cname(changeName);
					
					boardfileList.set(idx, bf);
					
				}
				idx++;	
			}
			
			// 3. update 서비스 실행
			int result = adBoardService.updateBoard(originBoard, boardfileList);
			String msg = "";
			
			if( result > 0 ) {
				msg = "게시글 수정 성공!";
			} else {
				msg = "게시글 수정 실패!";
			}
			
			model.addAttribute("msg", msg);
	
	
	return "common/ad_msg";
	}

	@RequestMapping("/adboard/adBoardDelete.do")
	public String dtBoardDelete(HttpServletRequest req, Model model) {
		
		String ad_No = req.getQueryString();
		
		// 1. 파일이 저장된 폴더 경로
			String saveDir = req.getServletContext().getRealPath("/resources/adboardUpload");
				
			// 첨부파일 삭제 명단
			List<board_file> delList = adBoardService.selectBoardFileList(ad_No);
				
			// 2. DB 정보 삭제하기
			int result = adBoardService.deleteBoard(ad_No);
				
			String msg = "";
				
			if ( result > 0 ) {
					msg = "광고 삭제가 완료 되었습니다.!";
					
					for(board_file bf : delList) {
						new File(saveDir + "/" + bf.getF_Cname()).delete();
					}
					
				} else {
					msg = "광고 삭제 실패!";
				}
				
				model.addAttribute("msg", msg);
				
				return "common/ad_msg";
	}
}
