<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<script>

//최근본 장바구니(쿠키등록)
var nameArr  = eval( '["'+$.cookie('productName')+'"]' );
var pathArr  = eval( '["'+$.cookie('productPath')+'"]' );
var aHrefArr = eval( '["'+$.cookie('productA')+'"]' );
var check;

if (nameArr !== null && nameArr !== "" && nameArr !== null) {
   var nameArr1 = nameArr.toString().split(',');
   var pathArr1 = pathArr.toString().split(',');
   var aHrefArr1 = aHrefArr.toString().split(',');
   check = 0;


   for(var i = 0; i < nameArr1.length; i++) {
      
      if (nameArr1[i] === "${p.p_name}") {
         check = 1;
      }
   }
         
   if (check === 0) {
   
      if (nameArr1.length < 5) {
      nameArr1.push("${p.p_name}");
      pathArr1.push("${p.p_img1}");
      aHrefArr1.push(window.location.protocol + "//" + window.location.host + window.location.pathname + "?num=${param.num}&cate1=${param.cate1}");
      } else {
      nameArr1.push("${p.p_name}");
      pathArr1.push("${p.p_img1}");
      aHrefArr1.push(window.location.protocol + "//" + window.location.host + window.location.pathname + "?num=${param.num}&cate1=${param.cate1}");

      nameArr1.shift();
      pathArr1.shift();
      aHrefArr1.shift();
      }
      
      $.cookie("productName", nameArr1);
      $.cookie("productPath", pathArr1);
      $.cookie("productA", aHrefArr1);
      
   }
}

$(document).ready(function() {
   //댓글 좋아요 버튼
   $('.wishlist a').click(function() {
         var nullCheck = ${sessionScope.m_id == null};
      if(nullCheck) {
         alert("로그인 후에 이용해주세요.");
         return;
      } 
      
      var $checkHeart = $(this);
      var td = $checkHeart.parent();
      
      var pdr_no = td.parent().parent().parent().children().children().children().val();

      var heartCount = $checkHeart.parent().find("span");
      var param = "p_num=${p.p_num}&preps_num="+pdr_no+"&m_id=${sessionScope.m_id}";
      if ($checkHeart.hasClass('text-primary')) 
      { 
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/LiketoAddController",
            data:param,
            success:function(data){
               var arr = eval("("+data+")");
               heartCount.text("("+arr[0].preps_rec+")");
               $checkHeart.removeClass('text-primary').addClass('text-danger');
               alert("좋아요.");
            }
         });
       } 
      else { 
         $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/LiketoSubController",
            data:param,
            success:function(data){
               var arr = eval("("+data+")");
               heartCount.text("("+arr[0].preps_rec+")");
               $checkHeart.removeClass('text-danger').addClass('text-primary'); 
                alert('좋아요 취소.');
            }
         });
      }      
   });
   
   $('#direct_payment').click(function(){
      $('#f').attr('action', "${pageContext.request.contextPath }/MyOrderAddFormController");
      $('#f').submit();
   });
   
});
</script>

