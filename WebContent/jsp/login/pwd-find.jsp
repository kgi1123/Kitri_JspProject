<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var params;
   $(document).ready(function(){
      
      //$("#find_btn").keyup(function(e){if(e.keyCode == 13)  find(); });
      $("#find_btn").click(function (){
         params = $("#pwd-find-form").serialize();
         $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/MemPwdFindController",
            data:params,
            timeout:5000,
            success:function(data) {
               //$('pwd-find-form').submit();
               //$('pwd-find-form').load("${pageContext.request.contextPath}/pwd-find-result.jsp");
               alert(data);
            }
         });
      });
   });
</script>
<title>비밀번호 찾기</title>
</head>
<div class="modal-header">
<h3>비밀번호 찾기</h3>
</div>
<div class="modal-body">
   <div class="w3-center w3-large w3-margin-top">
      
   </div>
   <div>
   <form name="pwd-find-form" id="pwd-find-form">
      <p>
         <label>ID</label>
         <input class="w3-input" type="text" id="id" name="id">
      </p>
      <p>
         <label>Email</label>
         <input class="w3-input" type="text" id="email" name="email">
      </p>
   </form>
   </div>
</div>
<div class="modal-footer">
      <p class="w3-center">
         <button type="submit" id=find_btn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
         <button type="button" data-dismiss="modal" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
      </p>
</div>
</html>