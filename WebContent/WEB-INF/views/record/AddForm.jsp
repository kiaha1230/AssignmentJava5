<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
${message }
<form:form method="post" enctype="multipart/form-data"
	action="record/add.htm" modelAttribute="RecordEntity">
	<div class="main-content-inner">
		<div class="row">
			<div class="col-lg-6 col-ml-12">
				<div class="row">
					<!-- Textual inputs start -->
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<h4 class="header-title">
									<s:message code="global.menu.record" />
								</h4>
								<p class="text-muted font-14 mb-4">
									<s:message code="record.title" />
								</p>

								<div class="form-group">

									<label for="example-email-input" class="col-form-label"><s:message
											code="record.type" /></label>
									<div>
										<div class="custom-control custom-radio custom-control-inline">
											<form:radiobutton path="Type" id="customRadio4" name="Type"
												class="custom-control-input" value="1" />
											<label class="custom-control-label" for="customRadio4"><s:message
													code="record.compliment" /> </label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
											<form:radiobutton path="Type" id="customRadio5" name="Type"
												value="0" class="custom-control-input" />
											<label class="custom-control-label" for="customRadio5"><s:message
													code="record.discipline" /> </label>
										</div>
									</div>
									<div class="form-group">
										<label for="example-text-input" class="col-form-label"><s:message
												code="record.reason" /></label>
										<form:input path="Reason" class="form-control" type="text"
											id="example-text-input" required="required" />
										<div class="form-group">
											<label for="example-date-input" class="col-form-label"><s:message
													code="record.date" /></label>
											<form:input path="Date" class="form-control" type="date"
												name="Birthday" id="example-date-input" required="required" />
										</div>
										<div class="form-group">
											<label for="example-text-input" class="col-form-label"><s:message
													code="staff.name" /></label>
											<form:select items="${staffEntities}" itemValue="Id"
												itemLabel="Name" class="form-control"
												id="example-text-input" path="staffEntity.Id" />
										</div>
										<button class="btn btn-primary" type="submit">
											<s:message code="global.submit" />
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form:form>
