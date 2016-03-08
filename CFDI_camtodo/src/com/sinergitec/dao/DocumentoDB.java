package com.sinergitec.dao;

import java.io.IOException;
import java.util.List;

import com.progress.open4gl.Open4GLException;
import com.sinergitec.model.Documento;

public interface DocumentoDB {
	
	public List<Documento> cargaDigitales(String cliente , String Serie , Integer Folio ) throws Open4GLException, IOException;

}
