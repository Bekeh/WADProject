<jsp:include page="header.jsp" /> 

<%session.invalidate();
response.sendRedirect("index.jsp");
%>