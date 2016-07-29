package com.sinergitec.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sinergitec.model.Documento;

/**
 * Servlet implementation class Descarga
 */
@WebServlet("/PDF")
public class PDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDF() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		List<Documento> lista = (List<Documento>) session.getAttribute("ListaDocumento");
		String serie = session.getAttribute("serie").toString();
		int folio = Integer.parseInt(session.getAttribute("folio").toString());

		for (Documento obj : lista) {
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "inline;filename=" + obj.getSerie() + obj.getFolio());

			if ((obj.getFolio() == folio) && (obj.getSerie().equals(serie))) {
				// response.setContentType("pdf/plain");
				// response.setHeader("Content-Type", "application/pdf");
				response.setHeader("Content-Disposition",
						"attachment;filename=" + obj.getSerie() + obj.getFolio() + ".pdf");
				response.setContentLength((int) obj.getPdf().length);
				response.setHeader("Content-Length", String.valueOf(obj.getPdf().length));
				response.getOutputStream().write(obj.getPdf(), 0, obj.getPdf().length);
				response.getOutputStream().flush();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
