<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

${message }
<form:form method="post" enctype="multipart/form-data"
	action="staffs/edit.htm" modelAttribute="StaffEntity">
	<div class="main-content-inner">
		<div class="row">
			<div class="col-lg-6 col-ml-12">
				<div class="row">
					<!-- Textual inputs start -->
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<h4 class="header-title">
									<s:message code="global.menu.staff" />
								</h4>
								<p class="text-muted font-14 mb-4">
									<s:message code="staff.title.edit" />
								</p>
								<div class="form-group">
									<label for="example-text-input" class="col-form-label"><s:message code="staff.id" /></label>
									<form:select items="${staffEntities}" itemValue="Id"
										itemLabel="Id" class="form-control" name="Id"
										id="example-text-input" path="Id" />
								</div>
								<div class="form-group">
									<label for="example-text-input" class="col-form-label"><s:message code="staff.name" /></label>
									<form:input path="Name" class="form-control" type="text"
										name="Name" id="example-text-input" required="required" />
								</div>
								<div class="form-group">
									<label for="example-email-input" class="col-form-label"><s:message code="staff.gender" /></label>
									<div>
										<div class="custom-control custom-radio custom-control-inline">
											<form:radiobutton path="Gender" id="customRadio4"
												name="Gender" class="custom-control-input" value="1" />
											<label class="custom-control-label" for="customRadio4"> <s:message code="staff.male" />
											</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<form:radiobutton path="Gender" id="customRadio5"
												name="Gender" value="0" class="custom-control-input" />
											<label class="custom-control-label" for="customRadio5"> <s:message code="staff.female" />
											</label>
										</div>

									</div>
								</div>
								<div class="form-group">
									<label for="example-date-input" class="col-form-label"><s:message code="staff.birthday" /></label>
									<form:input path="Birthday" class="form-control" type="date"
										name="Birthday" id="example-date-input" required="required" />
								</div>
								<input type="hidden" value="${StaffEntity.getPhoto()}"
									name="here">
								<div class="form-group">
									<label for="example-date-input" class="col-form-label"><s:message code="staff.photo" /></label>
									<br> <b><s:message code="staff.img" /> : <input
										value=" ${StaffEntity.getPhoto()}" disabled="disabled" />
									</b> <br>
									<hr>

									<div>
										<img src="images/${StaffEntity.getPhoto()}" width=100
											height=100>
									</div>
									<hr>
									<div>
										<input type="file" name="Photo" id="file-2"
											class="inputfile inputfile-2" /> <label for="file-2"><svg
												xmlns="http://www.w3.org/2000/svg" width="20" height="17"
												viewBox="0 0 20 17">
															<path
													d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z" /></svg>
											<span>Choose a file&hellip;</span></label>
									</div>

									<div class="form-group">
										<label for="example-email-input" class="col-form-label"><s:message code="staff.email" /></label>
										<form:input path="Email" class="form-control" type="email"
											name="Email" placeholder="name@example.com"
											id="example-email-input" required="required" />
									</div>
									<div class="form-group">
										<label for="example-text-input" class="col-form-label"><s:message code="staff.phone" /></label>
										<form:input path="Phone" class="form-control" type="text"
											name="Phone" id="example-text-input" required="required" />
									</div>
									<div class="form-group">
										<label for="example-text-input" class="col-form-label"><s:message code="staff.salary" /></label>
										<form:input path="Salary" class="form-control" type="number"
											name="Salary" id="example-text-input" required="required" />
									</div>
									<div class="form-group">
										<label for="example-text-input" class="col-form-label"><s:message code="staff.note" /></label>
										<form:input path="Notes" class="form-control" type="text"
											name="Note" id="example-text-input" required="required" />
									</div>
									<div class="form-group">
										<label for="example-text-input" class="col-form-label"><s:message code="depart.name" />
											</label>
										<form:select items="${departEntities}" itemValue="Id"
											path="departEntity.Id" class="form-control" itemLabel="Name"
											name="DepartId" id="example-text-input" />
									</div>
									<button class="btn btn-primary" type="submit"><s:message code="global.submit" />
										</button>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</form:form>
