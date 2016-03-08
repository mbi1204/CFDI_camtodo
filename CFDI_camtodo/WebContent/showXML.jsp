<%@page import="com.sinergitec.model.Documento"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
  
  List<Documento> lista =  (List<Documento>) session.getAttribute("ListaDocumento");

  String serie  =  session.getAttribute("serie").toString();
  int    folio  =  Integer.parseInt(session.getAttribute("folio").toString());
  
  for(Documento obj: lista) {
	 
	  if((obj.getFolio() == folio) &&  (obj.getSerie().equals(serie)) ) { 
	
		  response.setContentType("xml/plain");
		  response.setHeader("Content-Type", "application/xml");		  
		  response.setHeader("Content-Disposition", "attachment;filename="+ obj.getSerie() + obj.getFolio() + ".xml");
		  response.setContentLength((int)obj.getXml().length);
		  response.setHeader("Content-Length", String.valueOf(obj.getXml().length));
		  response.getOutputStream().write(obj.getXml(), 0, obj.getXml().length);
		  response.flushBuffer();
		  break;
		  }  
  }
  %>

</body>
</html>