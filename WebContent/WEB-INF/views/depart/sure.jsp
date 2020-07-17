<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<form:form method="post" enctype="multipart/form-data"
	action="depart/.htm" modelAttribute="DepartEntity">
	<div class="main-content-inner">
		<div class="row">
			<div class="col-lg-6 col-ml-12">
				<div class="row">
					<!-- Textual inputs start -->
					<div class="col-12 mt-5">
						<div class="card">
							<div class="card-body">

								<h4>
								<input name="Id" type="hidden" value="${departEntity.getId()}">
									<i> ${departEntity.getName() }</i> -
									<s:message code="staff.announcement" />

								</h4>
								<br> <br>
								<div class="invoice-buttons text-center">
									<button class="btn btn-primary" name="yes"><s:message code="global.yes" /></button>

									<button class="btn btn-primary" name="no"><s:message code="global.noo" /></button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form:form>
