<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강한남자912</title>
<jsp:include page="/jsp/comn/default-head.jsp" />
<script type="text/javascript">
var signPassword;
var signPasswordcheck;

var sign_btn_check;
var signId;
var signName;
var signTel;
var signAddress;
var signAddress1;
var signAddress2;
var signEmail;


$(document).ready(function(){
	$('#signPasswordcheck').change(function(){
		signPassword = $('#signPassword').val();
	    signPasswordcheck = $('#signPasswordcheck').val();
	    if(signPassword == "" || signPasswordcheck == "") {
	        $('#checkPwdMsg').html('');
	    } else {
	    	if(signPassword == signPasswordcheck) {
	        	$('#checkPwdMsg').html('<b style="font-size:14px;color:blue">비밀번호가 일치합니다.</b>');
	        	
	        } else {
	        	$('#checkPwdMsg').html('<b style="font-size:14px;color:red">비밀번호가 일치하지 않습니다.</b>');
	        	
	    	}
		}
	});
	
	$('#edit_submit_btn').click(function(){
		signId = $('#signId').val();
		signPassword = $('#signPassword').val();
		signPasswordcheck = $('#signPasswordcheck').val();
		signTel = $('#signTel').val();
		signAddress = $('#signAddress').val();
		signAddress1 = $('#signAddress1').val();
		signAddress2 = $('#signAddress2').val();
		signEmail = $('#signEmail').val();
		if(signId == "" || signPassword =="" || signPasswordcheck == "" || signTel == "" || signAddress == "" || signAddress1 == "" || signAddress2 == "" || signEmail == "") {
			alert("값을 입력해주세요");
		} else {
			if(signPassword == signPasswordcheck) {
	            $('#edit_form').submit();
	            alert("정보를 수정하였습니다.");
	         } else {
	            $('#signPassword').val("");
	            $('#signPasswordcheck').val("");
	            alert("패스워드가 일치하지 않습니다.");         
	         }
		}
	});
	
});
</script>

</head>
<body>
	<div class="wrapper wrapper_v3 wrapper_blog_listing_left_sidebar">
	
		<!-- 헤더 -->
		<jsp:include page="/jsp/comn/default-header.jsp" />
		 
		 <section>
			 <div class="main_content">
				 <div class="container-full">
				 
				 	<!-- 로그인 배너 -->
					<jsp:include page="/jsp/login/login-banner.jsp" />
				 	<div class="container-full">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-3 hidden-sm hidden-xs"></div>
	                            <div class="col-md-6">
	                                <div class="wrap_login">
	                                    <div class="tab-v8">
	                                        <div class="tab-content">
	                                            <div class="tab-pane fade active in" id="tab-v8-1">
	                                            	<form action="${pageContext.request.contextPath }/MemEditController" id="edit_form">
		                                                <h3>정보수정 페이지</h3>
		                                              	
		                                              	<input type="text" class="form-control" id="signId" name="signId" placeholder="아이디" value="${m_id }" readonly>
		                                                <input type="password" class="form-control" id="signPassword" name="signPassword" placeholder="비밀번호" value="${info.m.m_name}">
		                                                <div id="checkPwdMsg"></div>
		                                                <input type="password" class="form-control" id="signPasswordcheck" placeholder="비밀번호 체크">
		                                                <input type="text" class="form-control" id="signEmail" name="signEmail" placeholder="이메일" value="${info.m.m_email}">
		                                                <input type="text" class="form-control" id="signTel" name="signTel" placeholder="전화번호" value="${info.m.m_phone}">
		                                                <div style="width:100%">
		                                                <input type="text" class="form-control" id="signAddress" name="signAddress" value="${info.m.m_postNum}" placeholder="우편번호" style="width:30%;float:left">
		                                                <input type="button" style="width:110px;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		                                                </div>
		                                                <input type="text" class="form-control" id="signAddress1" name="signAddress1" value="${info.address1 }" placeholder="도로명주소">
		                                                <input type="text" class="form-control" id="signAddress2" name="signAddress2" value="${info.address2 }" placeholder="상세주소">
														<div class="clearfix"></div>
		                                                <div class="login_submit"><a href="#" id="edit_submit_btn">Confirm</a></div>
													</form>	                                                
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-3 hidden-sm hidden-xs"></div>
	                        </div>
	                    </div>
	                </div>
				 </div>
			 </div>
		 </section>
		 
		 <!-- 푸터 -->
		<jsp:include page="/jsp/comn/default-footer.jsp" />
	</div>
</body>

<!-- 도로명API -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('signAddress').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signAddress1').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address').focus();
            }
        }).open();
    }
</script>

</html>


