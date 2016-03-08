package com.sinergitec.dao.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import camtodo.sinergitec.app.AppServer;
import com.progress.open4gl.BooleanHolder;
import com.progress.open4gl.Open4GLException;
import com.progress.open4gl.ProResultSet;
import com.progress.open4gl.ResultSetHolder;
import com.progress.open4gl.StringHolder;
import com.progress.open4gl.javaproxy.Connection;
import com.sinergitec.cfdi.util.DBConexion;
import com.sinergitec.dao.DocumentoDB;
import com.sinergitec.model.Documento;

public class DocumentoDBImpl implements DocumentoDB {

	public List<Documento> cargaDigitales(String cliente , String Serie , Integer Folio ) throws Open4GLException, IOException{
		
		System.out.println("Entro en el DAO Implements");
		
		System.out.println("Este es cliente: "+cliente);
		System.out.println("Esta es la serie: "+Serie);
		System.out.println("Este es el folio: "+Folio);
		
		List<Documento> al_Documento = new ArrayList<Documento>();
		ResultSetHolder ttDocumento  = new ResultSetHolder();
		
		Connection conexion = new DBConexion().getConnection();
		System.out.println("Truena");
		AppServer app = new AppServer(conexion);
		
		StringHolder  texto  = new StringHolder();
		BooleanHolder error  = new BooleanHolder();
	
		try {
			
			
			
			app.as_consultacfdi_01(cliente, Serie, Folio, ttDocumento, error, texto);
			ProResultSet rs = (ProResultSet) ttDocumento.getResultSetValue();
			System.out.println(error.getValue());
			System.out.println(texto.getValue());
			
					
			while (rs.next()) {
				int i = 1;			
				Documento documento = new Documento();
				
				documento.setFolio(rs.getInt(i++));
				documento.setSerie(rs.getString(i++));
				documento.setRfc(rs.getString(i++));
				documento.setRazon(rs.getString(i++));
				documento.setPdf(rs.getBytes(i++));
				documento.setXml(rs.getBytes(i++));				 			
			
				al_Documento.add(documento);	
				
				}
			}catch (SQLException ex1) {
				al_Documento = null;
			}finally{
				app._release();
				conexion.finalize();				
			}
			return  al_Documento; //Regresa ArrayList
		
	}
	
}
