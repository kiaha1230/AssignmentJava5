<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page pageEncoding="utf-8"%>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<div class="col-12 mt-5">
	<div class="card">
		<div class="card-body">
			<h4 class="header-title">
				<s:message code="global.menu.record" />
			</h4>
			<div class="data-tables">
				<table id="dataTable" class="text-center">
					<thead class="text-uppercase bg-dark">
						<tr class="text-white">
							<th scope="col"><s:message code="record.id" /></th>
							<th scope="col"><s:message code="staff.name" /></th>
							<th scope="col"><s:message code="record.type" /></th>
							<th scope="col"><s:message code="record.reason" /></th>
							<th scope="col"><s:message code="record.date" /></th>
							<th scope="col"><s:message code="global.action" /></th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${RecordList}" var="s">
							<tr>
								<td>${s.getId()}</td>
								<td>${s.getStaffEntity().getName()}</td>
								<td>${s.getStringType()}</td>
								<td>${s.getReason()}</td>
								<td>${s.getDate()}</td>
								<td>
									<div>
										<div class="icon-container">
											<a class="ti-plus"
												href="http://localhost:8080/AssignmentJava5/record/add.htm"><i
												class="icon-name"></i> </a>
										</div>
										<div class="icon-container">
											<a class="ti-pencil-alt"
												href="http://localhost:8080/AssignmentJava5/record/edit.htm?Id=${s.getId()}"><i
												class="icon-name"></i> </a>
										</div>
										<div class="icon-container">
											<a class="ti-trash"
												href="http://localhost:8080/AssignmentJava5/record/delete.htm?Id=${s.getId()}"><i
												class="icon-name"></i> </a>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	function confirm() {
		var txt;
		var r = confirm("Press a button!");
		if (r == true) {
			txt = "You pressed OK!";
		} else {
			txt = "You pressed Cancel!";
		}
	}
</script>
