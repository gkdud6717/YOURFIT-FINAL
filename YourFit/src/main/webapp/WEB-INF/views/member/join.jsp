<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
label {
	font-size: 16px;
	line-height: 35px;
}

.form-check-inline {
	height: 30px;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<div class="container">
		<form action="memberJoin.do" method="post" onsubmit="return form_chk();">
		
			<div class="col-12" style="text-align: center;">
				<br /> <br />
				<h1>회원 가입</h1>
				<br />
			</div>
	
			<div class="col-12">
				<hr />
				<br />
			</div>
	
			<!-- 아이디  -->
			<div class="row info">
	
				<div class="col-2 offset-2">
					<label class="col-form-label" for="userId">아이디</label>
				</div>
				<div class="col-4">
					<div class="form-group" id="id_success">
						<input type="text" class="form-control" id="userId" name="m_Id" aria-describedby="inputSuccess2Status" maxlength="15" required>
					</div>
					<p id="id_chk"></p>
					<input type="hidden" id="id_ok" value=0 />
				</div>
			</div>
	
			<!-- 비밀번호 -->
			<div class="row info">
				<div class="col-2 offset-2">
					<label for="userPwd" class="col-form-label">비밀번호</label>
				</div>
				<div class="col-4">
					<div class="form-group" id="pwd_success">
						<input type="password" class="form-control" id="userPwd" name="m_Pwd"
							aria-describedby="inputSuccess2Status" maxlength="15" required>
					</div>
					<p id="pwd_chk"></p>
					<input type="hidden" id="pw_ok" value=0 />
				</div>
			</div>
	
			<!-- 비밀번호 확인 -->
			<div class="row info">
				<div class="col-2 offset-2">
					<label for="userPwdChk" class="col-form-label">비밀번호 확인</label>
				</div>
				<div class="col-4">
					<div class="form-group" id="pwdChk_success">
						<input type="password" class="form-control" id="userPwdChk"
							aria-describedby="inputSuccess2Status" maxlength="15" required>
					</div>
					<p id="pwdChk_chk"></p>
					<input type="hidden" id="pwchk_ok" value=0 />
				</div>
			</div>
	
			<!-- 닉네임 -->
			<div class="row info">
				<div class="col-2 offset-2">
					<label for="userNick" class="col-form-label">닉네임</label>
				</div>
				<div class="col-4">
					<div class="form-group" id="userNick_success">
						<input type="text" class="form-control" id="userNick" name="m_Nick"
							aria-describedby="inputSuccess2Status" required>
					</div>
					<p id="userNick_chk"></p>
					<input type="hidden" id="Nick_ok" value=0 />
				</div>
			</div>
	
			<!-- 이름 -->
			<div class="row info">
				<div class="col-2 offset-2">
					<label for="userName" class="col-form-label">이름</label>
				</div>
				<div class="col-4">
					<div class="form-group" id="userName_success">
						<input type="text" class="form-control" id="userName" name="m_Name"
							aria-describedby="inputSuccess2Status" maxlength="15" required>
					</div>
					<p id="userName_chk"></p>
					<input type="hidden" id="name_ok" value=0 />
				</div>
			</div>
	
			<!-- 성별 -->
			<div class="row info">
				<div class="col-2 offset-2">
					<label for="userGender" class="col-form-label">성별</label>
				</div>
				<div class="col-4">
					<div class="col-12">
						<div class="row">
							<div class="col-6">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="m_Gender"
										id="gender_male" value="M" required> <label
										class="form-check-label" for="gender_male">남자</label>
								</div>
							</div>
							<div class="col-6">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="m_Gender"
										id="gender_female" value="F"> <label
										class="form-check-label" for="gender_female">여자</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 이메일 -->
			<div class="row info" id="email_area">
				<div class="col-2 offset-2">
					<label for="userEmail" class="col-form-label">이메일</label>
				</div>
				<div class="col-4" id="email">
					<div class="col-12">
						<div class="row">
							<div class="col-5" id="userEmail_div"
								style="margin: 0; padding: 0;">
								<input class="form-control" type="text" id="userEmail"
									maxlength="15" required> <input type="hidden"
									name="email_first_ok" id="email_first_ok" value="0" />
							</div>
							<div class="col-1" style="width: 50px; margin: 0; padding: 0;">
								<p style="font-size: 20px; height: 20px; width: 45px;" align="center">@</p>
							</div>
							<div id="userEmail_success">
								<input class="form-control" type="text" id="userEmail_final"
									maxlength="15" style="display: none;">
							</div>
							<div class="col-5" id="email_select_div" style="width: 160px;">
								<select class="form-control" id="email_select"
									style="width: 145px;" required>
									<option value="">선택</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="daum.com">daum.com</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="input">직접입력</option>
								</select>
							</div>
							<p id="userEmail_chk"></p>
							<input type="hidden" id="Email_address" name="m_Email" value=0 />
							<input type="hidden" id="email_last_ok" value=0 />
						</div>
					</div>
				</div>
				<div class="col-2">
					<button type="button" class="btn btn-light" id="emailchk_btn"
						disabled="disabled">인증메일 전송</button>
				</div>
			</div>
	
			<!-- 이메일 인증 코드 확인 -->
			<div class="row info" id="emailcode_area" style="display: none;">
				<div class="col-2 offset-2">
					<br />
				</div>
				<div class="col-3">
					<input class="form-control" type="text" id="email_code"
						maxlength="7">
				</div>
				<div class="col-3">
					<p id="EmailCode_chk"></p>
					<input type="hidden" id="email_Code_ok" value=0 />
				</div>
			</div>
	
			<!-- 휴대폰 -->
			<div class="row info">
				<div class="col-2 offset-2">
					<label for="userPhone" class="col-form-label">연락처</label>
				</div>
				<div class="col-4" id="phone">
					<div class="col-12">
						<div class="row">
							<div class="col-3" style="margin: 0; padding: 0; width: 100px;">
								<select class="form-control" id="phone_first_text" style="width: 100px;" required>
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="0130">0130</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<input type="hidden" id="phone1_ok" name="phone1_ok" />
							</div>
							<div class="col-1">
								<p style="font-size: 20px; height: 20px;">-</p>
							</div>
							<div class="col-3 phone" style="margin: 0; padding: 0; width: 100px;">
								<input class="form-control" type="text" id="phone_middle_text" maxlength="4" style="width: 100px;" required>
							</div>
							<div class="col-1">
								<p style="font-size: 20px; height: 20px;">-</p>
							</div>
							<div class="col-3" style="margin: 0; padding: 0; width: 100px;">
								<input class="form-control" type="text" id="phone_last_text" maxlength="4" style="width: 100px;" required>
							</div>
								<p  class="col-12" id="userPhone_chk"></p>
								<input type="hidden" id="phone_address" name="m_Phone" value=0 />
								<input type="hidden" id="phone2_ok" name="phone2_ok" />
						</div>
					</div>
				</div>
			</div>
	
			<!-- 주소 -->
			<div class="row info">
				<div class="col-2 offset-2">
					<label for="userHome" class="col-form-label">주소</label>
				</div>
	
				<div class="col-4">
					<input class="form-control" type="text" id="userAddress_code" readonly style="width: 160px; margin-bottom: 10px;">
					<input class="form-control" type="text" id="userAddress" readonly style="margin-bottom: 10px;">
					<input type="hidden" id="address_ok" name="address_ok" />
					<div class="form-group" id="userAdress_success">
						<input class="form-control" type="text" id="userAdress_final" required>
					</div>
					<p id="userAdress_chk"></p>
					<input type="hidden" id="user_address" name="m_Address" value=0 />
					<input type="hidden" id="adress_last_ok" value=0 />
				</div>
	
				<div class="col-2">
					<button type="button" class="btn btn-light" id="address_btn">검색</button>
				</div>
			</div>
	
			<div class="col-12">
				<hr />
			</div>
	
	
			<!-- 버튼 영역 -->
			<div class="row info">
				<div class="col-2 offset-4">
					<br />
					<button type="submit" class="btn btn-lg" id="submitbtn">회원가입</button>
					<br />
				</div>
				<div class="col-2">
					<br />
					<button type="reset" class="btn btn-lg" id="resetbtn">취소</button>
					<br />
				</div>
			</div>
			<br />
			<br />
			<br />
		</form>
	</div>

	<script>
		var key;

		// css 설정
		$('#resetbtn').css('width', $('#submitbtn').css('width'));
		$('#resetbtn, #emailchk_btn, #address_btn').css('background-color',
				'#edf1f2');
		$('#submitbtn').css('background-color', '#beecf7');

		// 아이디 입력 텍스트칸 숫자, 영어 외 입력 불가 설정
		$('#userId').keyup(function(e) {

							var reg_id_first = /[^a-zA-z]/g;
							var reg_id = /^[a-zA-z0-9]{5,15}$/;
							var str_id = $(this).val();

							if (reg_id_first.test(str_id.charAt(0))) {

								$('#id_chk').html('아이디 앞글자는 알파벳이여야 합니다.');
								$('#id_chk').css('color', 'red');
								$('#id_ok').val(0);

							} else if (reg_id.test(str_id)) {

								$.ajax({
											url : "${pageContext.request.contextPath}/member/idChk.do",
											data : { userId : str_id },
											dataType : "json",
											success : function(data) {
												if (data.isUsable == true) {
													$('#id_chk').html('사용 가능한 아이디 입니다.');
													$('#id_chk').css('color','green');
													$('#id_ok').val(1);
												} else {
													$('#id_chk').html('사용중인 아이디 입니다. <br> 다시 입력해 주세요.');
													$('#id_chk').css('color','red');
													$('#id_ok').val(0);
												}
											},
											error : function() {
												console.log("ajax 처리 실패");
											}
										});
							} else if (str_id == '') {
								
								$('#id_chk').html('');
								$('#id_ok').val(0);

							} else {

								$('#id_chk').html('아이디는 알파벳과 숫자로 구성되며 <br>5자 이상이여야 합니다.');
								$('#id_chk').css('color', 'red');
								$(this).val(str_id.replace(reg_id, ''));
								$('#id_ok').val(0);

							}
						});

		// 비밀번호 입력시 공백 허용 X
		$('#userPwd, #userPwdChk, #userEmail, #userNick').keydown(function(key) {
					if (key.keyCode == 32) {
						return false;
					}
				});

		// 비밀번호 입력 텍스트칸 숫자 1개, 영문 1개, 특수문자 1개가 들어가야 함.
		$('#userPwd').keyup(function(e) {

							var reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,15}$/g;
							var str_pwd = $(this).val();

							if (reg_pwd.test(str_pwd)) {

								$('#pwd_chk').html('');
								$('#pw_ok').val(1);

								if (str_pwd != $('#userPwdChk').val() && $('#userPwdChk').val() != '') {
									$('#pwdChk_chk').html('입력하신 비밀번호와 다릅니다.<br/> 비밀번호를 확인해 주세요.');
									$('#pwdChk_chk').css('color', 'red');
									$('#pwchk_ok').val(0);
								}

							} else if (str_pwd == '') {

								$('#pwd_chk').html('');
								$('#pw_ok').val(0);

								if ($('#userPwdChk').val() != '') {

									$('#pwdChk_chk').html('');
									$('#pwchk_ok').val(0);
								}

							} else {

								$('#pwd_chk').html('알파벳, 특수문자, 숫자가 1개 이상 포함하며,<br> 6자 이상으로 구성되어야 합니다.');
								$('#pwd_chk').css('color', 'red');
								$('#pw_ok').val(0);
							}
						});

		// 비밀번호 확인 텍스트칸 확인
		$('#userPwdChk').keyup(function(e) {

			var str_pwd = $('#userPwd').val();
			var str_pwdchk = $(this).val();

			if (str_pwd == str_pwdchk && str_pwd != '') {

				$('#pwdChk_chk').html('');
				$('#pwchk_ok').val(1);

			} else if (str_pwdchk == '') {

				$('#pwdChk_chk').html('');
				$('#pwchk_ok').val(0);

			} else {

				$('#pwdChk_chk').html('입력하신 비밀번호와 다릅니다.<br/> 비밀번호를 확인해 주세요.');
				$('#pwdChk_chk').css('color', 'red');
				$('#pwchk_ok').val(0);

			}
		});

		// 닉네임 입력 텍스트칸 중복 확인
		$('#userNick').keyup(function(e) {

							var userNick = $(this).val();

							if (userNick.length > 2) {

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

							} else if (userNick == '') {

								$('#userNick_chk').html('');
								$('#Nick_ok').val(0);

							} else {

								$('#userNick_chk').html('닉네임은 3글자 이상이여야 합니다.');
								$('#userNick_chk').css('color', 'red');
								$('#Nick_ok').val(0);

							}

						});

		// 이름 입력 텍스트칸 숫자, 특수문자 입력 안되게 설정
		$('#userName').keyup(function(e) {

			var reg_name = /[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z\s]/g;
			var str_name = $(this).val();
			var str_name_space = str_name.replace(/\s/g, '');

			if (reg_name.test(str_name)) {

				$(this).val(str_name.replace(reg_name, ''));

			} else if (str_name != '' && str_name_space.length < 2) {

				$('#userName_chk').html('이름은 띄어쓰기 제외 2글자 이상이여야 합니다.');
				$('#userName_chk').css('color', 'red');
				$('#name_ok').val(0);

			} else if (str_name == '') {

				$('#userName_chk').html('');
				$('#name_ok').val(0);

			} else {

				$('#userName_chk').html('');
				$('#name_ok').val(1);

			}
		});

		// 이메일 주소 직접 입력 선택시 텍스트 박스 출력
		$('#email_select').on('change',function() {

					if (this.value == 'input') {

						$('#email').removeClass('col-4');
						$('#email').addClass('col-6');
						$('#userEmail_div').removeClass('col-5');
						$('#userEmail_div').addClass('col-3');
						$('#email_select_div').removeClass('col-5');
						$('#email_select_div').addClass('col-4');
						$('#email_select_div').css('width', '180px;')
						$('#email_select').css('width', '155px;')
						$('#userEmail_success').addClass('col-4');
						$('#userEmail_final').css('display', 'block');
						$('#emailchk_btn').attr('disabled', true);

					} else if (this.value != 'input' && this.value != '' && $('#email_first_ok').val() == 1) {

						$('#email').removeClass('col-6');
						$('#email').addClass('col-4');
						$('#userEmail_div').removeClass('col-3');
						$('#userEmail_div').addClass('col-5');
						$('#email_select_div').removeClass('col-4');
						$('#email_select_div').addClass('col-5');
						$('#email_select_div').css('width', '160px;')
						$('#email_select').css('width', '145px;')
						$('#userEmail_success').removeClass('col-4');
						$('#userEmail_final').css('display', 'none');

						$('#userEmail_chk').html('');
						$('#userEmail_final').val('');
						$('#email_last_ok').val(0);

						$('#emailchk_btn').attr('disabled', false);

					} else {

						$('#email').removeClass('col-6');
						$('#email').addClass('col-4');
						$('#userEmail_div').removeClass('col-3');
						$('#userEmail_div').addClass('col-5');
						$('#email_select_div').removeClass('col-4');
						$('#email_select_div').addClass('col-5');
						$('#email_select_div').css('width', '160px;')
						$('#email_select').css('width', '145px;')
						$('#userEmail_success').removeClass('col-4');
						$('#userEmail_final').css('display', 'none');

						$('#userEmail_chk').html('');
						$('#userEmail_final').val('');
						$('#email_last_ok').val(0);
						$('#emailchk_btn').attr('disabled', true);
					}

				});

		// 이메일 주소입력 텍스트칸 빈칸 및 특수문자 제외
		$('#userEmail').keyup(function(e) {

			var reg_email = /[^a-zA-Z0-9]/g;
			var email_first = $(this).val();

			if (reg_email.test(email_first)) {

				$(this).val(email_first.replace(reg_email, ''));
				$('#userEmail_chk').html('');

			} else if (email_first.length > 2) {
				$('#userEmail_chk').html('');
				$('#email_first_ok').val(1);
			} else {
				$('#userEmail_chk').html('정확하게 입력해 주세요.');
				$('#userEmail_chk').css('color', 'red');
				$('#email_first_ok').val(0);
			}
		});

		$('#userEmail_final').keyup(function(e) {

			var reg_ex = /^[0-9a-zA-Z]{3,7}.[a-zA-Z]{2,3}$/;
			var reg_email_final = /[^a-zA-Z0-9.]/g;
			var email_final = $(this).val();

			if (reg_email_final.test(email_final)) {

				$(this).val(email_final.replace(reg_email_final, ''));

			} else if (reg_ex.test(email_final)) {

				$('#userEmail_chk').html('');
				$('#email_last_ok').val(1);
				$('#emailchk_btn').attr('disabled', false);

			} else if (email_final == '') {

				$('#userEmail_chk').html('');
				$('#email_last_ok').val(0);
				$('#emailchk_btn').attr('disabled', true);

			} else {

				$('#userEmail_chk').html('올바르지 않은 이메일 형식입니다.');
				$('#userEmail_chk').css('color', 'red');
				$('#email_last_ok').val(0);
				$('#emailchk_btn').attr('disabled', true);
			}
		});

		// 인증메일 전송 버튼 클릭시 인증 코드 보내기 및 인증코드 입력창 활성화
		$('#emailchk_btn').click(function(e) {

							$('#emailcode_area').css('display', '');
							$('#email_area').css('height', '64px');
							$('#emailcode_area').css('height', '64px');

							if ($('#email_select').val() != ''
									&& $('#email_select').val() != 'input') {

								var userEmail = $('#userEmail').val() + "@"
										+ $('#email_select').val();

							} else {

								var userEmail = $('#userEmail').val() + "@"	+ $('#userEmail_final').val();
							}

							$.ajax({
										type : 'post',
										url : '${pageContext.request.contextPath}/member/CheckMail.do',
										data : { mail : userEmail },
										dataType : 'json',
										success : function(data) {
											key = data;
										}
									});

							alert('인증 메일을 전송했습니다. 인증 코드를 입력해 주세요!');
							$('#email_code').focus();

						});

		$('#email_code').keyup(function(e) {

			var key_value;

			$.each(key, function(key, value) {

				key_value = value;
			});

			if ($(this).val() == key_value) {

				$('#EmailCode_chk').html("인증 성공");
				$('#EmailCode_chk').css("color", 'green');
				$('#email_Code_ok').val(1);
				$('#Email_address').val($('#userEmail').val() + "@" + $('#email_select').val());
				
				// 이메일 인증 뒤 수정할수 없게 이메일 모든 항목을 비활성화
				$('#emailchk_btn').attr('disabled', true);
				$('#email_code').attr('disabled', true);
				$('#userEmail').attr('disabled', true);
				$('#email_select').attr('disabled', true);
				$('#userEmail_final').attr('disabled', true);

			} else {

				$('#EmailCode_chk').html('인증 실패');
				$('#EmailCode_chk').css('color', 'red');
				$('#email_Code_ok').val(0);

			}

		});


		// 핸드폰 번호 선택 값 확인
		$('#phone_first_text').on('change',function() {

			if (this.value != ''){
				$('#phone1_ok').val(1);
			} else{
				$('#phone1_ok').val(0);
			}
		});

		
		// 핸드폰 번호 입력 텍스트칸 숫자만 입력받게 설정
		$('#phone_middle_text, #phone_last_text').keyup(function(e) {

			var reg_phone = /[^0-9]/g;
			var str_phone = $(this).val();
			var phone_num = $('#phone_middle_text').val()+$('#phone_last_text').val();
			var phone_all_num = $('#phone_first_text').val() + "-" + $('#phone_middle_text').val() + "-" + $('#phone_last_text').val();
			
			if (reg_phone.test(str_phone)) {
				
				$(this).val(str_phone.replace(reg_phone, ''));
				
			} else if(phone_num.length>6 && $('#phone1_ok').val() != 1){
				
				$('#userPhone_chk').html('연락처 첫번째 자리를 선택해 주세요.');
				$('#userPhone_chk').css('color', 'red');
				$('#phone2_ok').val(0);
				
			} else if(phone_num.length>6 && $('#phone1_ok').val() == 1){
				
				$.ajax({
					url : "${pageContext.request.contextPath}/member/phoneChk.do",
					data : { userPhone : phone_all_num },
					dataType : "json",
					success : function(data) {
						if (data.isUsable == true) {
							$('#userPhone_chk').html('사용 가능한 연락처 입니다.');
							$('#userPhone_chk').css('color', 'green');
							$('#phone2_ok').val(1);
						} else {
							$('#userPhone_chk').html('사용중인 연락처 입니다.<br> 아이디 찾기를 진행 해 주세요');
							$('#userPhone_chk').css('color', 'red');
							$('#phone2_ok').val(0);
						}
					},
					error : function() {
						console.log("ajax 처리 실패");
					}
				});
			} else{
				$('#userPhone_chk').html('올바른 연락처를 입력해 주세요.');
				$('#userPhone_chk').css('color', 'red');
				$('#phone2_ok').val(0);
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

						$('#userAdress_chk').html('주소를 정확히 입력하지 않았습니다. <br> 올바른 주소를 입력해 주세요.');
						$('#userAdress_chk').css('color', 'red');
						$('#adress_last_ok').val(0);

					}
				});

		// return true를 해주지 않으면 넘어가지 않음.
		function form_chk() {

		    if($("#id_ok").val()==0){

		        alert("사용가능한 아이디를 입력해주세요.");
		        $('#userId').focus();
		        return false;

		    } else if($("#pw_ok").val()==0){

		        alert("사용가능한 비밀번호를 입력해주세요.");
		        $('#userPwd').focus();
		        return false;

			} else if($("#pwchk_ok").val()==0){

			    alert("입력된 비밀번호와 비밀번호 확인 값이 다릅니다.\n 확인해 주세요.");
		        $('#userPwdChk').focus();
		        return false;
		        
			} else if($("#Nick_ok").val()==0){
				
		        alert("사용가능한 닉네임을 입력해 주세요.");
		        $('#userNick').focus();
		        return false;
		        
			} else if($("#Nick_ok").val()==0){

		        alert("이름을 정확히 입력해 주세요!");
		        $('#name_ok').focus();
		        return false;
		        
			} else if($("#email_Code_ok").val()==0){

		        alert("이메일 인증을 진행해 주세요!");
		        $('#userEmail').focus();
		        return false;
		        
			} else if($("#phone1_ok").val()==0){

		        alert("핸드폰 앞번호를 선택해 주세요!");
		        $('#phone_first_text').focus();
		        return false;

			} else if($("#phone2_ok").val()==0){

		        alert("사용가능한 연락처를 입력해 주세요!");
		        $('#phone_middle_text').focus();
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


	<c:import url="../common/footer.jsp" />
</body>
</html>
