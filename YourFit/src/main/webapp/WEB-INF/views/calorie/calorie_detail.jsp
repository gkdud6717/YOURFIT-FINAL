<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>칼로리 처방</title>

<link href="${pageContext.request.contextPath}/resources/css/cal_detail.css" rel="stylesheet">
</head>
<body>

     <c:import url="../common/header.jsp"/>
                   
            <section id="wrap-contents">
             <div class="container">
              <div class="row">
              <div class="col-lg-1 col-md-1"></div>
              
                <div class="col-lg-10 col-md-10">
                 <div id="h1tag">
                 <h1 id="title" style="margin-bottom: 10px;"><img src="${pageContext.request.contextPath}/resources/images/kcal.png" style="width: 38px; height: 38px; margin-bottom: 10px;">
                 나의 <span class="color">칼로리</span> 처방받기</h1></div>
          
                <!-- table -->
              <div class="row">
               <div class="col-md-7">
               <form>
                 <table id="table" style="border-spacing: 2rem;">
                 <tr>
                   <th class="T">성별</th>
                   <td class="I">
                    &nbsp; <input type="radio" name="gender" value="male" id="male" checked="checked"> 남성 &nbsp; 
                     <input type="radio" name="gender" value="female" id="female"> 여성
                   </td>
                 </tr>
                 <tr>
                   <th class="T">나이</th>
                   <td class="I2" id="AT"><input type="number" min="0" id="age" placeholder="" maxlength="3" required="required" oninput="numberMaxLength(this);"> &nbsp;세
                       <div style="display: none;" id="ATT">나이를 입력해주세요!</div></td>
                 </tr>
                 <tr>
                   <th class="T">키</th>
                   <td class="I2"><input type="number" min="0" id="height" maxlength="3" oninput="numberMaxLength(this);"> &nbsp;cm
                       <div style="display: none;" id="HTT">키를 입력해주세요!</div></td>
                 </tr>
                 <tr>
                   <th class="T">몸무게</th>
                   <td class="I2"><input type="number" min="0" id="weight" maxlength="3" oninput="numberMaxLength(this);"> &nbsp;kg
                       <div style="display: none;" id="WTT">몸무게를 입력해주세요!</div></td>
                 </tr>
               </form>
       
               <tr>
                 <th class="T">평소 활동량</th>
                 <td>
                   <select class="custom-select custom-select-sm" id="OP"> 
                     <option value="0" id="0">기초대사량 (BMR)</option>
                     <option value="1" id="1">운동을 거의 안 함</option>
                     <option value="2" id="2">가벼운 활동 (일주일에 1~3번 가벼운 운동)</option>
                     <option value="3" id="3">보통 활동 (일주일에 3~4번 일상적인 운동)</option>
                     <option value="4" id="4">많은 활동 (일주일에 6~7번 강렬한 운동)</option>
                     <option value="5" id="5">격심한 활동 (매일 심한 운동을 하거나 육체를 쓰는 직업)</option>
                   </select>
                 </td>
               </tr>
             </table>
             </div>
             <div class="col-md-5" style="padding:0;">
                 <img src="${pageContext.request.contextPath}/resources/images/mirror.PNG" style="width: 87%; height: 87%; display: block; margin: 20px auto;">
             </div>
           </div>
             <!-- UwU -->
             <button id="B" type="button" onclick="calc()" class="btn btn-amber">칼로리 처방 결과</button>
    
           <!-- Score -->
           <div id="Final"  style=" border: 1px solid black; width: 100%; background-color:white; border-radius: 1px; color: white; display: none;">       
              
               <div class="col-lg-4 col-md-4" id="result" style="border-right: 1px solid lightgray;">
                 <h4 class="T2" style="">체중 <span style="color:#ff6666;">감량</span>에 필요한 칼로리<p id="p">0.5 kg/일주일</p>
                 </h4>                
                    <div id="img2"><img src="${pageContext.request.contextPath}/resources/images/lose1.png" style="width: 100%; height: 100%;"></div>    
                    <div id="p2"><p id="b" class="SS">&nbsp</p><p class="CD">kcal/1일</p></div>
               </div>
             
               <div class="col-lg-4 col-md-4" id="result" style="border-right: 1px solid lightgray;">
                 <h4 class="T2">체중 <span style="color: #000080;">유지</span>에 필요한 칼로리 <p id="p" style="color: white;">기준점 입니다.</p></h4>
                 <div id="img2"><img src="${pageContext.request.contextPath}/resources/images/stay.png" style="width: 100%; height: 100%;"></div>      
                 <div id="p2"><p id="a" class="SS">&nbsp</p><p class="CD">kcal/1일</p></div>
               </div>
               
               <div class="col-lg-4 col-md-4" id="result">
                 <h4 class="T2">체중 <span style="color: #ff6666;">증량</span>에 필요한 칼로리 <p id="p">0.5 kg/일주일</p>
                 </h4>
                  <div id="img2"><img src="${pageContext.request.contextPath}/resources/images/gain1.png" style="width: 100%; height: 100%;"></div>
                  <div id="p2"><p id="c" class="SS">&nbsp</p><p class="CD">kcal/1일</p></div>
             </div>

              <button id="B" type="button" onclick="location.href='${pageContext.request.contextPath}/index.do'" class="btn btn-amber">뒤로가기</button>
             
           </div>
          </div>  
          <div class="col-lg-1 col-md-1"></div>
          </div>
                 
        </div>

    </section>

  <!-- jQuery -->
  <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="/resources/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="/resources/js/mdb.min.js"></script>
  <!-- Your custom scripts (optional) -->
  <script type="text/javascript" src="/resources/js/calculator.js"></script>

  <script>
  function calc() {
    let A = document.getElementById("age").value;  
    let H = document.getElementById("height").value;
    let W = document.getElementById("weight").value;
    let S
    let R

    // input check
    if (document.getElementById("age").value.length == 0) {

        document.getElementById("ATT").style = "color: red; margin-left: 10px;"
        document.getElementById("HTT").style = "display: none;"
        document.getElementById("WTT").style = "display: none;"

        return

    }

    if (document.getElementById("height").value.length == 0) {

        document.getElementById("ATT").style = "display: none;"
        document.getElementById("HTT").style = "color: red; margin-left: 10px;"
        document.getElementById("WTT").style = "display: none;"
        
        return

    }

    if (document.getElementById("weight").value.length == 0) {

        document.getElementById("ATT").style = "display: none;"
        document.getElementById("HTT").style = "display: none;"
        document.getElementById("WTT").style = "color: red; margin-left: 10px;"
        
        return

    } 

    // Basal
    if (document.getElementById("male").checked) {
        S =  Math.round((9.99*W)+(6.25*H)-(4.92*A)+5)
    } else if (document.getElementById("female").checked) {
        S =  Math.round((9.99*W)+(6.25*H)-(4.92*A)-161)
    }

    // Activity 0 (BMR)
    if (document.getElementById("0").selected) {
        R = S
    }

    // Activity 1
    if (document.getElementById("1").selected) {
        R = S*1.2
    }

    // Activity 2
    if (document.getElementById("2").selected) {
        R = S*1.35
    }

    // Activity 3
    if (document.getElementById("3").selected) {
        R = S*1.55
    }
    
    // Activity 4
    if (document.getElementById("4").selected) {
        R = S*1.75
    }

    // Activity 5
    if (document.getElementById("5").selected) {
        R = S*1.95
    }

    document.getElementById("ATT").style = "display: none;"
    document.getElementById("WTT").style = "display: none;"
    document.getElementById("HTT").style = "display: none;"

    document.getElementById("age").placeholder = " "
    document.getElementById("height").placeholder = "cm"
    document.getElementById("weight").placeholder = "kg"

    document.getElementById("a").innerHTML = Math.round(R)

    document.getElementById("b").innerHTML = Math.round(R*0.80)

    document.getElementById("c").innerHTML = Math.round(R*1.20)

    document.getElementById("Final").style = "width: 100%; border: 1px solid white; background-color:white; border-radius: 10px; color:navy;"
    }

   function numberMaxLength(e){
      if(e.value.length > e.maxLength){
          e.value = e.value.slice(0, e.maxLength);
      }
   }

  
  </script>
       

     <div class="dmtop">Scroll to Top</div>
       
    <c:import url="../common/footer.jsp"/>

</body>
</html>