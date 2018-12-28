<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
//최근 본 바구니(쿠키불러오기)
var nameArr2  = eval( '["'+$.cookie('productName')+'"]' );
var pathArr2  = eval( '["'+$.cookie('productPath')+'"]' );
var aHrefArr2 = eval( '["'+$.cookie('productA')+'"]' );

nameArr3 = nameArr2.toString().split(',');
pathArr3 = pathArr2.toString().split(',');
aHrefArr3 = aHrefArr2.toString().split(',');

$(document).ready(function() {
	var $basket = $('#basket');

	if (nameArr3.length != 1 ) {
		for (var i=0; i < nameArr3.length; i++) {
			
			if (nameArr3[i] !== "null") {
				str = "<tr>"
				str += "<td style='padding: 10px;'><a href='"+aHrefArr3[i]+"'>"+nameArr3[i]+"</a></td>"
				str += "<td><a href='"+aHrefArr3[i]+"'><img style=' width: 162px; height: 140px;' src='${pageContext.request.contextPath}/images/product/"+pathArr3[i]+"'></a></td>"
				str += "</tr>"

				$basket.prepend(str);
			}
		}
	} else {
		var str = "<tr><td colspan='2'>최근본상품이없습니다.</td></tr>"
		$basket.prepend(str);
	}
	
});

   $(document).ready(function(){
   
      $('#login-button').click(function(){
         $('#login_Pane').submit();
      });
      
    //회원가입 페이지 이동 버튼
     $('#btn-sign').click(function() {
        location.href = "${pageContext.request.contextPath }/jsp/login/login.jsp?sign=1";
     });
   });
</script>

