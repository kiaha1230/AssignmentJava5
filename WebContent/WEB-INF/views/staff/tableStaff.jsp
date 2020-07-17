<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page pageEncoding="utf-8"%>
<div class="col-12 mt-5">
	<div class="card">
		<div class="card-body">
			<h3 class="header-title">
				<s:message code="global.menu.staff" />
			</h3>
			<div class="data-tables">
				<table id="dataTable" class="text-center">
					<thead class="text-uppercase bg-dark">
						<tr class="text-white">
							<th scope="col"><s:message code="staff.id" /></th>
							<th scope="col"><s:message code="staff.name" /></th>
							<th scope="col"><s:message code="staff.gender" /></th>
							<th scope="col"><s:message code="staff.birthday" /></th>
							<th scope="col"><s:message code="staff.photo" /></th>
							<th scope="col"><s:message code="staff.email" /></th>
							<th scope="col"><s:message code="staff.phone" /></th>
							<th scope="col"><s:message code="staff.salary" /></th>
							<th scope="col"><s:message code="staff.note" /></th>
							<th scope="col"><s:message code="depart.name" /></th>
							<th scope="col"><s:message code="global.action" /></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${StaffList}" var="s">
							<tr>
								<td>${s.getId()}</td>
								<td>${s.getName()}</td>
								<td>${s.getGender()}</td>
								<td>${s.getBirthday()}</td>
								<td><img src="images/${s.getPhoto()}" width=100 height=100></td>
								<td>${s.getEmail()}</td>
								<td>${s.getPhone()}</td>
								<td>${s.getSalary()}</td>
								<td>${s.getNotes()}</td>
								<td>${s.getDepartEntity().getName()}</td>
								<td>

									<div class="icon-container">
										<a class="ti-plus"
											href="http://localhost:8080/AssignmentJava5/staffs/add.htm"><i
											class="icon-name"></i> </a>

									</div>
									<div class="icon-container">
										<a class="ti-pencil-alt" onclick="delete();"
											href="http://localhost:8080/AssignmentJava5/staffs/edit.htm?Id=${s.getId()}"><i
											class="icon-name"></i> </a>

									</div>
									<div class="icon-container">
										<a class="ti-trash"
											href="http://localhost:8080/AssignmentJava5/staffs/delete.htm?Id=${s.getId()}"><i
											class="icon-name"></i> </a>

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

