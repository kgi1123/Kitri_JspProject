<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강한남자912</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.js"></script>
<!-- 헤드 -->
<jsp:include page="/jsp/comn/default-head.jsp" />
</head>
<body>
	<div class="wrapper wrapper_v3">
	
		<!-- 헤더 -->
		<jsp:include page="/jsp/comn/default-header.jsp" />
		<section>
	        <div class="main_content">
	            <div class="container-full">
	            	
	            	<!-- 헤더 -->
	                <jsp:include page="/jsp/intro/notice-banner.jsp" />
	                <div class="container">
	                    <div class="blog_content default">
	                        <div class="row">
	                        <c:forEach var="i" items="${list }">
	                            <article  class="col-md-4 col-sm-6 clearfix">
	                            	<div class="hentry-wrap">
	                                    <div class="entry-info">
	                                        <div class="entry-header">
	                                            <h2 class="entry-title" data-itemprop="name">
	                                                <a href="${pageContext.request.contextPath }/NoticeViewController?num=${i.n_num }">${i.n_title }</a>
	                                            </h2>
	                                            <div class="entry-meta icon-meta text-uppercase">
	                                                <span class="meta-author">
	                                                    <a href="" title="LOGAN CEE" rel="author">${i.n_writer }</a>
	                                                </span>
	                                                <span class="meta-separator"></span>
	                                                <span class="meta-date">
	                                                    <time datetime="2015-10-21T08:24:51+00:00" data-itemprop="dateCreated">${i.n_date }</time>
	                                                </span>
	                                            </div>
	                                        </div>
	                                        <div class="entry-content">
	                                           	${i.n_content }
	                                        </div>
	                                        <div class="readmore-link">
	                                            <a href="${pageContext.request.contextPath }/NoticeViewController?num=${i.n_num }">상세보기</a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </article>
	                            </c:forEach>
	                                
	                        </div>
	                        <c:if test="${sessionScope.m_id eq 'admin' }">
		                        <div class="pagination_grid" style="padding:10px">
		                        	<a href="${pageContext.request.contextPath }/jsp/intro/notice-add.jsp" class="board_insert">글작성</a>
		                        </div>
	                        </c:if>
	                        <div class="pagination_grid">
	                            <ul class="pager">
	                                <li class="previous click"><a href="#"><span>Prev</span></a></li>
	                                <li class="active hidden-xs"><a href="#">1</a></li>
	                                <li class="hidden-xs"><a href="#">2</a></li>
	                                <li class="hidden-xs"><a href="#">3</a></li>
	                                <li class="hidden-xs"><a href="#">4</a></li>
	                                <li class="hidden-xs"><a href="#">5</a></li>
	                                <li class="next click"><a href="#"><span>Next</span></a></li>
	                            </ul>
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