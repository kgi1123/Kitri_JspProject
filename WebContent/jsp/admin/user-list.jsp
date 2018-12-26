<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<jsp:include page="/jsp/comn/admin-head.jsp" />
</head>

<body class="dark-edition">
	<div class="wrapper ">
		<jsp:include page="/jsp/comn/admin-left1.jsp" />
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
									<h4 class="card-title ">유저목록</h4>
									<p class="card-category">현제 홈페이지에 가입되어있는 사람들의 목록입니다.</p>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<table class="table">
											<thead class=" text-primary">
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>주소</th>
												<th>이메일</th>
												<th>타입</th>
											</thead>
											<c:forEach var="i" items="${list }">
											<tbody>
												<tr>
													<td>${i.m_id }</td>
													<td>${i.m_name }</td>
													<td>${i.m_phone }</td>
													<td>${i.m_address }</td>
													<td>${i.m_email }</td>
													<c:choose>
														<c:when test="${i.m_type eq 1}">
															<td class="text-primary">관리자</td>
														</c:when>
														<c:when test="${i.m_type eq 2}">
															<td class="text-primary">판매자</td>
														</c:when>
														<c:when test="${i.m_type eq 3}">
															<td class="text-primary">구매자</td>
														</c:when>
													</c:choose>
													
												</tr>
											</c:forEach>	
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="pull-right" style=" display: flex; ">
						<select style=" margin: 8px; ">
							<option value="1">아이디</option>
							<option value="2">비밀번호</option>
						</select>
						<span class="input-group no-border"><input type="text" class="form-control" placeholder="Search..."></span>
						<button class="btn btn-primary pull-right">검섹</button>
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
		</div>
</body>

</html>