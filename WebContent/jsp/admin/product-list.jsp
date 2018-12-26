<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<jsp:include page="/jsp/comn/admin-head.jsp" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
var id;
$(document).ready(function() {
	$('button').click(function(){
		id=$(this).attr('id');
		text=$(this).text();
		switch(id) {
		
		//SUPPLEMENTS
		case "SUPPLEMENTS1":
			document.getElementById('id01').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=1&p_cate2=1"
			break;
		case "SUPPLEMENTS2":
			document.getElementById('id01').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=1&p_cate2=2"
			break;
		case "SUPPLEMENTS3":
			document.getElementById('id01').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=1&p_cate2=3"
			break;
		
		//AMINO
		case "AMINO1":
			document.getElementById('id02').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=2&p_cate2=4"
			break;
		case "AMINO2":
			document.getElementById('id02').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=2&p_cate2=5"
			break;
		case "AMINO3":
			document.getElementById('id02').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=2&p_cate2=6"
			break;
			
		//PROTEIN
		case "PROTEIN1":
			document.getElementById('id03').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=3&p_cate2=7"
			break;
		case "PROTEIN2":
			document.getElementById('id03').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=3&p_cate2=8"
			break;
		case "PROTEIN3":
			document.getElementById('id03').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=3&p_cate2=9"
			break;
		
		//VITAMIN
		case "VITAMIN1":
			document.getElementById('id04').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=4&p_cate2=10"
			break;
		case "VITAMIN2":
			document.getElementById('id04').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=4&p_cate2=11"
			break;
		case "VITAMIN3":
			document.getElementById('id04').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=4&p_cate2=12"
			break;
		case "VITAMIN4":
			document.getElementById('id04').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=4&p_cate2=13"
			break;
			
		//EXERCISE
		case "EXERCISE1":
			document.getElementById('id05').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=5&p_cate2=14"
			break;
		case "EXERCISE2":
			document.getElementById('id05').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=5&p_cate2=15"
			break;
		case "EXERCISE3":
			document.getElementById('id05').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=5&p_cate2=16"
			break;
		case "EXERCISE4":
			document.getElementById('id05').style.display='none';
			location.href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=5&p_cate2=17"
			break;
			
		case "ALL":
			alert(text+" 메뉴를 클릭했습니다.");
			break;
		}
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
									<h4 class="card-title ">상품목록</h4>
									<p class="card-category">현제 홈페이지에 등록되어있는 상품들의 목록입니다. 버튼 클릭</p>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<button class="btn btn-primary pull-left" onclick="document.getElementById('id01').style.display='block'">SUPPLEMENTS</button>
										<button class="btn btn-primary pull-left" onclick="document.getElementById('id02').style.display='block'">Amino</button>
										<button class="btn btn-primary pull-left" onclick="document.getElementById('id03').style.display='block'">Protein</button>
										<button class="btn btn-primary pull-left" onclick="document.getElementById('id04').style.display='block'">Vitamin</button>
										<button class="btn btn-primary pull-left" onclick="document.getElementById('id05').style.display='block'">Exercise</button>
										<a href="${pageContext.request.contextPath }/jsp/admin/product-add.jsp"><button class="btn btn-primary pull-right">추가</button></a>
										<button class="btn btn-primary pull-left" id="ALL">ALL</button>
										<table class="table">
											<thead class=" text-primary">
												<th>물품명</th>
												<th>내용</th>
												<th>이미지</th>
												<th>가격</th>
												<th>수량</th>
												<th>옵션</th>
											</thead>
											<c:forEach var="i" items="${list }">
												<tbody>
													<tr>
														<td>${i.p_name }</td>
														<td style="width: 505px;">${i.p_contents }</td>
														<td style="width:100px;height:100px">${i.p_img1 }</td>
														<td>${i.p_price }</td>
														<td class="text-primary">${i.p_quantity }</td>
														<td>
															<a href="${pageContext.request.contextPath }/GetProductController?num=${i.p_num }">
																<button class="btn btn-primary pull-left">수정</button>
															</a>
															<a href="${pageContext.request.contextPath }/ProductDelController?num=${i.p_num }">
																<button class="btn btn-primary pull-left">삭제</button>
															</a>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="pull-right" style=" display: flex; ">
						<select style=" margin: 8px; ">
							<option value="1">물품명</option>
							<option value="2">내용</option>
						</select>
						<span class="input-group no-border"><input type="text" class="form-control" placeholder="Search..."></span>
						<button class="btn btn-primary pull-right">검색</button>
					</div>
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item"><a class="page-link" href="#">Back</a></li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">Next</a></li>
					  </ul>
					</nav>
				</div>
			</div>
			<jsp:include page="/jsp/comn/admin-footer.jsp" />
			
			<div id="id01" class="w3-modal">
				<div class="w3-modal-content">
					<div class="w3-container" style=" padding: 19px; ">
						<span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>
						<p>SUPPLEMENTS 소메뉴</p>
						<p>보고 싶은 소메뉴를 클릭하세요</p>
						<button class="btn btn-primary pull-left" id="SUPPLEMENTS1">운동전(부스터)</button>
						<button class="btn btn-primary pull-left" id="SUPPLEMENTS2">운동중(지구력)</button>
						<button class="btn btn-primary pull-left" id="SUPPLEMENTS3">운동후(회복)</button>
					</div>
				</div>
			</div>
			<div id="id02" class="w3-modal">
				<div class="w3-modal-content">
					<div class="w3-container" style=" padding: 19px; ">
						<span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-display-topright">&times;</span>
						<p>AMINO 소메뉴</p>
						<p>보고 싶은 소메뉴를 클릭하세요</p>
						<button class="btn btn-primary pull-left" id="AMINO1">복합 아미노산</button>
						<button class="btn btn-primary pull-left" id="AMINO2">BCAA</button>
						<button class="btn btn-primary pull-left" id="AMINO3">EAA</button>
					</div>
				</div>
			</div>
			<div id="id03" class="w3-modal">
				<div class="w3-modal-content">
					<div class="w3-container" style=" padding: 19px; ">
						<span onclick="document.getElementById('id03').style.display='none'" class="w3-button w3-display-topright">&times;</span>
						<p>PROTEIN 소메뉴</p>
						<p>보고 싶은 소메뉴를 클릭하세요</p>
						<button class="btn btn-primary pull-left" id="PROTEIN1">복합 단백질</button>
						<button class="btn btn-primary pull-left" id="PROTEIN2">체중증가/게이너</button>
						<button class="btn btn-primary pull-left" id="PROTEIN3">카제인 단백질</button>
					</div>
				</div>
			</div>
			<div id="id04" class="w3-modal">
				<div class="w3-modal-content">
					<div class="w3-container" style=" padding: 19px; ">
						<span onclick="document.getElementById('id04').style.display='none'" class="w3-button w3-display-topright">&times;</span>
						<p>VITAMIN 소메뉴</p>
						<p>보고 싶은 소메뉴를 클릭하세요</p>
						<button class="btn btn-primary pull-left" id="VITAMIN1">남성 비타민(철분제외)</button>
						<button class="btn btn-primary pull-left" id="VITAMIN2">여성/임산부 비타민</button>
						<button class="btn btn-primary pull-left" id="VITAMIN3">장년 비타민</button>
						<button class="btn btn-primary pull-left" id="VITAMIN4">유아/어린이 비타민</button>
					</div>
				</div>
			</div>
			<div id="id05" class="w3-modal">
				<div class="w3-modal-content">
					<div class="w3-container" style=" padding: 19px; ">
						<span onclick="document.getElementById('id05').style.display='none'" class="w3-button w3-display-topright">&times;</span>
						<p>EXERCISE 소메뉴</p>
						<p>보고 싶은 소메뉴를 클릭하세요</p>
						<button class="btn btn-primary pull-left" id="EXERCISE1">쉐이커 & 물통</button>
						<button class="btn btn-primary pull-left" id="EXERCISE2">장갑 & 벨트 & 스트랩</button>
						<button class="btn btn-primary pull-left" id="EXERCISE3">관절 보호대</button>
						<button class="btn btn-primary pull-left" id="EXERCISE4">피트니스 용품</button>
					</div>
				</div>
			</div>
			
</body>

</html>