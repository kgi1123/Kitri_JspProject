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
	            	<jsp:include page="/jsp/payment/shop-banner.jsp" />
	                <div class="container-full">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-md-6">
	                                <div class="check_out_left default_check_out">
	                                    <div class="billing-fields billing-fields-1">
	                                        <h2>배송지 정보</h2>
	                                        <div class="input-field">
	                                            <label>받는 사람 <span class="start_checkout">*</span></label>
												박노율
	                                        </div><!-- .input-field -->
	
	                                        <div class="input-field">
	                                            <label>전화번호 <span class="start_checkout">*</span></label>
	                                            01050027580
	                                        </div><!-- .input-field -->
	                                        
	                                        <div class="input-field" style="width:100%;line-height: 34px;"">
	                                        	<label>주소<span id="address" class="start_checkout">*</span></label>
                                               	17062<br>
                                               	경기 용인시 처인구 중부대로1398번길 1 (김량장동)<br>
                                               	로잔빌리지 102호
                                               	</div>
	                                    	</div>
	                                </div>
	                            </div>
	                            <div class="col-md-6">
	                                <div class="check_out_right default_check_out">
	                                    <div class="billing-fields">
	                                        <h2>주문 상품</h2>
	                                        <div class="your_order">
	                                            <div class="input-field product_buy">
	                                                <label><span class="country2">상품</span><span class="totals">금액</span></label>
	                                                <p><a href=""> <span class="navy">하얀물약(1)</span></a><span class="price_navy">&#8361;75.20</span></p>
	                                            </div>
	                                            <div class="input-field">
	                                                <label class="title_order_totals"><span class="order_total">주문 총금액 :</span><span class="price_order_total">&#8361;75.20</span></label>
	                                            </div>
	                                        </div>
	                                        <div class="place_order">
	                                            <a href="" class="link_place_order">돌아가기</a>
	                                        </div>
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