<%@page import="com.sinergitec.model.Documento"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>COMPROBANTES FISCALES DIGITALES POR INTERNET</title>

<link rel="stylesheet" type="text/css" media="screen" href="css/template.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/normalize.css">
<link rel="shortcut icon" type="image/x-icon" href="img/logo.ico" />
<link rel="icon" type="image/png" href="img/file-text.png" />
</head>
<body>

<div id = "banner" class = "banner">
	<div id = "logo" class = "logo"><img class = "logoEmpresa" src="img/logo.jpg" alt="Camiseria TODO"></div>
	<div id = "slider" class = "slider">
		<img src="img/slider.png">  		
	</div>
</div>

<div id="container" >
	<div id="site_title"><a href="index.html"></a></div>
	
	<h1>COMPROBANTES FISCALES DIGITALES POR INTERNET</h1>
	   


<table>
<tr>
<th>SERIE</th> <th>FOLIO</th> <th>CLIENTE</th> <th>Razon Social</th> <th>PDF</th> <th>XML</th>
</tr>

<%
List<Documento> lista = (List<Documento>)session.getAttribute("ListaDocumento");
for(Documento obj:lista ){
%>
  <tr>
  <td> <%= obj.getSerie() %> </td>
  <td> <%= obj.getFolio() %> </td>   
  <td> <%= obj.getRfc() %> </td>  
  <td> <%= obj.getRazon() %> </td>
  <td><a href="showPDF.jsp"><img src="img/pdf.bmp"></a></td> 
  <td><a href="showXML.jsp"><img src="img/xml.bmp"></a></td>
  
  
<%--   <td><a href="showPDF.jsp?serie= <%=obj.getSerie()%>?folio= <%=obj.getFolio()%>"/> PDF </a></td> --%>
  
<%--   <td><a href="showXML.jsp?serie =<%= obj.getSerie() %>"/>XML </a></td> --%>
  
 
  
<%--   <td><a href="<%= request.getContextPath() %>/showFile.jsp?file=<s:property value="contador"/>" target="_blank">Archivo</a></td> --%>
<%--   <td><a href="<%= request.getContextPath() %>/showFile.jsp?file=<s:property value="contador"/>" target="_blank">Archivo</a></td> --%>
  
 
  </tr>
   
<%	
}
%>


</table>



<div style="clear:both; height: 40px"></div>
</div><!-- close container -->

<div id="footer">
<div class="one-fourth last">
        <p>Siguenos en:</p>
        <a href="https://www.facebook.com/Camiseria-Todo-232680530197687/timeline?ref=page_internal" target="_blank"><img src="img/facebook-icon.png" alt="Facebook" width="32px" height="32px"></a>
        <a href="https://twitter.com/CamiseriaTodo" target="_blank"><img src="img/twitter-icon.png" alt="Twitter" width="32px" height="32px"></a>
		<div id="social_icons">Sitio Administrado por: <a href="#">www.sinergitec.com</a><br />e-mail: <a href="#" title="Dieter Schneider Photography">soporte@sinergitec.mx</a></div>
</div>

<div style="clear:both"></div>
  
</div> <!-- END footer -->
</body>
</html>