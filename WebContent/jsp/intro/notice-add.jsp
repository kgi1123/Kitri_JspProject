<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강한남자912</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	$('#write').click(function(){
		$('#f').attr('action','${pageContext.request.contextPath }/NoticeAddController');
		$('#f').submit();
	});
	
});

</script>
<!-- 헤드 -->
<jsp:include page="/jsp/comn/default-head.jsp" />
</head>
<body>
	<div class="wrapper wrapper_v3">
	
		<!-- 헤더 -->
		<jsp:include page="/jsp/comn/default-header.jsp" />
		<section>
	        <div class="main_content contact-us">
	            <div class="container-full">
	            	<!-- 헤더 -->
	                <jsp:include page="/jsp/intro/notice-banner.jsp" />
	                
	                <div class="container">
	                    <div class="brand default">
	                        <div class="row">
	                            <div class="col-sm-8">
	                                <div class="vc_column-brand">
	                                    <h3 class="title">추가하기</h3>
	                                </div>
	                                <div class="content_brand">
	                                    <form id="f" action="" method="post" class="form form-contact" enctype="multipart/form-data">
	                                        <div class="input-field">
	                                            <label>작성자</label>
	                                            <input type="text" value="admin" name="n_writer" readonly>
	                                        </div>
	                                        <div class="input-field">
	                                            <label>제목</label>
	                                           	<input type="text" name="n_title">
	                                        </div>
	                                        <div class="input-field">
	                                            <label>내용</label>
	                                           	<textarea style="resize: none;" name="n_content"></textarea>
	                                        </div>
	                                        <div class="input-field">
	                                            <label>이미지</label>
												<input type="file" name="n_img">

	                                        </div>
	                                        	<a href="${pageContext.request.contextPath }/NoticeListController" class="button-contact">목록</a>
	                                        	<a href="#" class="button-contact" id="write">작성</a>
	                                    </form>
	                                </div>
	                            </div>
	                            <div class="col-sm-4">
	                            </div>
	                        </div>
	                        <!-- END / MAP -->
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