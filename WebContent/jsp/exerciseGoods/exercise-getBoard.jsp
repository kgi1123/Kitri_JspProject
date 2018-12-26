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
	<div class="wrapper ver2">
	
		<!-- 헤더 -->
		<jsp:include page="/jsp/comn/default-header.jsp" />
		
		<!-- 내용 -->
		<section>
	        <div class="main_content">
	            <div class="container-full">
	            
	            	<!-- 배너 -->
	                <jsp:include page="/jsp/exerciseGoods/exercise-banner.jsp" />
	                <div class="container-full">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-6 space-details">
	                                <div class="product_detail product-img-box">
	                                    <div class="center slider-for slick-demo-popup" id="zoom_main">
	                                        <div class="item">
	                                            <a id="image-view" title="Product Image">
	                                                <img class="product_zoom" src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="Product"/>
	                                            </a>
	                                        </div>
	                                        <div class="item">
	                                            <a id="image-view" title="Product Image">
	                                                <img class="product_zoom" src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="Product"/>
	                                            </a>
	                                        </div>
	                                    </div>										
	                                    <!--End slider-for-->
	                                    <div class="product-thumb">
	                                        <div class="slider-nav thumb-content" id="zoom_gallery">
	                                            <a href="#" class="thumb elevatezoom-gallery" data-image="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" data-zoom-image="${pageContext.request.contextPath}/images/product_detail/pro1.jpg"><img src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="thumb product1"/></a>
	                                        	<a href="#" class="thumb elevatezoom-gallery" data-image="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" data-zoom-image="${pageContext.request.contextPath}/images/product_detail/pro1.jpg"><img src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="thumb product1"/></a>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-6">
	                                <div class="introduce_product">
	                                    <div class="tittle_product">
	                                        	물품명
	                                        <div class="next_prev">
	                                            <a href="" class="next"><span aria-hidden="true" class="arrow_carrot-left"></span></a>
	                                            <a href="" class="prev"><span aria-hidden="true" class="arrow_carrot-right"></span></a>
	                                        </div>
	                                    </div>
	                                    <div class="notable">
	                                        <span class="notable_star">
	                                            <i class="fa fa-star" aria-hidden="true"></i>
	                                            <i class="fa fa-star" aria-hidden="true"></i>
	                                            <i class="fa fa-star" aria-hidden="true"></i>
	                                            <i class="fa fa-star" aria-hidden="true"></i>
	                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
	                                        </span>
	                                        <span class="add_your_review">review(04) / 작성자</span>
	                                    </div>
	                                    <div class="price">
	                                        <span class="price_new">&#8361;125.30</span>
	                                    </div>
	                                    <div class="available">
	                                        <span class="title">조회수: </span>
	                                        <span class="in_stock">0</span>
	                                    </div>
	                                    <p class="note_pro">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc condimentum eros idoni rutrum fermentum. Proin nec felis dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae.</p>
	                                    <div class="wrap_cart">
	                                        <div class="quatity_pro">
	                                            <form enctype="multipart/form-data">
	                                                <div class="product-signle-options clearfix">
	                                                    <div class="selector-wrapper size">
	                                                        <div class="quantity">
	                                                            <input data-step="1" value="1" title="Qty" class="qty" size="4" type="text">
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </form>
	                                        </div>
	                                        <div class="buy_on_ebay">
	                                            <a href="#" onclick="goBasket(1)">장바구니 담기</a>
	                                        </div>
	                                        <div class="buy_on_ebay">
	                                            <a href="#" onclick="goBasket(2)">바로결제</a>
	                                        </div>
	                                    </div>
	                                    <div class="categories">
	                                        <p class="title">등록날짜</p>
	                                        <ul>
	                                            <li><a href="" class="">2018 10 19</a></li>
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="clearfix"></div>
	                        <div class="product_description">
	                            <div class="tab-v8">
	                                <div class="nav-inner header_pro_description">
	                                    <ul class="nav nav-tabs" role="tablist">
	                                        <li class="">
	                                            <a href="#tab-v8-1" role="tab" data-toggle="tab" aria-expanded="true">리뷰보기 (0)</a>
	                                        </li>
	                                    </ul>
	                                </div>
	                                <div class="tab-content">
	                                    <div class="tab-pane fade" id="tab-v8-1">
	                                        <div class="content_pro_description">
	                                            <div class="coupling">
	                                            	<div class="col-md-4 hidden-xs">
                                                    	<div class="select_sorting">
	                                                        <select id="gender1">
	                                                            <option value="0" selected="selected">Default sorting</option>
	                                                            <option value="1">Sort by popularity</option>
	                                                            <option value="2">Sort by average rating</option>
	                                                            <option value="3">Sort by newness</option>
	                                                            <option value="4">Sort by price: low to high</option>
	                                                            <option value="4">Sort by price: high to low</option>
	                                                        </select>
	                                                    </div>
	                                                </div>
	                                                <br />
                                               	<table>
                                               		<tr>
                                               			<td>별점</td>
                                               			<td>
	                                               			<span class="notable_star">
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
					                                        </span>
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td style=" width: 52px; ">아이디</td>
                                               			<td>
	                                               			박노율
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>내용</td>
                                               			<td>
	                                               			너무 좋아요
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>이미지</td>
                                               			<td>
	                                               			<img class="product_zoom" src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="Product" style=" width: 132px; height: 155px; "/>
				                                        	<div class="wishlist">
																<a href="javascript:void(0);" class="text-primary"><i aria-hidden="true" class="icon_heart"></i></a>(2)<hr>
					                                        </div>
				                                        </td>
                                               		</tr>
                                               	</table>
                                               	<table>
                                               		<tr>
                                               			<td>별점</td>
                                               			<td>
	                                               			<span class="notable_star">
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
					                                        </span>
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td style=" width: 52px; ">아이디</td>
                                               			<td>
	                                               			박노율
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>내용</td>
                                               			<td>
	                                               			너무 좋아요
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>이미지</td>
                                               			<td>
	                                               			<img class="product_zoom" src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="Product" style=" width: 132px; height: 155px; "/>
				                                        	<div class="wishlist">
																<a href="javascript:void(0);" class="text-primary"><i aria-hidden="true" class="icon_heart"></i></a>(2)<hr>
					                                        </div>
				                                        </td>
                                               		</tr>
                                               	</table>
                                               	<table>
                                               		<tr>
                                               			<td>별점</td>
                                               			<td>
	                                               			<span class="notable_star">
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
					                                        </span>
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td style=" width: 52px; ">아이디</td>
                                               			<td>
	                                               			박노율
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>내용</td>
                                               			<td>
	                                               			너무 좋아요
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>이미지</td>
                                               			<td>
	                                               			<img class="product_zoom" src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="Product" style=" width: 132px; height: 155px; "/>
				                                        	<div class="wishlist">
																<a href="javascript:void(0);" class="text-primary"><i aria-hidden="true" class="icon_heart"></i></a>(2)<hr>
					                                        </div>
				                                        </td>
                                               		</tr>
                                               	</table>
                                               	<table>
                                               		<tr>
                                               			<td>별점</td>
                                               			<td>
	                                               			<span class="notable_star">
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star" aria-hidden="true"></i>
					                                            <i class="fa fa-star-half-o" aria-hidden="true"></i>
					                                        </span>
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td style=" width: 52px; ">아이디</td>
                                               			<td>
	                                               			박노율
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>내용</td>
                                               			<td>
	                                               			너무 좋아요
				                                        </td>
                                               		</tr>
                                               		<tr>
                                               			<td>이미지</td>
                                               			<td>
	                                               			<img class="product_zoom" src="${pageContext.request.contextPath}/images/product_detail/pro1.jpg" alt="Product" style=" width: 132px; height: 155px; "/>
				                                        	<div class="wishlist">
																<a href="javascript:void(0);" class="text-primary"><i aria-hidden="true" class="icon_heart"></i></a>(2)<hr>
					                                        </div>
				                                        </td>
                                               		</tr>
                                               	</table>
	                                        </div>
	                                    </div>
	                                    <nav aria-label="Page navigation example">
	                                        <div class="content_categories_grid_sidebar_left content_categories_grid_full_width">
												<ul class="pagination pagination_grid_sidebar">
			                                        <li><a href="#"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
			                                        <li class="active"><a href="#">1</a></li>
			                                        <li><a href="#">2</a></li>
			                                        <li class="more_pagination"><span>...</span></li>
			                                        <li><a href="#">4</a></li>
			                                        <li><a href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
			                                    </ul>
											</div>					                                    
										</nav>
                                    </div>
	                                </div>
	                            </div>
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