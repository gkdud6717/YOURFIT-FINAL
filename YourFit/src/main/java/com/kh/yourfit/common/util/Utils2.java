package com.kh.yourfit.common.util;

import org.springframework.stereotype.Controller;

@Controller
public class Utils2 {
   
   public static String getPageBar(int totalContents, int cPage, int numPerPage, String url, int m_No){
      String pageBar = "";
      int pageBarSize = 5;
      cPage = cPage==0?1:cPage;
      
      //총페이지수 구하기
      int totalPage = (int)Math.ceil((double)totalContents/numPerPage);
      
      //1.pageBar작성
      //pageBar순회용변수 
      int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize +1;
      
      //종료페이지 번호 세팅
      int pageEnd = pageNo+pageBarSize-1;
      
       pageBar="<ul class='pagination justify-content-center pagination-sm'>";
           if(pageNo==1)
           {
               pageBar+="<li class='page-item' disabled>";
               pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
               pageBar+="</li>";
           }
           else 
           {
               pageBar+="<li class='page-itme'>";
               pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
               pageBar+="</li>";
           }
      
           while(!(pageNo>pageEnd||pageNo>totalPage))
           {
               if(pageNo==cPage)
               {
                   pageBar+="<li class='page-item active'>";
                   pageBar+="<a class='page-link'>"+pageNo+"</a>";
                   pageBar+="</li>";
               }
               else
               {
                   pageBar+="<li class='page-item'>";
                   pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
                   pageBar+="</li>";
               }
               pageNo++;
           }
      
           if(pageNo>totalPage)
           {
               pageBar+="<li class='page-item' disabled>";
               pageBar+="<a class='page-link' href='#'>다음</a>";
               pageBar+="</li>";
           } else
           {
               pageBar+="<li class='page-item'>";
               pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
               pageBar+="</li>";
           }
           pageBar+="</ul>";
           
           //paging 처리 script작성  
           pageBar+="<script>";
           pageBar+="function fn_paging(cPage){";
           pageBar += "location.href='"+url+"?cPage='+cPage+'&m_No="+m_No+"';";
           pageBar+="}";
           pageBar+="</script>";
           
           return pageBar;
          
       }


}