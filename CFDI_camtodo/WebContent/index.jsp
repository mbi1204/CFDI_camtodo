<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comprobantes Fiscales Digitales por Internet</title>

<link rel="stylesheet" type="text/css" media="screen" href="css/template.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/normalize.css">
<link rel="shortcut icon" type="image/x-icon" href="img/logo.ico" />
<link rel="icon" type="image/png" href="img/file-text.png" /> 

</head>
<body onload="cargar()">

<div id = "banner" class = "banner">
	<div id = "logo" class = "logo"><a href="/CFDI_camtodo"><img class = "logoEmpresa" src="img/logo.jpg" alt="Camiseria TODO"></a></div>
	<div id = "slider" class = "slider">
		<img src="img/slider.png">  		
	</div>
</div>


<div id="container" class = "container" >

	<div id="site_title" class = "site_title"><a href="index.html"></a></div>
	
	<h1>En Camiseria TODO estamos para atenderte.</h1>
	<div class="one-half last" > 	
	  <form action="CFDI" method="post" onsubmit="return validar();" name="form1" >
   	    <table style="margin: auto;" >
	    	<tr>
	    		<td colspan="2" style="size: 25px; color: #000; alignment-adjust: auto;" align="center" >COMPROBANTES FISCALES DIGITALES POR INTERNET</td>
	    	</tr>
	    	
	    	<tr>
	    		<td style="size: 12px; margin:auto;" align="right" >RFC:</td>
	    		<td><input type="text" name="rfc" id="rfc" style="width:336px"></td>
	    	</tr>
	    	
	    	<tr>
	    		<td style="size: 12px; margin:auto" align="right" >SERIE:</td>
	    		<td><input type="text" name="serie" id="serie" style="width:336px"></td>
	    	</tr>
	    	
	    	
	    	<tr>
	    		<td style="size: 12px; margin:auto" align="right" >FOLIO:</td>
	    		<td><input type="text" name="folio" id="folio" onkeypress="return isNumberKey(event)" style="width:336px"></td>
	    	</tr>
	    	
	    	
	    	<tr>
	    	 	<td colspan="2" align="center"><input class="boton" type="submit" value="Ingresar"  style="font-size: 20px; "></td>
	    	</tr>
	    	
	    	<tr>	    	
	    	<td colspan="2" style="color: red; font-weight: bold; text-align: justify; font-size: 16px; text-align: center;"
	    	    align="center" id="error"><%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
	    	</td>
	    	</tr>
	    	
		</table>
	  </form>
	</div>
	
	
	 <div class="one-half last" align="center">
	 
	<h2 style="color: #000;">Los datos se encuentran en su ticket de compra. </h2>
	<p style="color: #000;">&nbsp;</p>
	<img src="img/ticket.jpg" width="500px" height="200px" >
	 
  	</div>

	<div style="clear:both; height: 40px"></div>
</div><!-- close container -->

<!--  <div id="footer">
<div class="one-fourth last">
        <p>Siguenos en:</p>
        <a href="https://www.facebook.com/Camiseria-Todo-232680530197687/timeline?ref=page_internal" target="_blank"><img src="img/facebook-icon.png" alt="Facebook" width="32px" height="32px"></a>
        <a href="https://twitter.com/CamiseriaTodo" target="_blank"><img src="img/twitter-icon.png" alt="Twitter" width="32px" height="32px"></a>
		<div id="social_icons">Sitio Administrado por: <a href="#">www.sinergitec.com</a><br />e-mail: <a href="#" title="Dieter Schneider Photography">soporte@sinergitec.mx</a></div>
</div> -->

<div style="clear:both"></div>

<!-- </div> END footer -->

<div align="center"><!-- Main Menu -->
      
</div>


<script type="text/javascript" src="js/view/index.js"></script>
<script type="text/javascript" src="js/lib/jquery-3.1.0.js"></script>


</body>
</html>