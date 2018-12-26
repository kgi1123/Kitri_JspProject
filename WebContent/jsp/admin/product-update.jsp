<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<jsp:include page="/jsp/comn/admin-head.jsp" />

<script type="text/javascript">
var op1 ="", op2="", op3="";
$.getSelectList=function(param, spanId, selId){
   $.ajax({
      type:"POST",
      url:"${pageContext.request.contextPath }/CateListController",
      data:param,
      success:function(data){
         var arr = eval("("+data+")");
         var str = "<select id="+selId+" name="+selId+">";
         for(i=0;i<arr.length;i++){
            str += "<option value="+arr[i].num+">"
            +arr[i].name+"</option>";
         }
         str += "</select>";
         $(spanId).html(str);
         $('#'+selId).on("change", function(){            
            var op = $(this).val();
            if(selId=="p_cate1"){
               op1 = op;
               op2="";
               op3="";
               $('#sel3').html('');
               $.b();
            }else if(selId=="p_cate2"){
               op2=op;
               op3="";
               $.c();
            }else if(selId=="cate3"){
               op3=op;
               alert(op1+"/"+op2+"/"+op3);
            }
         });
      }
   });
}
$.a=function(){
   var param = "parent=0&table=cate1";
   $.getSelectList(param, "#sel1", "p_cate1");
}
$.b=function(){
   var param = "parent="+op1+"&table=cate2";
   $.getSelectList(param, "#sel2", "p_cate2");
}
$.c=function(){
   var param = "parent="+op2+"&table=cate3";
   $.getSelectList(param, "#sel3", "cate3");
}

$(document).ready(function(){
   $.a();
   
   $('#product_edit_btn').click(function(){
      $('#f').attr("action", "${pageContext.request.contextPath }/ProductEditController");
      $('#f').submit();
   });
});
</script>
</head>

<body class="dark-edition">
	<div class="wrapper ">
		<jsp:include page="/jsp/comn/admin-left2.jsp" />
		<div class="main-panel">
			<!-- Navbar -->
			<jsp:include page="/jsp/comn/admin-nav.jsp" />
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header card-header-primary">
									<h4 class="card-title ">상품수정</h4>
									<p class="card-category">상품을 수정하세요</p>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<form action="#" method="post" id="f" enctype="multipart/form-data">
											<input type="hidden" name="num" value="${p.p_num }">
											<table class="table">
												<tr>
												    <td>물품명</td>
			                                        <td><input type="text" name="name" value=${p.p_name }></td>
			                                    </tr>
			                                    <tr>
			                                        <td>작성자</td>
			                                        <td><input type="text" name="writer" value=${p.p_writer } readonly></td>
			                                    </tr>
			                                    <tr>
			                                        <td>가격</td>
			                                        <td><input type="text" name="price" value=${p.p_price }></td>
			                                    </tr>
			                                    <tr>
			                                        <td>수량</td>
			                                        <td><input type="text" name="quantity" value=${p.p_quantity }></td>
			                                    </tr>
			                                    <tr>
			                                        <td>대분류</td>
			                                        <td id="sel1"></td>
			                                    </tr>
			                                    <tr>
			                                        <td>소분류</td>
			                                        <td id="sel2"></td>
			                                    </tr>
			                                    <tr>
			                                        <td>내용</td>
			                                        <td><textarea rows="20" cols="70" name="contents">${p.p_contents }</textarea></td>
			                                    </tr>
			                                    <tr>
			                                        <td>이미지</td>
			                                        <td><input type="file" name="img1"></td>
			                                    </tr>
			                                    <tr>
			                                        <td>영양표</td>
			                                        <td><input type="file" name="img2"></td>
			                                    </tr>
			                                    <tr>
													<td colspan="2">
														<button class="btn btn-primary pull-right" id="product_edit_btn">수정</button>
													</td>
												</tr>
											</table>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/comn/admin-footer.jsp" />
		</div>
	</body>

</html>