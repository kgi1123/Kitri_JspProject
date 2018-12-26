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
alert("하나의 후기만 작성이 가능합니다.");
if (confirm("후기를 수정하시겠습니까?")){
}else{
    location.href="${pageContext.request.contextPath }/jsp/payment/shop-orderList.jsp";
}

$(document).ready(function() {
   $('#update_btn').click(function() {
      $('#update_form').submit();
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
                              <form action="${pageContext.request.contextPath }/ProductRepsUpdateController" id="update_form" class="form form-contact"  method="post" enctype="multipart/form-data">
                                 <input type="hidden" name="preps_p_num" value="${pdr.preps_p_num}" />
                                 <input type="hidden" name="preps_writer" value="${pdr.preps_writer}" />
                                 <input type="hidden" name="preps_img1" value="${pdr.preps_img}">
                                 <div class="input-field">
                                    <label>물품명</label>
                                     ${product_name}
                                 </div>
                                 <div class="input-field">
                                    <label>작성자</label>
                                     ${pdr.preps_writer}
                                 </div>
                                 <div class="input-field">
                                    <label>별점</label>
                                    <div class="Container" >
                                      <font size = 2 id = "slider_value_view" id="star">${pdr.preps_star}</font>                    
                                      <input style = "width:80%;" class="slider_range" type="range" min="0" max="5" step="1" name="preps_star" value="${pdr.preps_star}" />                 
                                    </div>
                                 </div>
                                 <div class="input-field">
                                    <label>내용</label>
                                    <textarea id="content1" name="preps_content " onkeyup="len_chk()" style="width: 600px;height: 42px;resize:none;">${pdr.preps_content}</textarea>
                                 </div>
                                 <c:if test = "${pdr.preps_img != null}">
                                 <div class="input-field">
                                    <label>이미지</label> <input type="file" name="preps_img"> 
                                    <img style="width:132px;height:155px" src="/img/${pdr.preps_img}">
                                 </div>
                                 </c:if>
                                 <a href="#" class="button-contact" id="update_btn">글 수정</a>
                                 <a href="#" class="button-contact" id="del_btn1">글 삭제</a>
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