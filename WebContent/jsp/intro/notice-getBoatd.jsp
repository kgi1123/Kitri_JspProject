<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강한남자912</title>

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
	                                    <h3 class="title">공지사항 상세보기</h3>
	                                </div>
	                                <div class="content_brand">
	                                    <form action="" method="post" class="form form-contact">
	                                        <div class="input-field">
	                                            <label>작성자</label>
	                                           	관리자
	                                        </div>
	                                        <div class="input-field">
	                                            <label>제목</label>
	                                           	제목입니다요?
	                                        </div>
	                                        <div class="input-field">
	                                            <label>내용</label>
	                                           	내용입니다.
	                                        </div>
	                                        <div class="input-field">
	                                            <label>이미지</label>
	                                            <table border="1">
	                                            	<tr>
	                                            		<td><img class="notice-img" src="${pageContext.request.contextPath }/images/banner/member5.jpg" alt="member1" title="member1"></td>
	                                            	</tr>
	                                            </table>
	                                        </div>
	                                        <a href="${pageContext.request.contextPath }/jsp/intro/notice-list.jsp" class="button-contact">목록</a>
	                                        <a href="${pageContext.request.contextPath }/jsp/intro/notice-update.jsp" class="button-contact">수정</a>
	                                        <a href="#" class="button-contact">삭제</a>
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
	                                        <div class="support-icon"><span>조회</span> : 0</div>
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