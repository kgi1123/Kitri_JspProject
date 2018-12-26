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
	<div class="wrapper wrapper_v3">
	
		<!-- 헤더 -->
		<jsp:include page="/jsp/comn/default-header.jsp" />
		<section>
	        <div class="main_content contact-us">
	            <div class="container-full">
	            	<!-- 헤더 -->
	                <jsp:include page="/jsp/intro/location-banner.jsp" />
	                
	                <div class="container">
	                    <div class="brand default">
	                        <div class="row" style="padding-bottom: 72px;">
	                            <div class="col-sm-8">
	                                <div class="vc_column-brand">
	                                    <h3 class="title">찾아오시는길</h3>
	                                </div>
	                                <div class="content_brand">
	                                	<div class="input-field">
	                                		<h3>경기도 용인시 중부대로 1398번길 17-24  로잔빌리지 102호</h3>
	                                	</div>
	                               		<div class="input-field">
											<div id="map"></div>
										    <script>
												// Initialize and add the map
												function initMap() {
												  // The location of Uluru
												  var uluru = {lat: 37.2309323, lng: 127.20009049999999};
												  // The map, centered at Uluru
												  var map = new google.maps.Map(
												      document.getElementById('map'), {zoom: 15, center: uluru});
												  // The marker, positioned at Uluru
												  var marker = new google.maps.Marker({position: uluru, map: map});
												}
										    </script>
										    <!--Load the API from the specified URL
										    * The async attribute allows the browser to render the page while the API loads
										    * The key parameter will contain your own API key (which is not needed for this tutorial)
										    * The callback parameter executes the initMap() function
										    -->
										    <script async defer
										    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCbJ4gVQ2QY2T_4z3CCueXkwCViNTmhSYI&callback=initMap">
										    </script>
	                                	</div>
	                            	</div>
                           		</div>
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
</html>