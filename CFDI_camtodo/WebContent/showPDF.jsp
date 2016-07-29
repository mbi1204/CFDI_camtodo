<%@page import="org.eclipse.jdt.internal.compiler.ast.TryStatement"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.sinergitec.model.Documento"%>
<%@page import="java.util.List"%>
<%@page import= "java.io.InputStream" %>
<%@page import= "java.io.ByteArrayInputStream" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
  List<Documento> lista = (List<Documento>)session.getAttribute("ListaDocumento");
  String serie  =  session.getAttribute("serie").toString();
  int    folio  =  Integer.parseInt(session.getAttribute("folio").toString());

  for(Documento obj: lista) {
	  response.setContentType("application/pdf");
	  response.setHeader("Content-Disposition", "inline;filename="+ obj.getSerie() + obj.getFolio() );

	  if((obj.getFolio() == folio) &&  (obj.getSerie().equals(serie)) ) {
		  //response.setContentType("pdf/plain");
		  //response.setHeader("Content-Type", "application/pdf");
		  response.setHeader("Content-Disposition", "attachment;filename="+ obj.getSerie() + obj.getFolio() + ".pdf" );
		  response.setContentLength((int)obj.getPdf().length);
		  response.setHeader("Content-Length", String.valueOf(obj.getPdf().length));
		  response.getOutputStream().write(obj.getPdf(), 0, obj.getPdf().length);
		  response.getOutputStream().flush();
		}
	  } 
  
  %>


</body>
</html>