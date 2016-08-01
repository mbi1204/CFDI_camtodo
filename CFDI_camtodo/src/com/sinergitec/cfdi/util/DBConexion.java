package com.sinergitec.cfdi.util;

import java.io.IOException;

import com.progress.open4gl.Open4GLException;
import com.progress.open4gl.javaproxy.Connection;

public class DBConexion {
	
	//static String cURL = "AppServer://192.168.2.20:5162/ascamtodo";
	static String cURL = "AppServer://192.168.7.3:5163/asyacatra";
	//static String cURL = "http://mioficina.ddns.net:8080/aia/Aia?AppService=asdigital";
	 
	static Connection conexion;
	
	public static Connection getConnection() throws Open4GLException, IOException {
		conexion = new Connection(cURL,"", "",null);
		return conexion;
			
	}
	
	public static void closeConnection(Connection conexion) throws Open4GLException, IOException {
		conexion.finalize();
		conexion.releaseConnection();
		
	}

}
