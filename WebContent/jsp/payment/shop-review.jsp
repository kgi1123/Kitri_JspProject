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
	$('#add_btn').click(function() {
		$('#add_form').submit();
	});
});

//글자수 제한 체크 
function len_chk(){  
  var content = $("#content1").val();
     
  if(content.length > 50){  
       alert("50자로 제한됩니다.!");  
       $("#content1").val(content.substring(0,50));;  
       $("#content1").focus();  
  } 
} 
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
							<div class="row">
								<div class="col-sm-8">
									<div class="vc_column-brand">
										<h3 class="title">후기작성</h3>
									</div>
									<div class="content_brand">
										<form action="${pageContext.request.contextPath }/ProductRepsAddController" id="add_form" class="form form-contact"  method="post" enctype="multipart/form-data">
											<input type="hidden" name="preps_p_num" value="${product_num}" />
											<input type="hidden" name="preps_name" value="${product_name}" />
											<input type="hidden" name="preps_writer" value="${p_writer}" />
											<div class="input-field">
												<label>물품명</label>
												 ${product_name}
											</div>
											<div class="input-field">
												<label>작성자</label>
												 ${p_writer}
											</div>
											<div class="input-field">
												<label>별점</label>
												<div class="Container" >
												  <font size = 2 id = "slider_value_view">0</font>						  
												  <input style = "width:80%;" class="slider_range" type="range" min="0" max="5" step="1" name="preps_star"></input>						  
												</div>
											</div>
											<div class="input-field">
												<label>내용</label>
												<textarea id="content1" name="preps_content " onkeyup="len_chk()" style="width: 600px;height: 42px;resize:none;;"></textarea>
											</div>
											<div class="input-field">
												<label>이미지</label> <input type="file" name="preps_img"> 
											</div>
											<a href="#" class="button-contact" id="add_btn">글작성</a>
										</form>
									</div>
								</div>
								<div class="col-sm-4"></div>
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
<script>
	function ShowSliderValue(sVal)
	{
		var obValueView = document.getElementById("slider_value_view");
		obValueView.innerHTML = sVal
	}
	
	var RangeSlider = function(){
		var range = $('.slider_range');
	    
		range.on('input', function(){		
			ShowSliderValue(this.value);
		});
	};
	
	RangeSlider();
</script>


</html>