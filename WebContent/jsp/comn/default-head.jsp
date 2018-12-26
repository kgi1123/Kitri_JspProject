<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Jakiro home full width v2</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	.item.slick-slide.slick-current.slick-active {
		max-width:420px !important;
		max-height:420px !important;
	}
	
	.product_zoom {
	    max-width: 420px !important;
    	max-height: 420px !important;
	}
</style>

<!-- favicon -->
<LINK REL="SHORTCUT ICON" HREF="${pageContext.request.contextPath }/images/favicon.ico" />
<!--Google font-->
<link href="${pageContext.request.contextPath }/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/vendor/font-elegan/style.css" rel="stylesheet" type="text/css"/>
<!--End google font-->
<link href="${pageContext.request.contextPath }/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/vendor/owlcarousel/assets/owl.theme.default.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/vendor/animate.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/vendor/settings.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/vendor/jquery.fancybox.css" media="screen">
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/newCss.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/components/Elements/_form-2.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=Condiment" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/vendor/slick.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/vendor/slick-theme.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath }/css/vendor/slick-lightbox.css" rel="stylesheet" type="text/css"/>

<script src="${pageContext.request.contextPath }/js/jquery.2.1.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/jquery.fancybox-media.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/vendor/owlcarousel/owl.carousel.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.themepunch.plugins.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/engo-plugins.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/wow.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/store.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/query-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/jquery.fancybox.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/vendor/slick.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/js/scollTop.js" type="text/javascript"></script>



<script>
$(document).ready(function() {

   //댓글 좋아요 버튼
   $('.wishlist a').click(function() {
      
      if ($(this).hasClass('text-primary')) 
       { 
           $(this).removeClass('text-primary').addClass('text-danger'); 
           alert("좋아요.");
       } 
       else { 
          $(this).removeClass('text-danger').addClass('text-primary'); 
          alert('좋아요 취소.');
       } 
   });
});

//장바구니 이동버튼
function goBasket(select) {
   
   if(select == 1) {
      if(confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")) {
          alert("location.href='장바구니로 이동'");
       }
   } else {
      if(confirm("결제하시겠습니까?")) {
          alert("location.href='결제로 이동'");
       }
   }
}
</script>