<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MemberList.jsp</title>

<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function()
	{
		$(".btnDelete").click(
				function()
				{
					if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
					{
						$(location).attr("href","memberdelete.action?mid=" + $(this).val());
                                                //----이페이지요청하면서 //---이거 넘겨주고   //클릭시 주소창에 제대로 뜨는지 확인 → 인터페이스가서 정의하고 컨트롤러로~
					}
				});

		$(".btnUpdate").click(function()
		{
			$("title").html("회원 정보 수정").css(
			{
				"color" : "red",
				"font-weight" : "bold"
			});

			var mid = $(this).parents("tr").find("td:eq(0)").text();
			var name = $(this).parents("tr").find("td:eq(1)").text(); // 부모 tr의 0번째 td의 글자
			var telephone = $(this).parents("tr").find("td:eq(2)").text();

			$("#mid").val(mid);
			$("#name").val(name);
			$("#telephone").val(telephone);

			$("form").attr("action", "memberupdate.action"); // 지금은 action 속성이 memberinsert.action인데 이것을 바꾸겠다.
		});
		
		
		$(".btnCancle").click(function()
		{
			$("title").html("회원 정보 수정").css(
					{
						"color" : "black",
						"font-weight" : "normal"
					});
			$("form").attr("action", "memberinsert.action"); 
		});
		
	});
</script>
</head>
<body>
	<div>
		<h1>회원 정보</h1>
		<hr>
	</div>

	<div class="container">
		<div class="panel-group">
			<div class="panel-default">
				<div class="panel-heading" id="title">회원 정보 입력</div>
				<div class="panel-body">
					<form role="form" action="memberinsert.action" method="post">
						<!-- role : 어떤 역할을 수행한다~ -->
						<input type="hidden" id="mid" name="mid">

						<div class="form-group">
							<label for="name"> NAME: </label> <input type="text"
								class="form-control" id="name" name="name">
						</div>
						<div class="form-group">
							<label for="telephone"> TELEPHONE: </label> <input type="tel"
								class="form-control" id="telephone" name="telephone">
						</div>
						<button type="submit" class="btn btn-success btn-sm">SUBMIT</button>
						<button type="reset" class="btn btn-success btn-sm btnCancel">CANCEL</button>
					</form>
				</div>
			</div>
			<!-- close .panel-default -->

			<div class="panel panel-default">
				<div class="panel-heading">회원 정보 출력</div>
				<div class="panel-body">
					<table class="table">
						<thead>
							<tr>
								<th>MID</th>
								<th>NAME</th>
								<th>TELEPHONE</th>
								<th>삭제 / 수정</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="member" items="${list }">
								<tr>
									<td>${member.mid }</td>
									<td>${member.name }</td>
									<td>${member.telephone }</td>
									<td>
										<button type="button" class="btn btn-danger btn-xs btnDelete"
											value="${member.mid }">삭제</button>
										<button type="button" class="btn btn-primary btn-xs btnUpdate"
											value="${member.mid }">수정</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-default btn-sm">
						Count <span class="badge">${count }</span>
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>