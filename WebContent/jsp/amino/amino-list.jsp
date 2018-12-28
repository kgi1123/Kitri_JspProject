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
	<div class="wrapper wrapper_v3 wrapper_blog_listing_left_sidebar">
	
		<!-- 헤더 -->
		<jsp:include page="/jsp/comn/default-header.jsp" />
		
		<!-- 내용 -->
		<section>
	        <div class="main_content">
	            <div class="container-full">
	            
	            	<!-- 배너 -->
	                <jsp:include page="/jsp/amino/amino-banner.jsp" />
	                <div class="container-full">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-3">
	                                <div class="content_sidebar content_sidebar_grid">
	                                    <div class="sidebar_default category_grid">
	                                        <div class="title_default">categories</div>
	                                        <ul class="category_sidebar_grid">
	                                            <li><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=2&p_cate2=4"><span class="text">BCAA</span></a></li>
	                                            <li><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=2&p_cate2=5"><span class="text">복합 아미노산</span></a></li>
	                                            <li><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=2&p_cate2=6"><span class="text">EAA</span></a></li>
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-9">
	                                <div class="content_categories_grid_sidebar_left content_categories_grid_full_width">
	                                    <div class="categories_grid_sidebar_left categories_grid_full_width">
	                                        <div class="choose_result">
	                                            <div class="row">
	                                                <div class="col-md-5">
	                                                    <div class="result_categories">
	                                                        <h3 class="result">show all 11 results</h3>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-4 hidden-xs">
	                                                    <div class="select_sorting">
	                                                        <select id="gender1">
	                                                            <option value="0" selected="selected">등록순</option>
	                                                            <option value="1">별점순</option>
	                                                            <option value="2">리뷰많은순</option>
	                                                            <option value="3">가격낮은순</option>
	                                                            <option value="4">가격높은순</option>
	                                                        </select>
	                                                    </div>
	                                                </div>
	                                                <div class="col-md-3">
	                                                    <div class="view-mode hidden-xs hidden-sm">
	                                                        <span class="grid-mode active" title="Grid"><i class="fa fa-th-large"></i></span>
	                                                        <span class="list-mode" title="List"><i class="fa fa-bars"></i></span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="products products_list">
	                                            <div class="distance">
	                                                <div class="row fix_header">
	                                                	<c:forEach var="i" items="${list }">
		                                                    <div class="col-md-4 col-sm-6 col-xs-6 col-mb-12">
		                                                        <div class="product_wrap blog blog_list">
		                                                            <div class="product">
		                                                                <a href="${pageContext.request.contextPath }/ProductViewController?num=${i.p_num }&cate1=2" class="product">
		                                                                   	<div class="product-loop-front">
		                                                                        <img src="${pageContext.request.contextPath }/images/product/${i.p_img1}" alt="" class="img-responsive img_product">
		                                                                    </div>
		                                                                    <div class="product-loop-back">
		                                                                        <img src="${pageContext.request.contextPath }/images/product/${i.p_img1}" alt="" class="img-responsive img_product">
		                                                                    </div>
		                                                                </a>
		                                                            </div>
		                                                            <div class="caption">
		                                                                <div class="tittle_product">
		                                                                    <a href="${pageContext.request.contextPath }/ProductViewController?num=${i.p_num }&cate1=2">${i.p_name}</a>
		                                                                </div>
		                                                                <div class="notable pro_list">
		                                                                    <i class="fa fa-star" aria-hidden="true"></i>
		                                                                    <i class="fa fa-star" aria-hidden="true"></i>
		                                                                    <i class="fa fa-star" aria-hidden="true"></i>
		                                                                    <i class="fa fa-star" aria-hidden="true"></i>
		                                                                    <i class="fa fa-star-half-o" aria-hidden="true"></i>
		                                                                    (05)
		                                                                </div>
		                                                                <div class="price">
		                                                                    <span class="price_new">&#8361;${i.p_price}</span>
		                                                                </div>
		                                                                <p class="note_pro pro_list">${i.p_contents }</p>
		                                                                <div class="cart">
		                                                                    <a href="${pageContext.request.contextPath }/ProductViewController?num=${i.p_num }&cate1=2">상세보기</a>
		                                                                </div>
		                                                            </div>
		                                                        </div>
		                                                    </div>
	                                                    </c:forEach>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <ul class="pagination pagination_grid_sidebar">
	                                        <li><a href="#"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
	                                        <li class="active"><a href="#">1</a></li>
	                                        <li><a href="#">2</a></li>
	                                        <li class="more_pagination"><span>...</span></li>
	                                        <li><a href="#">4</a></li>
	                                        <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
	                                    </ul>
	                                </div>
	                            </div> //a
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