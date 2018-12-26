<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강한남자912</title>
<jsp:include page="/jsp/comn/default-head.jsp" />

<style>
.board_insert a { text-decoration:none }
.board_insert a:hover { text-decoration:none !important }
</style>

<script type="text/javascript">
var out;
var addr = "${document.location.href}";
var addr1 = "${pageContext.request.contextPath }/MemOutController";
$(document).ready(function(){
	$('#editForm_go_btn').click(function(){
		$('#info_form').attr('action', "${pageContext.request.contextPath }/MemEditFormController");
		$('#info_form').submit(); 
	});
	$('#out_btn').click(function(){
		out = confirm("정말로 탈퇴하시겠습니까?");
		if(out == true) {
			location.replace(addr1);
		} else if(out == false) {
			location.replace(addr);
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
	                                            	<form action="#" id="info_form">
		                                                <h3>${info.type } 정보 페이지</h3>
		                                                <table class="table">
		                                                	<tr>
		                                                		<td class="title" style=" width: 101px; ">아이디</td>
		                                                		<td>${info.m.m_id }</td>
		                                                	</tr>
		                                                	<tr>
		                                                		<td class="title">이름</td>
		                                                		<td><c:out value="${info.m.m_name}"/> </td>
		                                                	</tr>
		                                                	<tr>
		                                                		<td class="title">이메일</td>
		                                                		<td>${info.m.m_email}</td>
		                                                	</tr>
		                                                	<tr>
		                                                		<td class="title">전화번호</td>
		                                                		<td>${info.m.m_phone}</td>
		                                                	</tr>
		                                                	<tr>
		                                                		<td class="title">주소</td>
		                                                		<td>(${info.m.m_postNum}) ${info.m.m_address}</td>
		                                                	</tr>
		                                                </table>
		                                                <div class="clearfix"></div>
		                                                <div class="board_insert" style="margin: 11px;background-color: black;margin-bottom: 35px;">
		                                                	<a href="#" id="editForm_go_btn">정보수정하기</a>
		                                                </div>
		                                                <!-- <a href="#" id="editForm_go_btn">정보수정하기</a> -->
		                                                <div class="board_insert" style="margin: 0px;background-color: black;">
		                                                	<a href="#" id="out_btn">탈퇴하기</a>
		                                                </div>
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

</html>


