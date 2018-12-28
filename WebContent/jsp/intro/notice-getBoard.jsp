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
	$('#edit').click(function(){
		$('#f').attr("action","${pageContext.request.contextPath}/GetNoticeController?num=${n.n_num }");
		$('#f').submit();
	});
	

	$('#delete').click(function(){
		$('#f').attr('action','${pageContext.request.contextPath}/NoticeDelController');
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
	                        <div class="row" style="padding-bottom: 72px;">
	                            <div class="col-sm-8">
	                                <div class="vc_column-brand">
	                                    <h4 class="title">상세보기</h4>
	                                </div>
	                                <div class="content_brand">
	                                    <form id="f" action="" method="post" class="form form-contact">
	                                    	<input type="hidden" name="num" value="${n.n_num}">
	                                    	<div class="input-field">
	                                            <label>제목</label>
	                                           	<input type="text" name="title" value="${n.n_title }" readonly>
	                                        </div>
	                                        <div class="input-field">
	                                            <label>작성자</label>
	                                           	<input type="text" name="writer" value="${n.n_writer }" readonly>
	                                        </div>
	                                        <div class="input-field">
	                                            <label>내용</label>
	                                           	<textarea style="resize: none;" name="content" readonly>${n.n_content }</textarea>
	                                        </div>
	                                        <div class="input-field">
	                                            <label>이미지</label>
	                                            <table border="1">
	                                            	<tr>
	                                            		<td><img class="notice-img" src="${pageContext.request.contextPath}/images/product/${n.n_img }" alt="member1" title="member1"></td>
	                                            	</tr>
	                                            </table>
	                                        </div>
	                                        <a href="${pageContext.request.contextPath }/NoticeListController" class="button-contact">목록</a>
	                                        <c:if test="${sessionScope.m_id eq 'admin' }">
	                                        	<a href="#" class="button-contact" id="edit">수정</a>
	                                        	<a href="#" class="button-contact" id="delete">삭제</a>
	                                        </c:if>
	                                    </form>
	                                </div>
	                            </div>
	                            <div class="col-sm-4">
	                                <div class="vc_column-content_brand">
	                                    <div class="vc_column-brand">
	                                    </div>
	                                    <div class="separator"></div>
	                                    <div class="content_brand">
	                                        <div class="support-icon">
	                                            <span>날짜</span>
	                                        </div>
	                                        <div class="support-icon"><span>조회</span> : ${n.n_hits }</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / MAP -->
                    </div>
                </div>
            </div>
	    </section>		
		
		<!-- 푸터 -->
		<jsp:include page="/jsp/comn/default-footer.jsp" />
	</div>
</body>
</html>