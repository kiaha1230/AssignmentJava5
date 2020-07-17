<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-12 mt-5">
	<div class="card">
		<div class="card-body">
			<h4 class="header-title">
				<s:message code="global.menu.statistic.staff" />
			</h4>
			<div class="data-tables">
				<table id="dataTable" class="text-center">
					<thead class="text-uppercase bg-dark">
						<tr class="text-white">
							<th scope="col"><s:message code="staff.name" /></th>
							<th scope="col"><s:message code="record.compliment" /></th>
							<th scope="col"><s:message code="record.discipline" /></th>
							<th scope="col"><s:message code="global.total" /></th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${arrays}" var="a">
							<tr>
								<td>${a[0]}</td>
								<td>${a[1]}</td>
								<td>${a[2]}</td>
								<td>${a[1]-a[2]}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

