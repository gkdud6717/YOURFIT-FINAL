<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>로그인</title>
<style>
	#id_area, #pwd_area{
		height: 75px;
	}
	
	#find_info{
		height: 50px;
	}
	
	#login_text{
		text-align: center;
	}
	
	#id_label, #pwd_label{
		line-height: 35px;
		font-size: 20px;
	}
	
	#find_info{
		text-align: right;
	}
	
</style>
</head>
<body>

	<c:import url="../common/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-12" id="login_area">
				<form class="form-signin" action="${pageContext.request.contextPath}/member/login_action.do" method="post">
					<h1 class="h1 font-weight-normal" id="login_text"><br />로그인<br /><br /></h1>
					<div class="col-6 offset-3" id="id_area">
						<div class="row">
							<div class="col-4">					
								<label for="userId" id="id_label">ID : </label>
							</div>
							<div class="col-8">
								<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력해 주세요" required autofocus>
							</div>
						</div>
					</div>
					<div class="col-6 offset-3" id="pwd_area">
						<div class="row">
							<div class="col-4">
								<label for="userPwd" id="pwd_label">Password : </label>
							</div>
							<div class="col-8">
								<input type="password"  name="userPwd" id="userPwd" class="form-control" placeholder="비밀번호를 입력해 주세요" required>
							</div>
						</div>
					</div>
						<div class="col-6 offset-3" id="find_info">
							<a href="#" onclick="openWin('id_Find');">아이디 찾기</a> | <a href="#" onclick="openWin('pw_Find');">비밀번호 찾기</a>
						</div>
					
						<div class="col-4 offset-4" id="btn_area">
							<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
						<br><br><br><br>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:import url="../common/footer.jsp" />

</body>
	<script>
		function openWin(page_info){
			
			var url = "${pageContext.request.contextPath}/member/page_move.do?" + page_info;

			window.open(url,'_blank','menubar=no');
			
		};

		
	</script>
</html>