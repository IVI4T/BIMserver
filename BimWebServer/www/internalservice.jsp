<%@page import="org.bimserver.interfaces.objects.SEService"%>
<%@page import="org.bimserver.interfaces.objects.SQueryEnginePluginDescriptor"%>
<%@page import="org.bimserver.interfaces.objects.SQueryEngine"%>
<%@page import="org.bimserver.interfaces.objects.SIfcEnginePluginDescriptor"%>
<%@page import="org.bimserver.interfaces.objects.SIfcEngine"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="org.bimserver.interfaces.objects.SObjectIDMPluginDescriptor"%>
<%@ include file="header.jsp"%>
<%@page import="org.bimserver.interfaces.objects.SSerializer"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="org.bimserver.utils.Formatters"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="org.bimserver.interfaces.objects.SUserType"%>
<%@page import="org.bimserver.shared.interfaces.ServiceInterface"%>
<%@page import="org.bimserver.shared.exceptions.ServiceException"%>
<%@page import="org.bimserver.interfaces.objects.SObjectIDM"%>
<div class="sidebar">
<ul>
</ul>
</div>
<div class="content">
<h1>Service</h1>
<fieldset>
<%
	String name = request.getParameter("name");
	String className = request.getParameter("className");
	long id = Long.parseLong(request.getParameter("id"));
	if (request.getParameter("update") != null) {
		SEService seService = loginManager.getService().getEServiceById(id);
		seService.setName(name);
		seService.setClassName(className);
		loginManager.getService().updateSEService(seService);
		response.sendRedirect("internalservices.jsp");
	} else {
		SEService seService = loginManager.getService().getEServiceById(id);
		if (name == null) {
			name = seService.getName();
		}
		if (className == null) {
			className = seService.getClassName();
		}
	}
%>
<form>
<input type="hidden" name="id" value="<%=id%>"/>
<table>
<tr>
	<td><label for="name">Name</label></td>
	<td><input name="name" id="name" value="<%=name%>"></input></td>
</tr>
<tr>
	<td></td>
	<td><input name="update" type="submit" value="Update"/></td>
</tr>
</table>
</form>
</fieldset>
</div>
<script>
$(function(){
	$("#name").focus();
});
</script>
<%@ include file="footer.jsp"%>