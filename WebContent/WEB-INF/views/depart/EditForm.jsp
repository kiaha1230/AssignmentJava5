<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
${message }
<form:form method="post" enctype="multipart/form-data"
	action="depart/edit.htm" modelAttribute="DepartEntity">
	<div class="main-content-inner">
		<div class="row">
			<div class="col-lg-6 col-ml-12">
				<div class="row">
					<!-- Textual inputs start -->
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">
								<h4 class="header-title">
									<s:message code="global.menu.depart" />
								</h4>
								<p class="text-muted font-14 mb-4">
									<s:message code="depart.title.edit" />
								</p>
								<div class="form-group">
									<label for="example-text-input" class="col-form-label"><s:message
											code="depart.id" /></label>
									<form:select path="Id" items="${DepartEntities}" itemLabel="Id"
										itemValue="Id" class="form-control" type="text" name="Name"
										id="example-text-input" />
								</div>
								<div class="form-group">
									<label for="example-text-input" class="col-form-label"><s:message
											code="depart.name" /></label>
									<form:input path="Name" class="form-control" type="text"
										name="Name" id="example-text-input" required="required" />
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
</form:form>
