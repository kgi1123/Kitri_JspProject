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
<script>
	$(document).ready(function() {
		$('.send').click(function() {
			var $tr = $(this).parent().parent().parent().parent();
			var $td = $tr.children();	
			
			var td2 = $td.eq(1).html();
			var str_array = td2.split('('); 
			var str = str_array[1];
			var str1 = str_array[0];
			var product_num = str.substring(0, str.length-1);
			var product_name = str1.substring(0, str1.length-9);
			var state = $td.eq(3).html();
			
			if(state == "결제중") {
				alert("아직 결제중입니다. 후기를 쓰기위해서 결제를 완료해주세요!");
			} else {
				location.href = "${pageContext.request.contextPath }/ProductRepsCheckController?product_num="+product_num+"&product_name="+product_name+"&product_writer=${sessionScope.m_id}";
			}
			
		});
	});
</script>
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
					<div class="container">
						<div class="brand default">
							<h3> 주문 목록 </h3>
							<div class="row">
								<table class="table table-bordered">
									<tr>
			                            <th>이미지</th>
			                            <th>물품명</th>
			                            <th>판매자</th>
			                            <th>결제상태</th>
			                            <th>주문날짜</th>
			                            <th>옵션</th>
		                            </tr>
		                            <c:forEach var="i" items="${list }">
				                        <tr>
				                            <td><img style=" width: 132px; height: 155px;" src="${pageContext.request.contextPath}/images/product/${i.p_img1}"></td>
				                            <td>${i.o_goods }<br>코드번호 (${i.o_p_num })</td>
				                            <td>${i.o_seller }</td>
				                            <td>${i.o_pay }</td>
				                            <td>${i.o_date }</td>
				                            <td style=" text-align: center; ">
					                            <div class="introduce_product" style="padding: 0px;margin: 0px">
					                            	<div class="buy_on_ebay">
			                                            <a class="send" href="#">후기작성</a>
			                                        </div>
		                                        </div>
		                                        <div class="introduce_product" style="padding: 0px;margin: 0px">
					                            	<div class="buy_on_ebay">
			                                            <a href="#">상세주문</a>
			                                        </div>
		                                        </div>
		                                   	</td>
				                        </tr>
				                    </c:forEach>
				                </table>
				        	</div>
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