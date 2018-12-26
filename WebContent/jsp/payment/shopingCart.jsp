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
                            <div class="col-md-7 col-md-7-shopping-cart">
                                <div class="your_shopping_cart shopping_default">
                                    <h2 class="title title_default">your shopping cart</h2>
                                    <div class="cart-form">
                                        <div class="table-responsive">
                                            <table class="table cart-table">
                                                <thead>
                                                <tr>
                                                    <th></th>
                                                    <th class="product-name">Products</th>
                                                    <th class=""></th>
                                                    <th>Price</th>
                                                    <th class="th_quatity">Quantity</th>
                                                    <th>Total</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="product-remove">
                                                        <a href="#" class="remove"><span aria-hidden="true" class="icon_close"></span></a>
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath }/images/product/shopping_cart1.jpg" alt="">
                                                        </a>
                                                    </td>
                                                    <td class="pro_name">
                                                        <a href="#">
                                                            <span>Slim Collarless Blazer In Jersey</span>
                                                        </a>
                                                    </td>
                                                    <td class="product-price">
                                                        <p class="price">&#8361;72.20</p>
                                                    </td>
                                                    <td>
                                                        <div class="quantity_product quantity_product_15 size_product">
                                                            <form enctype="multipart/form-data">
                                                                <div class="product-signle-options product_15 clearfix">
                                                                    <div class="selector-wrapper size">
                                                                        <div class="quantity_shop_cart">
                                                                            <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="input-text qty text" size="4">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal">
                                                        <p class="price">&#8361;72.20</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="product-remove">
                                                        <a href="#" class="remove"><span aria-hidden="true" class="icon_close"></span></a>
                                                    </td>
                                                    <td class="product-name">
                                                        <a href="#">
                                                            <img src="${pageContext.request.contextPath }/images/product/shopping_cart1.jpg" alt="">
                                                        </a>
                                                    </td>
                                                    <td class="pro_name">
                                                        <a href="#">
                                                            <span>Denim Kimono Jacket</span>
                                                        </a>
                                                    </td>
                                                    <td class="product-price">
                                                        <p class="price">&#8361;72.20</p>
                                                    </td>
                                                    <td>
                                                        <div class="quantity_product quantity_product_15 size_product">
                                                            <form enctype="multipart/form-data">
                                                                <div class="product-signle-options product_15 clearfix">
                                                                    <div class="selector-wrapper size">
                                                                        <div class="quantity_shop_cart">
                                                                            <input type="number" step="1" min="1" name="quantity" value="1" title="Qty" class="input-text qty text" size="4">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </td>
                                                    <td class="product-subtotal">
                                                        <p class="price">&#8361;72.20</p>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 col-md-5-shopping-cart">
                                <div class="cart_total shopping_default">
                                    <h2 class="title title_default">cart totals</h2>
                                    <div class="content_cart_total">
                                        <p class="cart_subtotal">
                                            <span class="text">Cart Subtotal</span>
                                            <span class="number">&#8361;150.40</span>
                                        </p>
                                        <p class="shipping_free">
                                            <span class="text">Shipping</span>
                                            <span class="number">Free Shipping</span>
                                        </p>
                                        <p class="totals">
                                            <span class="text">Totals</span>
                                            <span class="number">&#8361;150.40</span>
                                        </p>
                                    </div>
                                    <div class="submit_cart_total">
                                        <button type="submit" class="proceed_to_checkout btn btn-default">구매하기</button>
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