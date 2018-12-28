<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <div class="sidebar" data-color="purple" data-background-color="black" data-image="${pageContext.request.contextPath }/assets/img/sidebar-2.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo">
		<a href="${pageContext.request.contextPath }/jsp/admin/dashBoard.jsp" class="simple-text logo-normal">
          	강한남자
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/jsp/admin/dashBoard.jsp">
              <i class="material-icons">dashboard</i>
              <p>Dashboard</p>
            </a>
          </li>
          <c:if test="${sessionScope.m_id eq 'admin' }">
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/MemberListController">
              <i class="material-icons">person</i>
              <p>User List</p>
            </a>
          </li>
          </c:if>
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath }/AdminListController?optionVal=0&p_cate1=1&p_cate2=1">
              <i class="material-icons">content_paste</i>
              <p>Table List</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