<header class="fix_heigh_header">
    <div class="nav_container">
        <div class="logo">
            <a href="${pageContext.request.contextPath }/jsp/main/main.jsp">
                <img alt="Logo" class="img_logo_defaul" src="${pageContext.request.contextPath }/images/icon/logo.png"/>
                <img alt="Logo" class="img_logo_fixed" src="${pageContext.request.contextPath }/images/icon/logo-fixed.png"/>
            </a>
        </div>
        <nav class="collapse navbar_collapse">
            <ul class="menu">
                <li class="level-01 home"><a class="active" href="${pageContext.request.contextPath }/jsp/main/main.jsp">HOME</a></li>
                <li class="level-01 portfolio"><a href="${pageContext.request.contextPath }/jsp/intro/strongIntro.jsp">INTRO</a>
                    <div class="mega_drop_menu mega_dropdown_portfolio_v1">
                        <div class="menu-menu">
                            <ul class="block_level2">
                                <li class="level-02"><a href="${pageContext.request.contextPath }/jsp/intro/strongIntro.jsp">강한남자란</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/NoticeListController">공지사항</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/jsp/intro/location.jsp">오시는길</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="level-01 portfolio"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=1&p_cate2=0">SUPPLEMENTS</a>
                    <div class="mega_drop_menu mega_dropdown_portfolio_v1">
                        <div class="menu-menu">
                            <ul class="block_level2">
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=1&p_cate2=1">운동전(부스터)</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=1&p_cate2=2">운동중(지구력)</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=1&p_cate2=3">운동후(회복)</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="level-01 portfolio"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=2&p_cate2=0">AMINO</a>
                    <div class="mega_drop_menu mega_dropdown_portfolio_v1">
                        <div class="menu-menu">
                            <ul class="block_level2">
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=2&p_cate2=4">복합 아미노산</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=2&p_cate2=5">BCAA</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=2&p_cate2=6">EAA</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="level-01 portfolio"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=3&p_cate2=0">PROTEIN</a>
                    <div class="mega_drop_menu mega_dropdown_portfolio_v1">
                        <div class="menu-menu">
                            <ul class="block_level2">
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=3&p_cate2=7">복합 단백질</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=3&p_cate2=8">체중증가/게이너</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=3&p_cate2=9">카제인 단백질</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="level-01 portfolio"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=0">VITAMIN</a>
                    <div class="mega_drop_menu mega_dropdown_portfolio_v1">
                        <div class="menu-menu">
                            <ul class="block_level2">
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=10">남성 비타민(철분제외)</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=11">여성/임산부 비타민</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=12">장년 비타민</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=13">유아/어린이 비타민</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="level-01 portfolio"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=5&p_cate2=0">EXERCISE GOODS</a>
                    <div class="mega_drop_menu mega_dropdown_portfolio_v1">
                        <div class="menu-menu">
                            <ul class="block_level2">
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=14">쉐이커 & 물통</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=15">장갑 & 벨트 & 스트랩</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=16">관절 보호대</a></li>
                                <li class="level-02"><a href="${pageContext.request.contextPath }/ProductListController?optionVal=0&p_cate1=4&p_cate2=17">피트니스 용품</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </nav>
        <div class="navbar-toggle-right">
            <div class="navbar-toggle-search">
                <div class="navbar-search">
                    <i class="fa fa-search"></i>
                </div>
            </div>
            <div class="navcart">
                <div class="navcart-wrap">
                    <div class="navbar-minicart">
                        <a class="minicart-link" href="#">
                            <span class="minicart-icon"><i class="fa fa-user"></i></span>
                        </a>
                        <div class="mega_drop_menu mega_dropdown_nav_cart_v1" style=" width: 204px;height:173px;border-radius: 8px;">
                            <div class="menu-menu">
                                <ul class="block_level2">
                              <li >
                                 <c:choose>
                                    <c:when test="${sessionScope.m_id != null }">
                                       <form action="${pageContext.request.contextPath }/MemLogoutController" id="loginPane">
                                         <ul class="block_level2">
                                             <li class="level-02">
                                                 <div class="minicart-actions clearfix">
                                                     <a class="submit" href="${pageContext.request.contextPath }/MemLogoutController">
                                                         <span class="text">로그아웃</span>
                                                     </a>
                                                 </div>
                                             </li>
                                         </ul>
                                       </form>
                                    </c:when>
                                    <c:otherwise>
                                       <form action="${pageContext.request.contextPath }/MemLoginController" id="loginPane" name="login_Pane" method="post">
                                          <div>
                                             <input type="text" id="m_id" name="m_id" placeholder="아이디" style="vertical-align: 12px;width: 164px;">
                                             <input type="password" id="m_pwd" name="m_pwd" placeholder="비밀번호" style="vertical-align: 12px;width: 164px;">   
                                             <input type="submit" class='login-button' value="로그인" style="vertical-align: 12px;">
                                             <input id="btn-sign" type="button" class='login-button' value="회원가입" style="vertical-align: 12px;">
                                          </div>
                                       </form>
                                    </c:otherwise>
                                 </c:choose>
                              </li>
                           </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navcart">
                <div class="navcart-wrap">
                    <div class="navbar-minicart">
                        <a class="minicart-link" href="#">
                            <span class="minicart-icon"><i class="fa fa-eye"></i><span></span></span>
                        </a>
                        <div class="mega_drop_menu mega_dropdown_nav_cart_v1">
                            <div class="menu-menu">
                                <ul class="block_level2">
                                    <li class="level-02 contact">
                                    	<table id="basket">
                                    	</table>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="navcart">
                <div class="navcart-wrap">
                    <div class="navbar-minicart">
                        <a class="minicart-link" href="#">
                            <span class="minicart-icon"><i class="fa fa-shopping-cart"></i><span>(0)</span></span>
                        </a>
                        <div class="mega_drop_menu mega_dropdown_nav_cart_v1">
                            <div class="menu-menu">
                                <ul class="block_level2">
                                    <li class="level-02">
                                        <div class="minicart-actions clearfix">
                                            <a class="button" href="#">
                                                <span class="text">장바구니 가기</span>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="money">
                <a class="active tittle-money" href="" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">조회</a>
                <div class="mega_drop_menu mega_dropdown_money_v1">
                    <div class="menu-menu">
                        <ul class="block_level2">
                        	<li class="level-02"><a href="${pageContext.request.contextPath }/MemInfoController" id="myInfo-btn">나의정보</a></li>
                            <li class="level-02"><a href="${pageContext.request.contextPath }/MyOrderListController">주문목록</a></li>
                            <li class="level-02"><a href="">1:1문의</a></li>
                            <li class="level-02"><a href="">고객센터</a></li>
 							<c:if test="${sessionScope.m_type=='관리자' }">
                            	<li class="level-02"><a href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=1&p_cate2=1">관리모드</a></li>
                            </c:if>
                            <c:if test="${sessionScope.m_type=='판매자' }">
                            	<li class="level-02"><a href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=1&p_cate2=1">상품등록</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-search-overlay hide">
        <div class="container-fluid">
            <div class="header-search-overlay-wrap">
                <form method="GET" class="searchform">
                    <input type="search" class="searchinput" name="s" autocomplete="off" value="" placeholder="Search...">
                    <input type="submit" class="searchsubmit hidden" name="submit" value="Search">
                    <input type="hidden" name="post_type" value="product">
                </form>
                <button type="button" class="close">
                    <span aria-hidden="true" class="fa fa-times"></span><span class="sr-only">Close</span>
                </button>
            </div>
        </div>
    </div>
    <div class="handle"><i class="fa fa-bars" aria-hidden="true"></i></div>
</header>