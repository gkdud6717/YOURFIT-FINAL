<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.content {
	border-bottom: 2px solid black;
	padding-bottom: 20px;
	margin-bottom: 20px;
	width: 800px;
}
.btn-group {float: right;}
#btn-back { margin-left: 20px;}
.table th {
	line-height: 30px;
}
.phone-group { display: inline-block; }
.phone-group>div { display: inline-block; width: 100px;}
#userNick_chk, #userAdress_chk {text-align: left;}
</style>
<script>
function fn_goForm(){
	location.href = "${pageContext.request.contextPath}/mypage/deleteConfirm.do";
}

</script>
</head>
<body>
<c:import url="../../common/header.jsp"/>
	<section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget widget-sidebar">
                                <h2 class="widget-title">마이페이지</h2>
                                <div class="link-widget">
                                    <ul>
                                        <li class="active-sidebar"><a href="${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}">회원 정보<span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectPostList.do?m_No=${member.m_No}">작성 글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/selectCommentList.do?m_No=${member.m_No}">작성 댓글 관리 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberOrderList.do?m_No=${member.m_No}">주문 내역 <span>></span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/mypage/memberQuestionList.do?m_No=${member.m_No}">문의 내역 <span>></span></a></li>
                                    </ul>
                                </div><!-- end link-widget -->
                            </div><!-- end widget -->
                        </div><!-- end sidebar -->
                    </div><!-- end col -->
					<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12">
                        <div class="page-wrapper">
                        	<h2 class="content"><i class="fa fa-user" style="margin-right: 10px"></i>${member.m_Nick }님의 회원 정보 수정</h2>
								<div class="table-group">
								<form action="${pageContext.request.contextPath}/mypage/updateMember.do" method="post" onsubmit="return form_chk();">
								<table class="table table1">
							    	<tr>
							    		<input type="hidden" name="m_No" value="${member.m_No }" />
								        <th>아이디</th>
								        <td>${member.m_Id }</td>
							        </tr>
							        <tr>
								        <th>가입일</th>
								       	<td>${member.m_Joindate }</td>
							        </tr>
							        <tr>
								        <th><label for="userNick" class="col-form-label">닉네임</label></th>
								        <td>
								        <div class="form-group" id="userNick_success" style="width: 200px;">
											<input type="text" class="form-control" id="userNick" name="m_Nick" 
												aria-describedby="inputSuccess2Status" required value="${member.m_Nick }">
											
										</div>
										
										<p id="userNick_chk"></p>
										<input type="hidden" id="Nick_ok" value=0 /></td> 
								        </tr>	
							         <tr>
								        <th>성별</th>
								        <c:choose>
								        	<c:when test="${member.m_Gender eq 'F'}"><td>여성</td></c:when>
								       		<c:otherwise><td>남성</td></c:otherwise>
								        </c:choose>       
							        </tr>
							        <tr>
							            <th>이메일</th>
							            <td>${member.m_Email }</td>       
							        </tr>
							        <tr>
							            <th>전화번호</th>
							            <td>
							            	<c:set var="phone" value="${fn:split(member.m_Phone, '-')}"></c:set>
											<c:forEach var="no" items="${phone }" varStatus="vs">
											<div class="phone-group">
							            		<c:if test="${vs.count == 1}"><div><input class="form-control" id="phone_first_text" type="text" value="${no }"></div></c:if>
												<c:if test="${vs.count == 2}"><div><input class="form-control" id="phone_middle_text" type="text" value="${no }"></div></c:if>	
												<c:if test="${vs.count == 3}"><div><input class="form-control" id="phone_last_text" type="text" value="${no }"></div></c:if>
											</div>
											</c:forEach>
											<input type="hidden" id="phone_address" name="m_Phone" value=1/>
										</td>
							        </div>
							        </tr>
							         <tr>
							            <th><label for="userHome" class="col-form-label">주소</label></th>
							            <td>
							            	<c:set var="addr" value="${fn:split(member.m_Address, '/')}"></c:set>
							            	<c:forEach var="ad" items="${addr }" varStatus="vs">
							            		<c:if test="${vs.count == 1}"><input class="form-control" id="userAddress_code" type="text" readonly value="${ad }" style="width: 300px; margin-bottom: 10px;"></c:if>
												<c:if test="${vs.count == 2}"><input class="form-control" id="userAddress" type="text" readonly value="${ad }" style="width: 300px; margin-bottom: 10px;"></c:if>
											<div class="form-group" id="userAdress_success">
												<c:if test="${vs.count == 3}"><input class="form-control" id="userAdress_final" type="text" value="${ad }" style="width: 500px;"></c:if>
											
											</c:forEach>
											<input type="hidden" id="address_ok" name="address_ok" />
											<p id="userAdress_chk"></p>
											<input type="hidden" id="user_address" name="m_Address" value=0 />
											</div>
											
											<input type="hidden" id="adress_last_ok" value=0 />
											<button type="button" id="address_btn">우편번호 검색</button>
										</td>    
							        </tr>
							    </table>
							    <div class="btn-group"> 
									<button class="btn btn-primary" id="btn-update" type="submit">수정하기</button>
									<button class="btn btn-primary" id="btn-back" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage/memberMypage.do?m_No=${member.m_No}'">돌아가기</button>
                       			</div> 
							    </form>
								
		                       			
		                       	<script>
								var key;
						
								// 닉네임 입력 텍스트칸 중복 확인
								$('#userNick').keyup(function(e) {
						
													var userNick = $(this).val();

													if (userNick.length > 2) {

														if(userNick == '${member.m_Nick}') {
															$('#userNick_chk').html('사용 가능한 닉네임 입니다.');
															$('#userNick_chk').css('color', 'green');
															$('#Nick_ok').val(1);
														} else {
														$.ajax({
																	url : "${pageContext.request.contextPath}/member/nickChk.do",
																	data : { userNick : userNick },
																	dataType : "json",
																	success : function(data) {
																		if (data.isUsable == true) {
																			$('#userNick_chk').html('사용 가능한 닉네임 입니다.');
																			$('#userNick_chk').css('color', 'green');
																			$('#Nick_ok').val(1);
																		} else {
																			$('#userNick_chk').html('사용중인 닉네임 입니다. 다시 입력해 주세요.');
																			$('#userNick_chk').css('color', 'red');
																			$('#Nick_ok').val(0);
																		}
																	},
																	error : function() {
																		console.log("ajax 처리 실패");
																	}
																});
														}
													} else if (userNick == '') {
						
														$('#userNick_chk').html('');
														$('#Nick_ok').val(0);
						
													} else {
						
														$('#userNick_chk').html('닉네임은 3글자 이상이여야 합니다.');
														$('#userNick_chk').css('color', 'red');
														$('#Nick_ok').val(0);
						
													}
						
												});
								// 주소 검색 버튼 클릭시 주소 입력
								$('#address_btn').click(function(e) {
													new daum.Postcode({
																oncomplete : function(data) {
																	
																	// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																	var addr = ''; // 주소 변수
																	var extraAddr = ''; // 참고항목 변수
						
																	//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																		addr = data.roadAddress;
																	} else { // 사용자가 지번 주소를 선택했을 경우(J)
																		addr = data.jibunAddress;
																	}
						
																	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
																	if (data.userSelectedType === 'R') {
																		// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																		// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																		if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
																			extraAddr += data.bname;
																		}
																		// 건물명이 있고, 공동주택일 경우 추가한다.
																		if (data.buildingName !== ''&& data.apartment === 'Y') {
																			extraAddr += (extraAddr !== '' ? ', '+ data.buildingName: data.buildingName);
																		}
																		// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																		if (extraAddr !== '') {
																			extraAddr = ' ('+ extraAddr + ')';
																		}
																	}
						
																	// 우편번호와 주소 정보를 해당 필드에 넣는다.
																	document.getElementById('userAddress_code').value = data.zonecode;
																	document.getElementById('userAddress').value = addr;
																	document.getElementById('address_ok').value = 1;
																	// 커서를 상세주소 필드로 이동한다.
																	document.getElementById('userAdress_final').focus();
																}
															}).open();
												});
						
								// 주소 상세 입력 칸 특수문자(!@#$%^&*/<>) 사용하지 못하게 막기
								$('#userAdress_final').keyup(
										function(e) {
						
											var reg_adress = /[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9\s]/g;
											var str_adress = $(this).val();
											var str_adress_space = str_adress.replace(/\s/g, '');
						
											if (reg_adress.test(str_adress)) {
						
												$(this).val(str_adress.replace(reg_adress, ''));
						
											} else if (str_adress_space.length > 3) {
						
												$('#userAdress_chk').html('');
												$('#adress_last_ok').val(1);
						
											} else if (str_adress == '') {
						
												$('#userAdress_chk').html('');
												$('#adress_last_ok').val(0);
						
											} else {
						
												$('#userAdress_chk').html('주소를 정확히 입력하지 않았습니다. 올바른 주소를 입력해 주세요.');
												$('#userAdress_chk').css('color', 'red');
												$('#adress_last_ok').val(0);
						
											}
										});
						
								// return true를 해주지 않으면 넘어가지 않음.
								function form_chk() {
						
								    if($("#Nick_ok").val()==0){
								        alert("사용가능한 닉네임을 입력해 주세요.");
								        $('#userNick').focus();
								        return false;
								        
									 } else if($("#address_ok").val()==0 && $("#adress_last_ok").val()==0){
						
								        alert("정확한 주소를 입력해 주세요!");
								        $('#userAdress_final').focus();
								        return false;
						
									} else{

										$('#phone_address').val($('#phone_first_text').val() + "-" + $('#phone_middle_text').val() + "-" + $('#phone_last_text').val());
								    	$('#user_address').val($('#userAddress_code').val() + "/" + $('#userAddress').val() + "/" + $('#userAdress_final').val());
								    
										return true;
									}
									
								}
							</script>
		
		                       			
                       		</div>
                        </div><!-- end page-wrapper -->
                      </div><!-- end col -->
                    </div>
                </div>
        </section>
<c:import url="../../common/footer.jsp"/>
</body>
</html>