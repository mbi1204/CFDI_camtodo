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
 * Servlet implementation class XML
 */
@WebServlet("/XML")
public class XML extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XML() {
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

			if ((obj.getFolio() == folio) && (obj.getSerie().equals(serie))) {

				response.setContentType("xml/plain");
				response.setHeader("Content-Type", "application/xml");
				response.setHeader("Content-Disposition",
						"attachment;filename=" + obj.getSerie() + obj.getFolio() + ".xml");
				response.setContentLength((int) obj.getXml().length);
				response.setHeader("Content-Length", String.valueOf(obj.getXml().length));
				response.getOutputStream().write(obj.getXml(), 0, obj.getXml().length);
				response.getOutputStream().flush();;
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
