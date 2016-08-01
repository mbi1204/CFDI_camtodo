/**
 * 
 */

function cargar() {
	document.getElementById("rfc").focus();	
}


function validar(){
	var rfc   = document.getElementById("rfc");
	var serie = document.getElementById("serie");
	var folio = document.getElementById("folio");
	
	if (rfc.value == "" || rfc.value == '' || rfc.value == null ){
		alert("Ingresa Cliente");
		rfc.focus();
		return false;
		
	}else if (serie.value == "" || serie.value == "" || serie.value == null ){
		alert("Ingresa Serie");
		serie.focus();
		return false;
		
	}else if (folio.value == "" || folio.value == "" || folio.value == null){
		alert("Ingresa Folio");
		folio.focus();
		return false;
		
	}else {
		return true;
	}
}

function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode;
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}