<section>
   <div class="main_content">
      <div class="container-full">
           <div class="container-full">
            <div class="container">
               <div class="row">
                  <div class="col-md-6 space-details">
                     <div class="product_detail product-img-box">
                        <div class="center slider-for slick-demo-popup" id="zoom_main">
                           <div class="item">
                              <a id="image-view" title="Product Image">
                                 <img class="product_zoom" src="${pageContext.request.contextPath}/images/product/${p.p_img1}" alt="Product"/>
                                       </a> 
                                   </div>
                                   <div class="item">
                                       <a id="image-view1" title="Product Image">
                                           <img style="height:420px;"  class="product_zoom" src="${pageContext.request.contextPath}/images/product/${p.p_img2}" alt="Product"/>
                                       </a>
                                   </div>
                               </div>                              
                               <!--End slider-for-->
                               <div class="product-thumb">
                                   <div class="slider-nav thumb-content" id="zoom_gallery">
                                       <a href="#" class="thumb elevatezoom-gallery" data-image="${pageContext.request.contextPath}/images/product/${p.p_img1}" data-zoom-image="${pageContext.request.contextPath}/images/product/${p.p_img1}"><img src="${pageContext.request.contextPath}/images/product/${p.p_img1}" alt="thumb product1"/></a>
                                   </div>   
                                   <div class="slider-nav thumb-content" id="zoom_gallery">
                                       <a href="#" class="thumb elevatezoom-gallery" data-image="${pageContext.request.contextPath}/images/product/${p.p_img2}" data-zoom-image="${pageContext.request.contextPath}/images/product/${p.p_img2}"><img src="${pageContext.request.contextPath}/images/product/${p.p_img2}" alt="thumb product2"/></a>
                                   </div>
                               </div>
                           </div>
                       </div>
                           <div class="col-md-6">
                                 <form action="#" id="f" method="post">
                                  <div class="introduce_product">
                                      <div class="tittle_product">
                                             ${p.p_name}
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
                                          <span class="add_your_review">
                                                review(${count}) / ${p.p_name }
                                          </span>
                                      </div>
                                      <div class="price">
                                          <span class="price_new">
                                                &#8361;${p.p_price}
                                          </span>
                                      </div>   
                                      <div class="available">
                                          <span class="title">조회수: </span>
                                          <span class="in_stock">${p.p_hits }</span>
                                      </div>
                                      <p class="note_pro">${p.p_contents }</p>
                                      <div class="wrap_cart">
                                          <div class="quatity_pro">
                                              <div class="product-signle-options clearfix">
                                                  <div class="selector-wrapper size">
                                                      <div class="quantity">
                                                          <input data-step="1" value="1" title="Qty" class="qty" size="4" type="text" name="o_qty">
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="buy_on_ebay">
                                              <a href="#" onclick="goBasket(1)" id="go_cart">장바구니 담기</a>
                                          </div>
                                          <div class="buy_on_ebay">
                                              <a href="#" id="direct_payment">바로결제</a>
                                              <!-- ?p_num=${p.p_num}&p_name=${p.p_name}&p_price=${p.p_price} -->
                                          </div>
                                      </div>
                                      <div class="categories">
                                          <p class="title">등록날짜</p>
                                          <ul>
                                              <li><a href="" class="">2018 10 19</a></li>
                                          </ul>
                                      </div>
                                      <input type="hidden" value="${p.p_num }" name="p_num">
                                      <input type="hidden" value="${p.p_name }" name="p_name">
                                      <input type="hidden" value="${p.p_price }" name="p_price">
                                      <input type="hidden" value="${p.p_writer }" name="p_writer">
                                  </div>
                                 </form>
                           </div>
                       </div>
                       <div class="clearfix"></div>
                       <div class="product_description">
                           <div class="tab-v8">
                               <div class="nav-inner header_pro_description">
                                   <ul class="nav nav-tabs" role="tablist">
                                       <li class="">
                                           <a href="#tab-v8-1" role="tab" data-toggle="tab" aria-expanded="true">리뷰보기 (${count})</a>
                                       </li>
                                   </ul>
                               </div>
                               <div class="tab-content">
                                   <div class="tab-pane fade" id="tab-v8-1">
                                       <div class="content_pro_description">
                                           <div class="coupling" style=" padding-bottom: 12px;">
                                           <c:if test="${not empty list}">
                                              <div class="col-md-4 hidden-xs" style=" width: 100%; padding-bottom: 24px;">
                                                 <div class="select_sorting">
                                                   <select id="gender1">
                                                       <option value="0" selected="selected">등록순</option>
                                                       <option value="1">인기순</option>
                                                   </select>
                                               </div>
                                              </div>
                                              <br />
                                              <c:forEach var="list" items="${list}" varStatus="status">
                                                <table>
                                                   <tr><td colspan="2"><input type="hidden" value="${list.preps_num}"></td></tr>
                                                    <tr>
                                                       <td>별점</td>
                                                       <td>
                                                          <span class="notable_star">
                                                             <c:forEach var="i" begin="1" end="${list.preps_star}" step="1">
                                                              <i class="fa fa-star" aria-hidden="true"></i>
                                                           </c:forEach>
                                                           <c:forEach var="i" begin="1" end="${5-list.preps_star}" step="1">
                                                              <i class="fa fa-star-o" aria-hidden="true"></i>
                                                           </c:forEach>
                                                         </span>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                       <td style=" width: 52px; ">아이디</td>
                                                       <td>${list.preps_writer}</td>
                                                   </tr>
                                                    <tr>
                                                       <td>내용</td>
                                                       <td>${list.preps_content}</td>
                                                    </tr>
                                                       <c:if test="${not empty list.preps_img}">
                                                          <tr>
                                                            <td>이미지</td>
                                                             <td>
                                                                <img class="product_zoom" src="${pageContext.request.contextPath}/images/product/${list.preps_img}" alt="Product" style=" width: 132px; height: 155px; "/>
                                                             </td>
                                                          </tr>
                                                       </c:if>
                                                       <tr>
                                                       <td colspan="2">   
                                                          <div class="wishlist">
                                                             <c:set var="check" value="1" />
                                                             <c:forEach var="like" items="${like}" varStatus="status1">
                                                                <c:if test="${list.preps_num == like.like_preps_num && sessionScope.m_id == like.like_m_id && like.like_check == 1}">
                                                                   <a href="javascript:void(0);" class="text-danger"><i aria-hidden="true" class="icon_heart"></i></a><span>(${list.preps_rec})</span><hr>
                                                                   <c:set var="check" value="0" />
                                                                </c:if>
                                                             </c:forEach>
                                                             <c:if test="${check == 1}">
                                                                <a href="javascript:void(0);" class="text-primary"><i aria-hidden="true" class="icon_heart"></i></a><span>(${list.preps_rec})</span><hr>
                                                             </c:if>
                                                          </div>
                                                         </td>         
                                                       </tr>
                                                 </table>
                                              </c:forEach>
                                              </c:if>
                                              <c:if test="${empty list}">
                                                후기가 존재하지 않습니다.
                                             </c:if>
                                       </div>
                                   </div>
                                   <c:if test="${not empty list}">
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
                        </c:if>
                                  </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </section>