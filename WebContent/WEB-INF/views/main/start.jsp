<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-12 mt-5">
	<div class="card">
		<div class="card-body">
			<h4 class="header-title">
				<s:message code="global.SOTW" />
			</h4>
			<div class="single-table">
				<div class="table-responsive">
					<table class="table text-center">
						<thead class="text-uppercase bg-dark">
							<tr class="text-white">
								<th scope="col"><s:message code="global.no" /></th>
								<th scope="col"><s:message code="staff.name" /></th>
								<th scope="col"><s:message code="staff.photo" /></th>
								<th scope="col"><s:message code="depart.name" /></th>
								<th scope="col"><s:message code="record.compliment" /></th>
								<th scope="col"><s:message code="record.discipline" /></th>
								<th scope="col"><s:message code="global.total" /></th>

							</tr>
						</thead>
						<tbody>
							<c:set var="b" value="0"></c:set>
							<c:forEach items="${arrays}" var="a">
								<c:set var="b" value="${b +1}"></c:set>
								<tr>
									<td>${b}</td>
									<td>${a[0]}</td>
									<td><img src="images/${a[1]}" width=100 height=100></td>
									<td>${a[2]}</td>
									<td>${a[3]}</td>
									<td>${a[4]}</td>
									<td><b>${a[3]-a[4]}</b></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>