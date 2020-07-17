<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-12 mt-5">
	<div class="card">
		<div class="card-body">
			<h4 class="header-title">
				<s:message code="global.menu.depart" />
			</h4>
			 <div class="data-tables">
			 <table id="dataTable" class="text-center">
						<thead class="text-uppercase bg-dark">
							<tr class="text-white">
								<th scope="col"><s:message code="depart.id" /></th>
								<th scope="col"><s:message code="depart.name" /></th>
								<th scope="col"><s:message code="global.action" /></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${DepartList}" var="s">
								<tr>
									<td>${s.getId()}</td>
									<td>${s.getName()}</td>
									<td><div>
											<div class="icon-container">
												<a class="ti-plus"
													href="http://localhost:8080/AssignmentJava5/depart/add.htm"><i
													class="icon-name"></i> </a>

											</div>
											<div class="icon-container">
												<a class="ti-pencil-alt"
													href="http://localhost:8080/AssignmentJava5/depart/edit.htm?Id=${s.getId()}"><i
													class="icon-name"></i> </a>

											</div>
											<div class="icon-container">
												<a class="ti-trash"
													href="http://localhost:8080/AssignmentJava5/depart/delete.htm?Id=${s.getId()}"><i
													class="icon-name"></i> </a>

											</div>
										</div></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

