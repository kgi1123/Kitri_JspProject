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
<script>
	$(document).ready(function(){
		$('#payment').click(function(){
			$('#f').attr('action', "${pageContext.request.contextPath}/MyOrderAddController");
			$('#f').submit();
		});
	});
</script>
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
	                    	<form action="#" method="post" id="f">
		                        <div class="row">
		                            <div class="col-md-6">
		                                <div class="check_out_left default_check_out">
		                                    <div class="billing-fields billing-fields-1" style=" padding-bottom: 39px; ">
		                                        <h2>배송지 정보</h2>
		                                        <div class="input-field">
		                                            <label>판매자 <span class="start_checkout">*</span></label>
													${p_writer }
													<input type="hidden" name="o_buyer" value="${sessionScope.m_id }">
		                                        </div><!-- .input-field -->
		                                        <div class="input-field">
		                                            <label>받는사람 이름 <span class="start_checkout">*</span></label>
		                                            <input name="o_recipient" type="text" placeholder="이름" class="input-text">
		                                        </div><!-- .input-field -->
		
		                                        <div class="input-field">
		                                            <label>구매자 전화번호 <span class="start_checkout">*</span></label>
		                                            <input name="o_phone" type="text" placeholder="전화번호" class="input-text">
		                                        </div><!-- .input-field -->
		                                        
		                                        <div class="input-field">
		                                            <label>배송요구 사항 <span class="start_checkout">*</span></label>
		                                            <input name="o_req" type="text" placeholder="50자이내로" class="input-text">
		                                        </div><!-- .input-field -->
		                                        
		                                        <div class="input-field" style="width:100%">
		                                        	<label>주소<span id="address" class="start_checkout">*</span></label>
	                                               	<input type="text" class="input-text form-control" id="signAddress" name="signAddress" placeholder="우편번호" style="width:30%;float:left">
	                                               	<input type="button" style="width:129px;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
	                                               	<input type="text" class="input-text form-control" id="signAddress1" name="signAddress1" placeholder="도로명주소">
	                                              	<input type="text" class="form-control" id="signAddress2" name="signAddress2" placeholder="상세주소">
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
		                                                <p><a href=""> <span class="navy">${p_name }</span></a><span class="price_navy">${p_price }</span></p>
		                                                <input type="hidden" name="p_name" value="${p_name }">
		                                            </div>
		                                            <div class="input-field">
		                                                <label class="title_order_totals"><span class="order_total">주문 총금액 :</span><span class="price_order_total">&#8361;${p_price * o_qty}</span></label>
		                                            </div>
		                                            <div class="input-field">
		                                                <label class="title_order_totals"><span class="order_total">주문 수량 :</span><span class="price_order_total">${o_qty }개</span></label>
		                                                <input type="hidden" name="o_qty" value="${o_qty }">
		                                                <input type="hidden" name="p_num" value="${p_num }">
		                                                <input type="hidden" name="o_seller" value="${p_writer }">
		                                            </div>
		                                        </div>
		                                        <div class="place_order">
		                                            <a href="#" class="link_place_order" id="payment">결제하기</a>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
	                    	</form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
		
		<!-- 푸터 -->
		<jsp:include page="/jsp/comn/default-footer.jsp" />
	</div>
	
	
</body>
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
                document.getElementById('signAddress2').focus();
            }
        }).open();
    }
</script>
</html>

