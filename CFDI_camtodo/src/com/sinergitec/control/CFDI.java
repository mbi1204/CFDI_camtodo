package com.sinergitec.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.progress.open4gl.Open4GLException;
import com.sinergitec.dao.DocumentoDB;
import com.sinergitec.dao.impl.DocumentoDBImpl;
import com.sinergitec.model.Documento;

/**
 * Servlet implementation class CFDI
 */
@WebServlet("/CFDI")
public class CFDI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DocumentoDB documentoDB;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CFDI() {
        super();
        documentoDB = new DocumentoDBImpl();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("entro doGet");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entro en el doPost");
		
		String cliente   = request.getParameter("rfc");
		String serie = request.getParameter("serie");
		int folio    = Integer.parseInt (request.getParameter("folio"));
		
		try {
			
			Date ahora = new Date();
			
			List<Documento> documento =  new ArrayList<Documento>();
			documento.clear();
			
						
			documento = 	documentoDB.cargaDigitales(cliente, serie, folio);
			
									
			if (! documento.isEmpty())  {
				System.out.println("ok se encontro el cfdi " +  ahora + " "+ cliente  + " " + serie + " " + folio );					
				HttpSession session = request.getSession(true);
				session.setAttribute("ListaDocumento", null);  
				session.setAttribute("serie", null);  
				session.setAttribute("folio", null);  
				session.setAttribute("ListaDocumento",documento );
				session.setAttribute("serie",serie );
				session.setAttribute("folio",folio );				
				request.getRequestDispatcher("/consulta.jsp").forward(request, response);
			}else {
				System.out.println("no se encontro el cfdi" +  ahora + " "+ cliente  + " " + serie + " " + folio);
				request.setAttribute("error", "No se Encontro el CFDI Revise sus Datos");  
				request.getRequestDispatcher("").forward(request, response);	
				
			} 
			
		} catch (Open4GLException e) {
			// TODO Auto-generated catch block
			 
			e.printStackTrace();
			request.setAttribute("error",   e.getMessage());		
			request.getRequestDispatcher("/consulta.jsp").forward(request, response);	
			
			
		}
		
		
	}

}
