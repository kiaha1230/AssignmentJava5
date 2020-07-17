
<%
	String view = request.getParameter("view");

	if (view.startsWith("users/")) {
		pageContext.forward("blank-layout.jsp");
	} else {
		pageContext.forward("layout.jsp");
	}
%>