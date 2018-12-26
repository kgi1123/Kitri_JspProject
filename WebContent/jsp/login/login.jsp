<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="member.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강한남자912</title>
<jsp:include page="/jsp/comn/default-head.jsp" />
<style>
	#checkIdMsg {font-size:12px;}
	/* #checkPwdMsg {color:red;font-size:12px;} */
</style>
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->
<!-- <script src="/strong912/js/signCheck.js" charset="utf-8"></script> -->
<script type="text/javascript">
var check;
var pwd1;
var pwd2;

var sign_btn_check;
var signId;
var signPassword;
var signName;
var signTel;
var signAddress;
var signAddress1;
var signAddress2;
var signEmail;
var grant;
$(document).ready(function(){
	
	sign_btn_check = getParameterByName('sign');
	//회원가입페이지 체크
	if(sign_btn_check == 1) {
	   $('.login').removeClass('active');
	   $('.register').addClass('active');
	   
	   $('#tab-v8-1').removeClass('active').removeClass('in');
	   $('#tab-v8-2').addClass('active').addClass('in');
	}
	
	$('#signId').blur(function(){
		$.ajax({
			type:"post",
			url:"/strong912/MemberCheckController",
			data:{
				"signId":$('#signId').val()
			},
			success:function(data) {
				if($.trim(data) == "YES") {
					$('#checkIdMsg').html('<b style="font-size:14px;color:blue">사용 가능한 아이디입니다.</b>');
					check=true;
				} else if($.trim(data) == "NO") {
					$('#checkIdMsg').html('<b style="font-size:14px;color:red">중복된 아이디입니다.</b>');
					check=false;
				} else {
					$('#checkIdMsg').html('<b style="font-size:14px;color:red">아이디를 입력해주세요.</b>');
					check=false;
				}
			}
		});
	});
	
	//패스워드 일치 체크
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

	
	$('#login_submit_btn').click(function(){
		$('#login_form').submit();
	});
	
	$('#join_submit_btn').click(function(){
		signId = $('#signId').val();
		signPassword = $('#signPassword').val();
		signPasswordcheck = $('#signPasswordcheck').val();
		signName = $('#signName').val();
		signTel = $('#signTel').val();
		signAddress = $('#signAddress').val();
		signAddress1 = $('#signAddress1').val();
		signAddress2 = $('#signAddress2').val();
		signEmail = $('#signEmail').val();
		grant = $('#grant').val();
		if(signId == "" || signPassword =="" || signPasswordcheck == "" || signName == "" || signTel == "" || signAddress == "" || signAddress1 == "" || signAddress2 == "" || signEmail == "" || grant == "") {
			alert("값을 입력해주세요");
		} else {
			if(signPassword == signPasswordcheck) {
	            if(check){
	               $('#join_form').submit();
	            } else {
	               alert('사용가능한 아이디를 입력해주세요.');
	            }
	         } else {
	            $('#signPassword').val("");
	            $('#signPasswordcheck').val("");
	            alert("패스워드가 일치하지 않습니다.");
	            
	         }
		}		
	});
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
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
	                                        <div class="nav-inner header_featured_pr wow fadeInUp">
	                                            <ul class="login_register" role="tablist">
	                                                <li class="login active">
	                                                    <a href="#tab-v8-1" role="tab" data-toggle="tab" aria-expanded="false">Login</a>
	                                                </li>
	                                                <li class="register">
	                                                    <a href="#tab-v8-2" role="tab" data-toggle="tab" aria-expanded="true">Register</a>
	                                                </li>
	                                            </ul>
	                                        </div>
	                                        <div class="tab-content">
	                                            <div class="tab-pane fade active in" id="tab-v8-1">
	                                            	<form action="${pageContext.request.contextPath }/MemLoginController" id="login_form" method="post">
		                                                <h3>로그인 페이지</h3>
		                                                <input type="text" class="form-control" id="id" name="m_id" placeholder="아이디">
		                                                <input type="password" class="form-control" id="password" name="m_pwd" placeholder="비밀번호">
		                                                <div class="help_password">
		                                                    <div class="checkbox checkbox_acount check_password">
		                                                        <input type="checkbox" value="yes" name="ship_address" id="logged_in">
		                                                        <label for="logged_in">로그인 상태 유지</label>
		                                                    </div>
		                                                    <a href="" class="forgot_password">비밀번호찾기</a>
		                                                </div>
		                                                <div class="clearfix"></div>
		                                                <div class="login_submit"><a href="#" id="login_submit_btn">Login</a></div>
		                                                <h3 class="login_with_social">OTHER</h3>
		                                                <ul class="your_social">
		                                                    <li class=""><a href="" class="color-blue"><span aria-hidden="true" class="social_facebook"></span><span class="text_social">facebook</span></a></li>
		                                                </ul>
													</form>	                                                
	                                            </div>
	                                            <div class="tab-pane fade" id="tab-v8-2">
		                                            <form action="${pageContext.request.contextPath }/MemJoinController" id="join_form" name=join method="post">
		                                                <h3>회원가입 페이지</h3>
		                                                <div id="checkIdMsg"> </div>
		                                                <input type="text" class="form-control" id="signId" name="signId" placeholder="아이디">
		                                                <input type="password" class="form-control" id="signPassword" name="signPassword" placeholder="비밀번호">
		                                                <div id="checkPwdMsg"> </div>
		                                                <input type="password" class="form-control" id="signPasswordcheck" name="signPasswordcheck" placeholder="비밀번호 체크">
		                                                <input type="text" class="form-control" id="signName" name="signName" placeholder="이름">
		                                                <input type="text" class="form-control" id="signTel" name="signTel" placeholder="전화번호">
		                                                <div style="width:100%">
		                                                <input type="text" class="form-control" id="signAddress" name="signAddress" placeholder="우편번호" style="width:30%;float:left">
		                                                <input type="button" style="width:110px;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		                                                </div>
		                                                <input type="text" class="form-control" id="signAddress1" name="signAddress1" placeholder="도로명주소">
		                                                <input type="text" class="form-control" id="signAddress2" name="signAddress2" placeholder="상세주소">
		                                                <input type="text" class="form-control" id="signEmail" name="signEmail" placeholder="이메일">
														<div>
	                                                	<label>
	                                                        <input type="radio" name="grant" value="2" style=" width: 17px; height: 17px; line-height: 17px; font-size: 11px; color: white; ">
	                                                        	판매자
	                                                       
                                                        </label>
                                                        <label>
	                                                        <input type="radio" name="grant" value="3" style=" width: 17px; height: 17px; line-height: 17px; font-size: 11px; color: white; ">
	                                                        	일반회원(구매자)
                                                        </label>
													</div>
														
														<div class="clearfix"></div>
		                                                <div class="login_submit"><a href="#" id="join_submit_btn">Register</a></div>
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


